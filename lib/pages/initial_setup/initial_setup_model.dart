import '/components/button/button_widget.dart';
import '/components/currency_option/currency_option_widget.dart';
import '/components/setup_step/setup_step_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'initial_setup_widget.dart' show InitialSetupWidget;
import 'package:flutter/material.dart';

class InitialSetupModel extends FlutterFlowModel<InitialSetupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for SetupStep.
  late SetupStepModel setupStepModel1;
  // Model for TextField.
  late TextFieldModel textFieldModel1;
  // Model for CurrencyOption.
  late CurrencyOptionModel currencyOptionModel1;
  // Model for CurrencyOption.
  late CurrencyOptionModel currencyOptionModel2;
  // Model for CurrencyOption.
  late CurrencyOptionModel currencyOptionModel3;
  // Model for CurrencyOption.
  late CurrencyOptionModel currencyOptionModel4;
  // Model for SetupStep.
  late SetupStepModel setupStepModel2;
  // Model for TextField.
  late TextFieldModel textFieldModel2;
  // Model for TextField.
  late TextFieldModel textFieldModel3;
  // State field(s) for Dropdown widget.
  String? dropdownValue;
  FormFieldController<String>? dropdownValueController;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    setupStepModel1 = createModel(context, () => SetupStepModel());
    textFieldModel1 = createModel(context, () => TextFieldModel());
    currencyOptionModel1 = createModel(context, () => CurrencyOptionModel());
    currencyOptionModel2 = createModel(context, () => CurrencyOptionModel());
    currencyOptionModel3 = createModel(context, () => CurrencyOptionModel());
    currencyOptionModel4 = createModel(context, () => CurrencyOptionModel());
    setupStepModel2 = createModel(context, () => SetupStepModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
    textFieldModel3 = createModel(context, () => TextFieldModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    setupStepModel1.dispose();
    textFieldModel1.dispose();
    currencyOptionModel1.dispose();
    currencyOptionModel2.dispose();
    currencyOptionModel3.dispose();
    currencyOptionModel4.dispose();
    setupStepModel2.dispose();
    textFieldModel2.dispose();
    textFieldModel3.dispose();
    buttonModel2.dispose();
  }
}
