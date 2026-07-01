import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/budget_progress_card/budget_progress_card_widget.dart';
import '/components/button/button_widget.dart';
import '/components/goal_card/goal_card_widget.dart';
import '/components/tab_group/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'budgets_goals_widget.dart' show BudgetsGoalsWidget;
import 'package:flutter/material.dart';

class BudgetsGoalsModel extends FlutterFlowModel<BudgetsGoalsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for BudgetProgressCard.
  late BudgetProgressCardModel budgetProgressCardModel1;
  // Model for BudgetProgressCard.
  late BudgetProgressCardModel budgetProgressCardModel2;
  // Model for BudgetProgressCard.
  late BudgetProgressCardModel budgetProgressCardModel3;
  // Model for BudgetProgressCard.
  late BudgetProgressCardModel budgetProgressCardModel4;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for GoalCard.
  late GoalCardModel goalCardModel1;
  // Model for GoalCard.
  late GoalCardModel goalCardModel2;
  // Model for GoalCard.
  late GoalCardModel goalCardModel3;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    tabGroupModel = createModel(context, () => TabGroupModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    budgetProgressCardModel1 =
        createModel(context, () => BudgetProgressCardModel());
    budgetProgressCardModel2 =
        createModel(context, () => BudgetProgressCardModel());
    budgetProgressCardModel3 =
        createModel(context, () => BudgetProgressCardModel());
    budgetProgressCardModel4 =
        createModel(context, () => BudgetProgressCardModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    goalCardModel1 = createModel(context, () => GoalCardModel());
    goalCardModel2 = createModel(context, () => GoalCardModel());
    goalCardModel3 = createModel(context, () => GoalCardModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    tabGroupModel.dispose();
    buttonModel1.dispose();
    budgetProgressCardModel1.dispose();
    budgetProgressCardModel2.dispose();
    budgetProgressCardModel3.dispose();
    budgetProgressCardModel4.dispose();
    buttonModel2.dispose();
    goalCardModel1.dispose();
    goalCardModel2.dispose();
    goalCardModel3.dispose();
    bottomNavModel.dispose();
  }
}
