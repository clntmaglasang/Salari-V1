const http = require('http');
const https = require('https');

const PORT = 3001;

const handler = (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.writeHead(204);
    res.end();
    return;
  }

  if (req.method === 'POST' && req.url === '/api/chat') {
    let body = '';
    req.on('data', chunk => { body += chunk; });
    req.on('end', () => {
      let parsed;
      try { parsed = JSON.parse(body); } catch (e) {
        res.writeHead(400);
        res.end(JSON.stringify({ error: 'Invalid JSON' }));
        return;
      }

      const { messages } = parsed;
      const apiKey = process.env.OPENAI_API_KEY;
      if (!apiKey) {
        res.writeHead(500);
        res.end(JSON.stringify({ error: 'OPENAI_API_KEY not set' }));
        return;
      }

      const payload = JSON.stringify({
        model: 'gpt-4o-mini',
        messages: [
          {
            role: 'system',
            content: `You are Salari AI Coach, a friendly and knowledgeable personal finance assistant. 
You help users understand their spending habits, savings goals, budgeting strategies, and financial health.
Be concise, warm, and actionable. Use simple language. When relevant, give specific tips or numbers.
Keep responses under 3 short paragraphs unless the user asks for a detailed analysis.`
          },
          ...messages
        ],
        max_tokens: 500,
        stream: true,
      });

      const options = {
        hostname: 'api.openai.com',
        path: '/v1/chat/completions',
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${apiKey}`,
          'Content-Length': Buffer.byteLength(payload),
        },
      };

      res.writeHead(200, {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive',
      });

      const apiReq = https.request(options, (apiRes) => {
        // If non-200 status from OpenAI, collect full body and return useful error
        if (apiRes.statusCode !== 200) {
          let errBody = '';
          apiRes.on('data', chunk => { errBody += chunk; });
          apiRes.on('end', () => {
            try {
              const parsed = JSON.parse(errBody);
              const msg = parsed?.error?.message || 'OpenAI API error';
              res.write(`data: ${JSON.stringify({ error: msg })}\n\n`);
            } catch (_) {
              res.write(`data: ${JSON.stringify({ error: `OpenAI error (${apiRes.statusCode})` })}\n\n`);
            }
            res.end();
          });
          return;
        }
        apiRes.on('data', (chunk) => {
          res.write(chunk);
        });
        apiRes.on('end', () => {
          res.end();
        });
      });

      apiReq.on('error', (e) => {
        console.error('OpenAI request error:', e);
        res.write(`data: ${JSON.stringify({ error: e.message })}\n\n`);
        res.end();
      });

      apiReq.write(payload);
      apiReq.end();
    });
    return;
  }

  res.writeHead(404);
  res.end(JSON.stringify({ error: 'Not found' }));
};

const server = http.createServer(handler);
server.listen(PORT, '0.0.0.0', () => {
  console.log(`AI Coach proxy server running on port ${PORT}`);
});
