import '/components/button/button_widget.dart';
import '/components/tutorial_step/tutorial_step_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_tutorial_widget.dart' show OnboardingTutorialWidget;
import 'package:flutter/material.dart';

class OnboardingTutorialModel
    extends FlutterFlowModel<OnboardingTutorialWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for TutorialStep.
  late TutorialStepModel tutorialStepModel;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for Button.
  late ButtonModel buttonModel3;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    tutorialStepModel = createModel(context, () => TutorialStepModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    tutorialStepModel.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
  }
}
