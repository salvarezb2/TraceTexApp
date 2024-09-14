import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'forgot_password_model.dart';
export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFE6E6E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBFBEBE),
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32.0,
          ),
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'g416xg9f' /* Olvidé mi contraseña */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Lexend',
                color: FlutterFlowTheme.of(context).textColor,
                letterSpacing: 0.0,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/login_bg@2x.png',
            ).image,
          ),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 55.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'xaiad71o' /* Introduzca el correo electróni... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Lexend',
                              color: FlutterFlowTheme.of(context).grayDark,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 58.0, 20.0, 0.0),
              child: TextFormField(
                controller: _model.emailAddressTextController,
                focusNode: _model.emailAddressFocusNode,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    'u4nuk910' /* Correo electrónico */,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Lexend',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '37kotxi0' /* Ingrese su correo */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Lexend',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).textColor,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).darkBackground,
                      letterSpacing: 0.0,
                    ),
                validator: _model.emailAddressTextControllerValidator
                    .asValidator(context),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.emailAddressTextController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Email required!',
                        ),
                      ),
                    );
                    return;
                  }
                  await authManager.resetPassword(
                    email: _model.emailAddressTextController.text,
                    context: context,
                  );
                },
                text: FFLocalizations.of(context).getText(
                  'hiwpaze1' /* Enviar link de reinicio */,
                ),
                options: FFButtonOptions(
                  width: 190.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF0C234F),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).textColor,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
