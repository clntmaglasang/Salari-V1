import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'report_card_child2_model.dart';
export 'report_card_child2_model.dart';

class ReportCardChild2Widget extends StatefulWidget {
  const ReportCardChild2Widget({super.key});

  @override
  State<ReportCardChild2Widget> createState() => _ReportCardChild2WidgetState();
}

class _ReportCardChild2WidgetState extends State<ReportCardChild2Widget> {
  late ReportCardChild2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportCardChild2Model());
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
      child: FlutterFlowBarChart(
        barData: [
          FFBarChartData(
            yData: ([5200.0, 4800.0, 5500.0, 5100.0, 5900.0, 5400.0]),
            color: FlutterFlowTheme.of(context).primary,
          )
        ],
        xLabels: (['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']),
        barWidth: 20.0,
        barBorderRadius: BorderRadius.circular(4.0),
        groupSpace: 12.0,
        alignment: BarChartAlignment.spaceEvenly,
        chartStylingInfo: ChartStylingInfo(
          backgroundColor: Colors.transparent,
          showBorder: false,
        ),
        axisBounds: AxisBounds(
          minY: 0.0,
          maxX: 5.0,
          maxY: 7080.0,
        ),
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
          reservedSize: 20.0,
        ),
        yAxisLabelInfo: AxisLabelInfo(
          reservedSize: 0.0,
        ),
      ),
    );
  }
}
