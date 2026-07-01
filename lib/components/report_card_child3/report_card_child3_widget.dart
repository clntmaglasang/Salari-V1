import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'report_card_child3_model.dart';
export 'report_card_child3_model.dart';

class ReportCardChild3Widget extends StatefulWidget {
  const ReportCardChild3Widget({super.key});

  @override
  State<ReportCardChild3Widget> createState() => _ReportCardChild3WidgetState();
}

class _ReportCardChild3WidgetState extends State<ReportCardChild3Widget> {
  late ReportCardChild3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportCardChild3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: FlutterFlowLineChart(
        data: [
          FFLineChartData(
            xData: ([0.0, 1.0, 2.0, 3.0, 4.0, 5.0]),
            yData: ([24000.0, 25500.0, 25200.0, 27800.0, 29100.0, 31500.0]),
            settings: LineChartBarData(
              color: FlutterFlowTheme.of(context).success,
              barWidth: 2.0,
              isCurved: true,
              belowBarData: BarAreaData(
                show: true,
                color: FlutterFlowTheme.of(context).success10,
              ),
            ),
          )
        ],
        chartStylingInfo: ChartStylingInfo(
          backgroundColor: Colors.transparent,
          showBorder: false,
        ),
        axisBounds: AxisBounds(
          minX: 0.0,
          minY: 0.0,
          maxX: 5.0,
          maxY: 37800.0,
        ),
        xLabels: (['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']),
        xAxisLabelInfo: AxisLabelInfo(
          showLabels: true,
          labelTextStyle: FlutterFlowTheme.of(context).bodySmall.override(
                font: GoogleFonts.inter(
                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 10.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                lineHeight: 1.0,
              ),
          reservedSize: 28.0,
        ),
        yAxisLabelInfo: AxisLabelInfo(
          reservedSize: 0.0,
        ),
      ),
    );
  }
}
