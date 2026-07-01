import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'social_button_model.dart';
export 'social_button_model.dart';

class SocialButtonWidget extends StatefulWidget {
  const SocialButtonWidget({
    super.key,
    Color? brandColor,
    String? iconSlug,
    String? label,
  })  : this.brandColor = brandColor ?? const Color(0x00000000),
        this.iconSlug = iconSlug ?? 'https://cdn.simpleicons.org/google.svg',
        this.label = label ?? 'Google';

  final Color brandColor;
  final String iconSlug;
  final String label;

  @override
  State<SocialButtonWidget> createState() => _SocialButtonWidgetState();
}

IconData _iconForSlug(String slug) {
  final lower = slug.toLowerCase();
  if (lower.contains('apple')) return FontAwesomeIcons.apple;
  if (lower.contains('google')) return FontAwesomeIcons.google;
  if (lower.contains('facebook')) return FontAwesomeIcons.facebook;
  if (lower.contains('twitter') || lower.contains('x.com')) return FontAwesomeIcons.xTwitter;
  if (lower.contains('github')) return FontAwesomeIcons.github;
  return FontAwesomeIcons.rightToBracket;
}

class _SocialButtonWidgetState extends State<SocialButtonWidget> {
  late SocialButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                _iconForSlug(widget.iconSlug),
                size: 20.0,
                color: widget.brandColor,
              ),
              Text(
                valueOrDefault<String>(
                  widget.label,
                  'Google',
                ),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      lineHeight: 1.3,
                    ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}
