import '/components/account_pill/account_pill_widget.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/header_stat/header_stat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_dashboard_widget.dart' show MainDashboardWidget;
import 'package:flutter/material.dart';

class MainDashboardModel extends FlutterFlowModel<MainDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderStat.
  late HeaderStatModel headerStatModel1;
  // Model for HeaderStat.
  late HeaderStatModel headerStatModel2;
  // Model for AccountPill.
  late AccountPillModel accountPillModel1;
  // Model for AccountPill.
  late AccountPillModel accountPillModel2;
  // Model for AccountPill.
  late AccountPillModel accountPillModel3;
  // Model for AccountPill.
  late AccountPillModel accountPillModel4;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    headerStatModel1 = createModel(context, () => HeaderStatModel());
    headerStatModel2 = createModel(context, () => HeaderStatModel());
    accountPillModel1 = createModel(context, () => AccountPillModel());
    accountPillModel2 = createModel(context, () => AccountPillModel());
    accountPillModel3 = createModel(context, () => AccountPillModel());
    accountPillModel4 = createModel(context, () => AccountPillModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    headerStatModel1.dispose();
    headerStatModel2.dispose();
    accountPillModel1.dispose();
    accountPillModel2.dispose();
    accountPillModel3.dispose();
    accountPillModel4.dispose();
    bottomNavModel.dispose();
  }
}
