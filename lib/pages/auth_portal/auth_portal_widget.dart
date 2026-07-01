import '/components/button/button_widget.dart';
import '/components/checkbox/checkbox_widget.dart';
import '/components/social_button/social_button_widget.dart';
import '/components/tab_group/tab_group_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/nav/nav.dart';
import '/index.dart';
import '/services/local_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_portal_model.dart';
export 'auth_portal_model.dart';

class AuthPortalWidget extends StatefulWidget {
  const AuthPortalWidget({super.key});

  static String routeName = 'AuthPortal';
  static String routePath = '/authPortal';

  @override
  State<AuthPortalWidget> createState() => _AuthPortalWidgetState();
}

class _AuthPortalWidgetState extends State<AuthPortalWidget> {
  late AuthPortalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _auth = LocalAuthService();

  // 0 = Login, 1 = Register
  int _selectedTab = 0;
  bool _isLoading = false;

  // Register-only name field
  final _nameController = TextEditingController();
  final _nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthPortalModel());
    _auth.initialize();
    // Default to Register tab if no account yet
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_auth.hasAccount) {
        setState(() => _selectedTab = 1);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _nameController.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  void _showSnack(String message, {bool isError = true}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? FlutterFlowTheme.of(context).error
            : FlutterFlowTheme.of(context).success,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _handleLogin() async {
    final email = _model.textFieldModel1.inputTextController?.text ?? '';
    final password = _model.textFieldModel2.inputTextController?.text ?? '';

    if (email.isEmpty) { _showSnack('Please enter your email'); return; }
    if (password.isEmpty) { _showSnack('Please enter your password'); return; }

    setState(() => _isLoading = true);
    final error = await _auth.signIn(email: email, password: password);
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (error != null) {
      _showSnack(error);
    } else {
      AppStateNotifier.instance.setLoggedIn(true);
      context.goNamed(MainDashboardWidget.routeName);
    }
  }

  Future<void> _handleRegister() async {
    final email = _model.textFieldModel1.inputTextController?.text ?? '';
    final password = _model.textFieldModel2.inputTextController?.text ?? '';
    final name = _nameController.text;

    if (name.trim().isEmpty) { _showSnack('Please enter your name'); return; }
    if (email.isEmpty) { _showSnack('Please enter your email'); return; }
    if (password.isEmpty) { _showSnack('Please choose a password'); return; }

    setState(() => _isLoading = true);
    final error = await _auth.register(
      email: email,
      password: password,
      name: name,
    );
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (error != null) {
      _showSnack(error);
    } else {
      AppStateNotifier.instance.setLoggedIn(true);
      context.goNamed(MainDashboardWidget.routeName);
    }
  }

  Future<void> _handleSocialLogin() async {
    // Social login navigates straight to dashboard (local-only app)
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => _isLoading = false);
    final error = await _auth.register(
      email: 'social@salari.app',
      password: 'social_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Salari User',
    );
    if (!mounted) return;
    if (error != null && !error.contains('already exists')) {
      _showSnack(error);
      return;
    }
    AppStateNotifier.instance.setLoggedIn(true);
    context.goNamed(MainDashboardWidget.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isRegister = _selectedTab == 1;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Header ──────────────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryBackground,
                      FlutterFlowTheme.of(context).surface0,
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.0, -1.0),
                    end: const AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 40.0, 24.0, 32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 64.0,
                        height: 64.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: FlutterFlowTheme.of(context).onPrimary,
                          size: 32.0,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'SALARI',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w900,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                  lineHeight: 1.25,
                                ),
                          ),
                          Text(
                            'Your Daily Financial Habit Coach',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  font: GoogleFonts.inter(),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ].divide(const SizedBox(height: 4.0)),
                      ),
                    ].divide(const SizedBox(height: 24.0)),
                  ),
                ),
              ),

              // ── Form ─────────────────────────────────────────────
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    24.0, 0.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Tab switcher (Login / Register)
                    wrapWithModel(
                      model: _model.tabGroupModel,
                      updateCallback: () => safeSetState(() {}),
                      child: TabGroupWidget(
                        label1: 'Login',
                        label2: 'Register',
                        label2Present: true,
                        label3: '',
                        label3Present: false,
                        label4: '',
                        label4Present: false,
                        label5: '',
                        label5Present: false,
                        selectedIndex: _selectedTab,
                        onTabChanged: (idx) =>
                            setState(() => _selectedTab = idx),
                      ),
                    ),

                    // Name field (Register only)
                    if (isRegister)
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(Icons.person_outline_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                  size: 24.0),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: TextField(
                                  controller: _nameController,
                                  focusNode: _nameFocus,
                                  decoration: InputDecoration(
                                    hintText: 'Your name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Email field
                    wrapWithModel(
                      model: _model.textFieldModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: TextFieldWidget(
                        label: 'Email Address',
                        labelPresent: true,
                        helper: '',
                        helperPresent: false,
                        leadingIcon: Icon(
                          Icons.mail_outline_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        leadingIconPresent: true,
                        trailingIconPresent: false,
                        hint: 'name@example.com',
                        value: '',
                        onChange: '',
                        onSubmit: '',
                        variant: 'outlined',
                        error: false,
                      ),
                    ),

                    // Password field
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        wrapWithModel(
                          model: _model.textFieldModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: TextFieldWidget(
                            label: 'Password',
                            labelPresent: true,
                            helper: isRegister
                                ? 'Minimum 6 characters'
                                : '',
                            helperPresent: isRegister,
                            leadingIcon: Icon(
                              Icons.lock_open_rounded,
                              color:
                                  FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            leadingIconPresent: true,
                            trailingIcon: Icon(
                              Icons.visibility_off_rounded,
                              color:
                                  FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            trailingIconPresent: true,
                            hint: '••••••••',
                            value: '',
                            onChange: '',
                            onSubmit: '',
                            variant: 'outlined',
                            error: false,
                          ),
                        ),
                        if (!isRegister)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              wrapWithModel(
                                model: _model.buttonModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: const ButtonWidget(
                                  iconPresent: false,
                                  iconEndPresent: false,
                                  content: 'Forgot Password?',
                                  variant: 'ghost',
                                  size: 'small',
                                  fullWidth: false,
                                  loading: false,
                                  disabled: false,
                                ),
                              ),
                            ],
                          ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),

                    // Primary action button
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: _isLoading
                          ? null
                          : (isRegister ? _handleRegister : _handleLogin),
                      child: wrapWithModel(
                        model: _model.buttonModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          iconPresent: false,
                          iconEndPresent: false,
                          content: _isLoading
                              ? (isRegister
                                  ? 'Creating account...'
                                  : 'Logging in...')
                              : (isRegister
                                  ? 'Create Account'
                                  : 'Login to Salari'),
                          variant: 'primary',
                          size: 'large',
                          fullWidth: true,
                          loading: _isLoading,
                          disabled: _isLoading,
                        ),
                      ),
                    ),

                    // OR divider
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          'OR CONTINUE WITH',
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                font: GoogleFonts.plusJakartaSans(),
                                color: FlutterFlowTheme.of(context)
                                    .onBackground,
                                letterSpacing: 0.0,
                                lineHeight: 1.2,
                              ),
                        ),
                        const Spacer(),
                      ].divide(const SizedBox(width: 16.0)),
                    ),

                    // Social buttons
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: _isLoading ? null : _handleSocialLogin,
                            child: wrapWithModel(
                              model: _model.socialButtonModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: SocialButtonWidget(
                                brandColor:
                                    FlutterFlowTheme.of(context).primary,
                                iconSlug:
                                    'https://cdn.simpleicons.org/google.svg',
                                label: 'Google',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: _isLoading ? null : _handleSocialLogin,
                            child: wrapWithModel(
                              model: _model.socialButtonModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: SocialButtonWidget(
                                brandColor:
                                    FlutterFlowTheme.of(context).primary,
                                iconSlug:
                                    'https://cdn.simpleicons.org/apple.svg',
                                label: 'Apple',
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),

                    // Remember login checkbox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.checkboxModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CheckboxWidget(
                            label: 'Remember Login',
                            subtitle: 'Stay signed in on this device',
                            color: FlutterFlowTheme.of(context).primary,
                            isChecked: true,
                            hasSubtitle: true,
                            disabled: false,
                          ),
                        ),
                      ],
                    ),

                    // Terms notice
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 24.0, 0.0, 24.0),
                      child: Column(
                        children: [
                          Text(
                            'By continuing, you agree to our',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.plusJakartaSans(),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.2,
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Terms of Service',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(),
                                      color: FlutterFlowTheme.of(context)
                                          .primary,
                                      letterSpacing: 0.0,
                                      decoration: TextDecoration.underline,
                                      lineHeight: 1.2,
                                    ),
                              ),
                              Text(
                                ' and ',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.2,
                                    ),
                              ),
                              Text(
                                'Privacy Policy',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(),
                                      color: FlutterFlowTheme.of(context)
                                          .primary,
                                      letterSpacing: 0.0,
                                      decoration: TextDecoration.underline,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 4.0)),
                      ),
                    ),

                    // Switch between Login / Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isRegister
                              ? 'Already have an account?'
                              : "Don't have an account?",
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: GoogleFonts.inter(),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryText,
                                letterSpacing: 0.0,
                                lineHeight: 1.5,
                              ),
                        ),
                        InkWell(
                          onTap: () => setState(
                              () => _selectedTab = isRegister ? 0 : 1),
                          child: wrapWithModel(
                            model: _model.buttonModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonWidget(
                              iconPresent: false,
                              iconEndPresent: false,
                              content: isRegister ? 'Log In' : 'Register',
                              variant: 'ghost',
                              size: 'small',
                              fullWidth: false,
                              loading: false,
                              disabled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
