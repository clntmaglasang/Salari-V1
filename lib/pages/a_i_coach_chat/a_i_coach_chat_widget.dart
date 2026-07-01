import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/coach_message/coach_message_widget.dart';
import '/components/suggestion_chip/suggestion_chip_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/services/ai_coach_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a_i_coach_chat_model.dart';
export 'a_i_coach_chat_model.dart';

class AICoachChatWidget extends StatefulWidget {
  const AICoachChatWidget({super.key});

  static String routeName = 'AICoachChat';
  static String routePath = '/aICoachChat';

  @override
  State<AICoachChatWidget> createState() => _AICoachChatWidgetState();
}

class _AICoachChatWidgetState extends State<AICoachChatWidget> {
  late AICoachChatModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _inputController = TextEditingController();

  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String _streamingText = '';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AICoachChatModel());
    _addWelcomeMessage();
  }

  void _addWelcomeMessage() {
    _messages.add(ChatMessage(
      role: 'assistant',
      content:
          'Hello! I\'m your Salari AI Coach. I can help you with budgeting, savings goals, spending analysis, and any financial questions. What would you like to explore today?',
      timestamp: DateTime.now(),
    ));
  }

  @override
  void dispose() {
    _model.dispose();
    _scrollController.dispose();
    _inputController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _isLoading) return;

    _inputController.clear();

    setState(() {
      _messages.add(ChatMessage(
        role: 'user',
        content: trimmed,
        timestamp: DateTime.now(),
      ));
      _isLoading = true;
      _streamingText = '';
    });
    _scrollToBottom();

    try {
      final stream = await AiCoachService.sendMessage(_messages
          .where((m) => m.role == 'user' || m.role == 'assistant')
          .toList());

      final StringBuffer buffer = StringBuffer();

      await for (final chunk in stream) {
        buffer.write(chunk);
        if (mounted) {
          setState(() {
            _streamingText = buffer.toString();
          });
          _scrollToBottom();
        }
      }

      final fullResponse = buffer.toString();
      if (mounted) {
        setState(() {
          _messages.add(ChatMessage(
            role: 'assistant',
            content: fullResponse,
            timestamp: DateTime.now(),
          ));
          _streamingText = '';
          _isLoading = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        final msg = e.toString().contains('quota') || e.toString().contains('exceeded')
            ? 'Your OpenAI account has run out of credits. Please add credits at platform.openai.com/settings/billing and try again.'
            : 'Sorry, I couldn\'t reach the AI service right now. Please check your connection and try again.';
        setState(() {
          _messages.add(ChatMessage(
            role: 'assistant',
            content: msg,
            timestamp: DateTime.now(),
          ));
          _streamingText = '';
          _isLoading = false;
        });
        _scrollToBottom();
      }
    }
  }

  String _formatTime(DateTime time) {
    final h = time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final m = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(24.0),
                itemCount: _messages.length + (_isLoading ? 1 : 0),
                separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  if (index == _messages.length && _isLoading) {
                    return _streamingText.isEmpty
                        ? _buildTypingIndicator(context)
                        : CoachMessageWidget(
                            content: _streamingText,
                            time: _formatTime(DateTime.now()),
                            isAi: true,
                          );
                  }
                  final msg = _messages[index];
                  return CoachMessageWidget(
                    content: msg.content,
                    time: _formatTime(msg.timestamp),
                    isAi: msg.role == 'assistant',
                  );
                },
              ),
            ),
            _buildInputArea(context),
            wrapWithModel(
              model: _model.bottomNavModel,
              updateCallback: () => safeSetState(() {}),
              child: BottomNavWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary10,
                        borderRadius: BorderRadius.circular(9999.0),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.auto_awesome_rounded,
                        color: FlutterFlowTheme.of(context).onPrimary,
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salari AI Coach',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.4,
                              ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).success,
                                borderRadius: BorderRadius.circular(9999.0),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              _isLoading ? 'Thinking...' : 'Online',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: Colors.transparent,
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () {
                    setState(() {
                      _messages.clear();
                      _streamingText = '';
                      _isLoading = false;
                      _addWelcomeMessage();
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Row(
            children: [
              _dot(context, delay: 0),
              const SizedBox(width: 4),
              _dot(context, delay: 200),
              const SizedBox(width: 4),
              _dot(context, delay: 400),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dot(BuildContext context, {required int delay}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.4, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (_, val, child) => Opacity(opacity: val, child: child),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryText,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    final suggestions = [
      'How can I save more?',
      'Analyze my spending',
      'Tips to reduce debt',
      'Build an emergency fund',
    ];

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        children: [
          Container(height: 1.0, color: FlutterFlowTheme.of(context).alternate),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
            child: Text(
              'Suggested Questions',
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.plusJakartaSans(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          SizedBox(
            height: 44.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: suggestions.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8.0),
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => _sendMessage(suggestions[i]),
                child: SuggestionChipWidget(label: suggestions[i]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16.0),
                        Icon(
                          Icons.psychology_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            controller: _inputController,
                            decoration: InputDecoration(
                              hintText: 'Ask Salari Coach anything...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(),
                                  letterSpacing: 0.0,
                                ),
                            onSubmitted: _sendMessage,
                            textInputAction: TextInputAction.send,
                            enabled: !_isLoading,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () => _sendMessage(_inputController.text),
                  child: Container(
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: _isLoading
                          ? FlutterFlowTheme.of(context).alternate
                          : FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: FlutterFlowTheme.of(context).onPrimary,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
