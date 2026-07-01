import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/bottom_nav_child5/bottom_nav_child5_widget.dart';
import '/components/button/button_widget.dart';
import '/components/insight_item/insight_item_widget.dart';
import '/components/pie_chart/pie_chart_widget.dart';
import '/components/report_card/report_card_widget.dart';
import '/components/report_card_child/report_card_child_widget.dart';
import '/components/report_card_child2/report_card_child2_widget.dart';
import '/components/report_card_child3/report_card_child3_widget.dart';
import '/components/tab_group/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'analytics_reports_model.dart';
export 'analytics_reports_model.dart';

class AnalyticsReportsWidget extends StatefulWidget {
  const AnalyticsReportsWidget({super.key});

  static String routeName = 'AnalyticsReports';
  static String routePath = '/analyticsReports';

  @override
  State<AnalyticsReportsWidget> createState() => _AnalyticsReportsWidgetState();
}

class _AnalyticsReportsWidgetState extends State<AnalyticsReportsWidget> {
  late AnalyticsReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticsReportsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Analytics',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                        lineHeight: 1.25,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 12.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.calendar_today_rounded,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 12.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.share_rounded,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ],
                            ),
                            wrapWithModel(
                              model: _model.tabGroupModel,
                              updateCallback: () => safeSetState(() {}),
                              child: TabGroupWidget(
                                label2: 'Salary Cycle',
                                label2Present: true,
                                label3: 'Yearly',
                                label3Present: true,
                                label4: '',
                                label4Present: false,
                                label5: '',
                                label5Present: false,
                                label1: 'Monthly',
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).tertiary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 70.0,
                                          height: 70.0,
                                          child: wrapWithModel(
                                            model: _model.pieChartModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: PieChartWidget(
                                              centerValue: '82',
                                              centerValuePresent: true,
                                              centerLabel: '',
                                              centerLabelPresent: false,
                                              data: '82,18',
                                              labels:
                                                  'Product,Services,Marketing,Other',
                                              colors:
                                                  'on_primary,on_primary/30',
                                              animate: false,
                                              startAngle: -90.0,
                                              variant: 'donut',
                                              size: 'compact',
                                              legend: 'hidden',
                                              legendValue: 'percent',
                                              ring: 'thick',
                                              gap: 'normal',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Financial Health Score',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onPrimary80,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.3,
                                                        ),
                                              ),
                                              Text(
                                                'Excellent',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onPrimary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                          lineHeight: 1.3,
                                                        ),
                                              ),
                                              Text(
                                                'You spent 12% less on dining out this week.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .onPrimary90,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.reportCardModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ReportCardWidget(
                                  subtitle: 'Top categories this month',
                                  title: 'Spending Breakdown',
                                  child: () => ReportCardChildWidget(),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.reportCardModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ReportCardWidget(
                                  subtitle: 'Income vs Expenses',
                                  title: 'Cash Flow',
                                  child: () => ReportCardChild2Widget(),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.reportCardModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: ReportCardWidget(
                                  subtitle: 'Last 6 months performance',
                                  title: 'Net Worth Growth',
                                  child: () => ReportCardChild3Widget(),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'AI Insights',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                  wrapWithModel(
                                    model: _model.insightItemModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InsightItemWidget(
                                      icon: Icon(
                                        Icons.savings_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        size: 20.0,
                                      ),
                                      label: 'Savings Rate',
                                      tone:
                                          FlutterFlowTheme.of(context).success,
                                      trend: '+4.2%',
                                      value: '24.5%',
                                      positive: true,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.insightItemModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InsightItemWidget(
                                      icon: Icon(
                                        Icons.shopping_cart_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        size: 20.0,
                                      ),
                                      label: 'Discretionary',
                                      tone: FlutterFlowTheme.of(context).error,
                                      trend: '+12.0%',
                                      value: '\$1,240',
                                      positive: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.insightItemModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InsightItemWidget(
                                      icon: Icon(
                                        Icons.account_balance_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        size: 20.0,
                                      ),
                                      label: 'Debt Ratio',
                                      tone:
                                          FlutterFlowTheme.of(context).primary,
                                      trend: '-2.1%',
                                      value: '15.2%',
                                      positive: true,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                              wrapWithModel(
                                model: _model.buttonModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ButtonWidget(
                                  icon: Icon(
                                    Icons.description_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  iconPresent: true,
                                  iconEndPresent: false,
                                  content: 'Generate Full PDF Report',
                                  variant: 'outline',
                                  size: 'medium',
                                  fullWidth: true,
                                  loading: false,
                                  disabled: false,
                                ),
                              ),
                              Container(
                                height: 80.0,
                              ),
                            ].divide(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                child: wrapWithModel(
                  model: _model.bottomNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomNavWidget(
                    child: () => BottomNavChild5Widget(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
