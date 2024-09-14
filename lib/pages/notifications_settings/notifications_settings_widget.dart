import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'notifications_settings_model.dart';
export 'notifications_settings_model.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({super.key});

  @override
  State<NotificationsSettingsWidget> createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  late NotificationsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsSettingsModel());
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
            'sc4ff4ce' /* Notificaciones */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Lexend',
                letterSpacing: 0.0,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width * 10.0,
        height: MediaQuery.sizeOf(context).width * 10.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/login_bg@2x.png',
            ).image,
          ),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(currentUserReference!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitPumpingHeart(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                );
              }

              final columnUsersRecord = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'r72zvrv5' /* Elija a continuación las notif... */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Lexend',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: SwitchListTile.adaptive(
                      value: _model.switchListTileValue1 ??= true,
                      onChanged: (newValue) async {
                        safeSetState(
                            () => _model.switchListTileValue1 = newValue);
                      },
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'gjygkr0n' /* Notificaciones Push */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  color: const Color(0xFF0C234F),
                                  letterSpacing: 0.0,
                                ),
                      ),
                      subtitle: Text(
                        FFLocalizations.of(context).getText(
                          '3y3yhxbk' /* Recibe notificaciones Push de ... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Lexend',
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor: const Color(0xFFE6E6E6),
                      activeColor: const Color(0xFF4BA7E6),
                      activeTrackColor: const Color(0xFF4BA7E6),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                    ),
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue2 ??= true,
                    onChanged: (newValue) async {
                      safeSetState(
                          () => _model.switchListTileValue2 = newValue);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '1ytebj35' /* Notificaciones de correo */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Lexend',
                                color: const Color(0xFF0C234F),
                                letterSpacing: 0.0,
                              ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '9lvh5nst' /* Reciba notificaciones por corr... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Lexend',
                            letterSpacing: 0.0,
                          ),
                    ),
                    tileColor: const Color(0xFFE6E6E6),
                    activeColor: const Color(0xFF4BA7E6),
                    activeTrackColor: const Color(0xFF4BA7E6),
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue3 ??= true,
                    onChanged: (newValue) async {
                      safeSetState(
                          () => _model.switchListTileValue3 = newValue);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '69d2j74u' /* Servicios de localización */,
                      ),
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Lexend',
                                color: const Color(0xFF0C234F),
                                letterSpacing: 0.0,
                              ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '3k8cuv0d' /* Permítanos seguir su ubicación... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Lexend',
                            letterSpacing: 0.0,
                          ),
                    ),
                    tileColor: const Color(0xFFE6E6E6),
                    activeColor: const Color(0xFF4BA7E6),
                    activeTrackColor: const Color(0xFF4BA7E6),
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pop();
                      },
                      text: FFLocalizations.of(context).getText(
                        'isgrgbfs' /* Guardar cambios */,
                      ),
                      options: FFButtonOptions(
                        width: 190.0,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF0C234F),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
