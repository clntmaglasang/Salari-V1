import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/insight_item/insight_item_widget.dart';
import '/components/pie_chart/pie_chart_widget.dart';
import '/components/report_card/report_card_widget.dart';
import '/components/tab_group/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'analytics_reports_widget.dart' show AnalyticsReportsWidget;
import 'package:flutter/material.dart';

class AnalyticsReportsModel extends FlutterFlowModel<AnalyticsReportsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for PieChart.
  late PieChartModel pieChartModel;
  // Model for ReportCard.
  late ReportCardModel reportCardModel1;
  // Model for ReportCard.
  late ReportCardModel reportCardModel2;
  // Model for ReportCard.
  late ReportCardModel reportCardModel3;
  // Model for InsightItem.
  late InsightItemModel insightItemModel1;
  // Model for InsightItem.
  late InsightItemModel insightItemModel2;
  // Model for InsightItem.
  late InsightItemModel insightItemModel3;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    tabGroupModel = createModel(context, () => TabGroupModel());
    pieChartModel = createModel(context, () => PieChartModel());
    reportCardModel1 = createModel(context, () => ReportCardModel());
    reportCardModel2 = createModel(context, () => ReportCardModel());
    reportCardModel3 = createModel(context, () => ReportCardModel());
    insightItemModel1 = createModel(context, () => InsightItemModel());
    insightItemModel2 = createModel(context, () => InsightItemModel());
    insightItemModel3 = createModel(context, () => InsightItemModel());
    buttonModel = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    tabGroupModel.dispose();
    pieChartModel.dispose();
    reportCardModel1.dispose();
    reportCardModel2.dispose();
    reportCardModel3.dispose();
    insightItemModel1.dispose();
    insightItemModel2.dispose();
    insightItemModel3.dispose();
    buttonModel.dispose();
    bottomNavModel.dispose();
  }
}
