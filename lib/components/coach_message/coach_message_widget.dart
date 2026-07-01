import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coach_message_model.dart';
export 'coach_message_model.dart';

class CoachMessageWidget extends StatefulWidget {
  const CoachMessageWidget({
    super.key,
    String? content,
    String? time,
    bool? isAi,
  })  : this.content = content ??
            'Hello Alex! I\'ve analyzed your spending for the last 7 days. You\'ve spent 15% more on Dining Out than your usual average. Would you like to see how this affects your \'Safe To Spend\' for the rest of the month?',
        this.time = time ?? '10:02 AM',
        this.isAi = isAi ?? true;

  final String content;
  final String time;
  final bool isAi;

  @override
  State<CoachMessageWidget> createState() => _CoachMessageWidgetState();
}

class _CoachMessageWidgetState extends State<CoachMessageWidget> {
  late CoachMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 320.0,
          ),
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              valueOrDefault<bool>(
                widget.isAi,
                true,
              )
                  ? FlutterFlowTheme.of(context).secondaryBackground
                  : FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            borderRadius: BorderRadius.circular(18.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: valueOrDefault<Color>(
                valueOrDefault<bool>(
                  widget.isAi,
                  true,
                )
                    ? FlutterFlowTheme.of(context).alternate
                    : FlutterFlowTheme.of(context).primary,
                FlutterFlowTheme.of(context).alternate,
              ),
              width: valueOrDefault<double>(
                valueOrDefault<bool>(
                  widget.isAi,
                  true,
                )
                    ? 1.0
                    : 1.0,
                1.0,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.content,
                      'Hello Alex! I\'ve analyzed your spending for the last 7 days. You\'ve spent 15% more on Dining Out than your usual average. Would you like to see how this affects your \'Safe To Spend\' for the rest of the month?',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            valueOrDefault<bool>(
                              widget.isAi,
                              true,
                            )
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).onPrimary,
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1.5,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.time,
                      '10:02 AM',
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.plusJakartaSans(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            valueOrDefault<bool>(
                              widget.isAi,
                              true,
                            )
                                ? FlutterFlowTheme.of(context).secondaryText
                                : FlutterFlowTheme.of(context).onPrimary70,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                          lineHeight: 1.2,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
          ),
        ),
      ].divide(SizedBox(width: 16.0)),
    );
  }
}
