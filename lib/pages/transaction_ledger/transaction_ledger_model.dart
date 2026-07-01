import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/date_header/date_header_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/components/transaction_item/transaction_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transaction_ledger_widget.dart' show TransactionLedgerWidget;
import 'package:flutter/material.dart';

class TransactionLedgerModel extends FlutterFlowModel<TransactionLedgerWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for DateHeader.
  late DateHeaderModel dateHeaderModel1;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel1;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel2;
  // Model for DateHeader.
  late DateHeaderModel dateHeaderModel2;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel3;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel4;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel5;
  // Model for DateHeader.
  late DateHeaderModel dateHeaderModel3;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel6;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel7;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel8;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    dateHeaderModel1 = createModel(context, () => DateHeaderModel());
    transactionItemModel1 = createModel(context, () => TransactionItemModel());
    transactionItemModel2 = createModel(context, () => TransactionItemModel());
    dateHeaderModel2 = createModel(context, () => DateHeaderModel());
    transactionItemModel3 = createModel(context, () => TransactionItemModel());
    transactionItemModel4 = createModel(context, () => TransactionItemModel());
    transactionItemModel5 = createModel(context, () => TransactionItemModel());
    dateHeaderModel3 = createModel(context, () => DateHeaderModel());
    transactionItemModel6 = createModel(context, () => TransactionItemModel());
    transactionItemModel7 = createModel(context, () => TransactionItemModel());
    transactionItemModel8 = createModel(context, () => TransactionItemModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    dateHeaderModel1.dispose();
    transactionItemModel1.dispose();
    transactionItemModel2.dispose();
    dateHeaderModel2.dispose();
    transactionItemModel3.dispose();
    transactionItemModel4.dispose();
    transactionItemModel5.dispose();
    dateHeaderModel3.dispose();
    transactionItemModel6.dispose();
    transactionItemModel7.dispose();
    transactionItemModel8.dispose();
    bottomNavModel.dispose();
  }
}
