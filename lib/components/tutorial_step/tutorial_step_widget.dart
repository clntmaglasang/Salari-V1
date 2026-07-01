import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'tutorial_step_model.dart';
export 'tutorial_step_model.dart';

class TutorialStepWidget extends StatefulWidget {
  const TutorialStepWidget({
    super.key,
    String? description,
    String? lottieDesc,
    String? title,
  })  : this.description = description ??
            'Salari isn\'t just a tracker. We help you build the habits that lead to true financial freedom.',
        this.lottieDesc = lottieDesc ??
            'https://dimg.dreamflow.cloud/v1/lottie/friendly+AI+robot+teaching+finance',
        this.title = title ?? 'Your Daily Financial Habit Coach';

  final String description;
  final String lottieDesc;
  final String title;

  @override
  State<TutorialStepWidget> createState() => _TutorialStepWidgetState();
}

class _TutorialStepWidgetState extends State<TutorialStepWidget> {
  late TutorialStepModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TutorialStepModel());
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 320.0,
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Lottie.network(
            valueOrDefault<String>(
              widget.lottieDesc,
              'https://dimg.dreamflow.cloud/v1/lottie/friendly+AI+robot+teaching+finance',
            ),
            width: 300.0,
            height: 300.0,
            fit: BoxFit.contain,
            animate: true,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.title,
                  'Your Daily Financial Habit Coach',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                      lineHeight: 1.25,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.description,
                  'Salari isn\'t just a tracker. We help you build the habits that lead to true financial freedom.',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      lineHeight: 1.6,
                    ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ].divide(SizedBox(height: 24.0)),
    );
  }
}
