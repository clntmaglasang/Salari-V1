import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'setup_step_model.dart';
export 'setup_step_model.dart';

class SetupStepWidget extends StatefulWidget {
  const SetupStepWidget({
    super.key,
    String? subtitle,
    String? title,
    String? currentStep,
  })  : this.subtitle = subtitle ?? 'GLOBAL SETTINGS',
        this.title = title ?? 'Choose your currency',
        this.currentStep = currentStep ?? '1';

  final String subtitle;
  final String title;
  final String currentStep;

  @override
  State<SetupStepWidget> createState() => _SetupStepWidgetState();
}

class _SetupStepWidgetState extends State<SetupStepWidget> {
  late SetupStepModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetupStepModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                'Step ${widget.currentStep} of 2',
                'Step 1 of 2',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    lineHeight: 1.2,
                  ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary10,
                  borderRadius: BorderRadius.circular(9999.0),
                  shape: BoxShape.rectangle,
                ),
                child: Container(
                  width: 360.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(9999.0),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
        Text(
          valueOrDefault<String>(
            widget.subtitle,
            'GLOBAL SETTINGS',
          ),
          style: FlutterFlowTheme.of(context).bodySmall.override(
                font: GoogleFonts.inter(
                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                lineHeight: 1.5,
              ),
        ),
        Text(
          valueOrDefault<String>(
            widget.title,
            'Choose your currency',
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                lineHeight: 1.3,
              ),
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
