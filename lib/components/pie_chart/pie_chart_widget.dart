import '/components/chart_legend/chart_legend_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pie_chart_model.dart';
export 'pie_chart_model.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({
    super.key,
    String? centerValue,
    bool? centerValuePresent,
    String? centerLabel,
    bool? centerLabelPresent,
    String? data,
    String? labels,
    String? colors,
    bool? animate,
    double? startAngle,
    String? variant,
    String? size,
    String? legend,
    String? legendValue,
    String? ring,
    String? gap,
  })  : this.centerValue = centerValue ?? '82',
        this.centerValuePresent = centerValuePresent ?? true,
        this.centerLabel = centerLabel ?? '',
        this.centerLabelPresent = centerLabelPresent ?? false,
        this.data = data ?? '82,18',
        this.labels = labels ?? 'Product,Services,Marketing,Other',
        this.colors = colors ?? 'on_primary,on_primary/30',
        this.animate = animate ?? false,
        this.startAngle = startAngle ?? -90.0,
        this.variant = variant ?? 'donut',
        this.size = size ?? 'compact',
        this.legend = legend ?? 'hidden',
        this.legendValue = legendValue ?? 'percent',
        this.ring = ring ?? 'thick',
        this.gap = gap ?? 'normal';

  final String centerValue;
  final bool centerValuePresent;
  final String centerLabel;
  final bool centerLabelPresent;
  final String data;
  final String labels;
  final String colors;
  final bool animate;
  final double startAngle;
  final String variant;
  final String size;
  final String legend;
  final String legendValue;
  final String ring;
  final String gap;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  late PieChartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PieChartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  /// Helper function to parse comma-separated data string into list of doubles
  List<double> _parseDataValues(String dataString) {
    return dataString
        .split(',')
        .map((value) => double.tryParse(value.trim()) ?? 0.0)
        .toList();
  }

  /// Helper function to get chart dimensions based on size parameter
  double _getChartDimension(String sizeString) {
    switch (sizeString) {
      case 'compact':
        return 120.0;
      case 'large':
        return 200.0;
      case 'expanded':
        return double.infinity;
      default:
        return 156.0;
    }
  }

  /// Helper function to get section spacing based on gap parameter
  double _getSectionsSpace(String gapString) {
    switch (gapString) {
      case 'none':
        return 0.0;
      case 'tight':
        return 2.0;
      case 'wide':
        return 8.0;
      default:
        return 4.0;
    }
  }

  /// Helper function to determine if donut variant should be displayed
  bool _isDonutVariant(String variantString) {
    return variantString != 'pie';
  }

  /// Helper function to determine if pie variant should be displayed
  bool _isPieVariant(String variantString) {
    return variantString == 'pie';
  }

  /// Helper function to determine if legend should be shown on right
  bool _isLegendRight(String legendString) {
    return legendString == 'right';
  }

  /// Helper function to determine if legend should be shown on bottom
  bool _isLegendBottom(String legendString) {
    return legendString != 'right' && legendString != 'hidden';
  }

  @override
  Widget build(BuildContext context) {
    // Normalize all widget parameters into guaranteed non-null local variables
    final centerValue = widget.centerValue;
    final centerValuePresent = widget.centerValuePresent;
    final centerLabel = widget.centerLabel;
    final centerLabelPresent = widget.centerLabelPresent;
    final dataString = widget.data;
    final labelsString = widget.labels;
    final colorsString = widget.colors;
    final variantString = widget.variant;
    final sizeString = widget.size;
    final legendString = widget.legend;
    final gapString = widget.gap;
    final startAngle = widget.startAngle;

    // Pre-compute derived values
    final dataValues = _parseDataValues(dataString);
    final chartDimension = _getChartDimension(sizeString);
    final sectionsSpace = _getSectionsSpace(gapString);
    final isDonut = _isDonutVariant(variantString);
    final isPie = _isPieVariant(variantString);
    final showLegendRight = _isLegendRight(legendString);
    final showLegendBottom = _isLegendBottom(legendString);

    final pieChartPieChartColorsList1 = [
      FlutterFlowTheme.of(context).primary,
      FlutterFlowTheme.of(context).secondary,
      FlutterFlowTheme.of(context).tertiary
    ];
    final pieChartPieChartColorsList2 = [
      FlutterFlowTheme.of(context).primary,
      FlutterFlowTheme.of(context).secondary,
      FlutterFlowTheme.of(context).tertiary
    ];

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    // Donut chart variant
                    if (isDonut)
                      Container(
                        width: chartDimension,
                        height: chartDimension,
                        child: FlutterFlowPieChart(
                          data: FFPieChartData(
                            values: dataValues,
                            colors: pieChartPieChartColorsList1,
                            radius: [50.0],
                          ),
                          donutHoleRadius: 30.0,
                          donutHoleColor: Colors.transparent,
                          sectionLabelStyle:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                          sectionsSpace: sectionsSpace,
                          startDegreeOffset: startAngle,
                          labelPositionOffset: 0.6,
                        ),
                      ),
                    // Pie chart variant
                    if (isPie)
                      Container(
                        width: chartDimension,
                        height: chartDimension,
                        child: FlutterFlowPieChart(
                          data: FFPieChartData(
                            values: dataValues,
                            colors: pieChartPieChartColorsList2,
                            radius: [50.0],
                          ),
                          donutHoleRadius: 0.0,
                          donutHoleColor: Colors.transparent,
                          sectionLabelStyle:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                          sectionsSpace: sectionsSpace,
                          startDegreeOffset: startAngle,
                          labelPositionOffset: 0.6,
                        ),
                      ),
                    // Center value and label overlay (donut only)
                    if (isDonut)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (centerValuePresent)
                            Text(
                              centerValue,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                            ),
                          if (centerLabelPresent)
                            Text(
                              centerLabel,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                            ),
                        ].divide(SizedBox(height: 0.0)),
                      ),
                  ],
                ),
                // Right legend
                if (showLegendRight)
                  wrapWithModel(
                    model: _model.chartLegendModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ChartLegendWidget(
                      data: dataString,
                      labels: labelsString,
                      colors: colorsString,
                      markerSize: 8.0,
                      spacing: 6.0,
                      runSpacing: 8.0,
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      valueColor: FlutterFlowTheme.of(context).secondaryText,
                      textStyle: 'label_small',
                      valueStyle: 'label_small',
                      labelMaxWidth: 0.0,
                      direction: 'vertical',
                      valueMode: 'percent',
                    ),
                  ),
              ],
            ),
          ),
          // Bottom legend
          if (showLegendBottom)
            wrapWithModel(
              model: _model.chartLegendModel2,
              updateCallback: () => safeSetState(() {}),
              child: ChartLegendWidget(
                data: dataString,
                labels: labelsString,
                colors: colorsString,
                markerSize: 8.0,
                spacing: 6.0,
                runSpacing: 8.0,
                labelColor: FlutterFlowTheme.of(context).primaryText,
                valueColor: FlutterFlowTheme.of(context).secondaryText,
                textStyle: 'label_small',
                valueStyle: 'label_small',
                labelMaxWidth: 0.0,
                direction: 'horizontal',
                valueMode: 'percent',
              ),
            ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
