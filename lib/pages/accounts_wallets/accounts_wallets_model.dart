import '/components/account_card/account_card_widget.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/tab_group/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'accounts_wallets_widget.dart' show AccountsWalletsWidget;
import 'package:flutter/material.dart';

class AccountsWalletsModel extends FlutterFlowModel<AccountsWalletsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for AccountCard.
  late AccountCardModel accountCardModel1;
  // Model for AccountCard.
  late AccountCardModel accountCardModel2;
  // Model for AccountCard.
  late AccountCardModel accountCardModel3;
  // Model for AccountCard.
  late AccountCardModel accountCardModel4;
  // Model for AccountCard.
  late AccountCardModel accountCardModel5;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    tabGroupModel = createModel(context, () => TabGroupModel());
    accountCardModel1 = createModel(context, () => AccountCardModel());
    accountCardModel2 = createModel(context, () => AccountCardModel());
    accountCardModel3 = createModel(context, () => AccountCardModel());
    accountCardModel4 = createModel(context, () => AccountCardModel());
    accountCardModel5 = createModel(context, () => AccountCardModel());
    buttonModel = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    tabGroupModel.dispose();
    accountCardModel1.dispose();
    accountCardModel2.dispose();
    accountCardModel3.dispose();
    accountCardModel4.dispose();
    accountCardModel5.dispose();
    buttonModel.dispose();
    bottomNavModel.dispose();
  }
}
