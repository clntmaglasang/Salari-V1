import '/components/bottom_nav/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_coach_chat_widget.dart' show AICoachChatWidget;
import 'package:flutter/material.dart';

class AICoachChatModel extends FlutterFlowModel<AICoachChatWidget> {
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    bottomNavModel.dispose();
  }
}
