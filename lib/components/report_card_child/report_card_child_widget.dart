import '/components/pie_chart/pie_chart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'report_card_child_model.dart';
export 'report_card_child_model.dart';

class ReportCardChildWidget extends StatefulWidget {
  const ReportCardChildWidget({super.key});

  @override
  State<ReportCardChildWidget> createState() => _ReportCardChildWidgetState();
}

class _ReportCardChildWidgetState extends State<ReportCardChildWidget> {
  late ReportCardChildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportCardChildModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.pieChartModel,
      updateCallback: () => safeSetState(() {}),
      child: PieChartWidget(
        centerValue: '',
        centerValuePresent: false,
        centerLabel: '',
        centerLabelPresent: false,
        data: '45,25,15,10,5',
        labels: 'Housing,Food,Transport,Utilities,Misc',
        colors: 'primary,accent,success,warning,secondary',
        animate: false,
        startAngle: -90.0,
        variant: 'donut',
        size: 'medium',
        legend: 'right',
        legendValue: 'percent',
        ring: 'medium',
        gap: 'normal',
      ),
    );
  }
}
