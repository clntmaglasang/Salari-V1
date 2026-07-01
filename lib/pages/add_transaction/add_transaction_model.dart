import '/components/button/button_widget.dart';
import '/components/category_chip/category_chip_widget.dart';
import '/components/switch_component/switch_component_widget.dart';
import '/components/tab_group/tab_group_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_transaction_widget.dart' show AddTransactionWidget;
import 'package:flutter/material.dart';

class AddTransactionModel extends FlutterFlowModel<AddTransactionWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for TextField.
  late TextFieldModel textFieldModel1;
  // Model for TextField.
  late TextFieldModel textFieldModel2;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel1;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel2;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel3;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel4;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel5;
  // Model for TextField.
  late TextFieldModel textFieldModel3;
  // Model for Switch.
  late SwitchComponentModel switchModel1;
  // Model for Switch.
  late SwitchComponentModel switchModel2;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    tabGroupModel = createModel(context, () => TabGroupModel());
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
    categoryChipModel1 = createModel(context, () => CategoryChipModel());
    categoryChipModel2 = createModel(context, () => CategoryChipModel());
    categoryChipModel3 = createModel(context, () => CategoryChipModel());
    categoryChipModel4 = createModel(context, () => CategoryChipModel());
    categoryChipModel5 = createModel(context, () => CategoryChipModel());
    textFieldModel3 = createModel(context, () => TextFieldModel());
    switchModel1 = createModel(context, () => SwitchComponentModel());
    switchModel2 = createModel(context, () => SwitchComponentModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    tabGroupModel.dispose();
    textFieldModel1.dispose();
    textFieldModel2.dispose();
    categoryChipModel1.dispose();
    categoryChipModel2.dispose();
    categoryChipModel3.dispose();
    categoryChipModel4.dispose();
    categoryChipModel5.dispose();
    textFieldModel3.dispose();
    switchModel1.dispose();
    switchModel2.dispose();
    buttonModel2.dispose();
  }
}
