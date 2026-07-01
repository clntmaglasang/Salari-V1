import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/coach_message/coach_message_widget.dart';
import '/components/suggestion_chip/suggestion_chip_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_coach_chat_widget.dart' show AICoachChatWidget;
import 'package:flutter/material.dart';

class AICoachChatModel extends FlutterFlowModel<AICoachChatWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CoachMessage.
  late CoachMessageModel coachMessageModel1;
  // Model for CoachMessage.
  late CoachMessageModel coachMessageModel2;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for CoachMessage.
  late CoachMessageModel coachMessageModel3;
  // Model for SuggestionChip.
  late SuggestionChipModel suggestionChipModel1;
  // Model for SuggestionChip.
  late SuggestionChipModel suggestionChipModel2;
  // Model for SuggestionChip.
  late SuggestionChipModel suggestionChipModel3;
  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    coachMessageModel1 = createModel(context, () => CoachMessageModel());
    coachMessageModel2 = createModel(context, () => CoachMessageModel());
    buttonModel = createModel(context, () => ButtonModel());
    coachMessageModel3 = createModel(context, () => CoachMessageModel());
    suggestionChipModel1 = createModel(context, () => SuggestionChipModel());
    suggestionChipModel2 = createModel(context, () => SuggestionChipModel());
    suggestionChipModel3 = createModel(context, () => SuggestionChipModel());
    textFieldModel = createModel(context, () => TextFieldModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    coachMessageModel1.dispose();
    coachMessageModel2.dispose();
    buttonModel.dispose();
    coachMessageModel3.dispose();
    suggestionChipModel1.dispose();
    suggestionChipModel2.dispose();
    suggestionChipModel3.dispose();
    textFieldModel.dispose();
    bottomNavModel.dispose();
  }
}
