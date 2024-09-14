import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 90.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 90.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.0, 26.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 90.0.ms,
            duration: 150.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: const Color(0xFF0C234F),
        elevation: 8.0,
        child: Icon(
          Icons.post_add_rounded,
          color: FlutterFlowTheme.of(context).textColor,
          size: 32.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6E6E6),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'cd0zp71n' /* Bienvenida, Stephanie! */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Lexend',
                  color: FlutterFlowTheme.of(context).darkBackground,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                    child: Icon(
                      Icons.location_on,
                      color: FlutterFlowTheme.of(context).darkBackground,
                      size: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '9ph5lb0g' /* Ciudad de Guatemala */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).darkBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 5.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ld6j46ly' /* Ultima actualización: Septiemb... */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).darkBackground,
                        fontSize: 8.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            StreamBuilder<List<BudgetsRecord>>(
              stream: queryBudgetsRecord(
                queryBuilder: (budgetsRecord) => budgetsRecord.where(
                  'userBudgets',
                  isEqualTo: currentUserReference,
                ),
                singleRecord: true,
              ),
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
                List<BudgetsRecord> listViewBudgetsRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final listViewBudgetsRecord =
                    listViewBudgetsRecordList.isNotEmpty
                        ? listViewBudgetsRecordList.first
                        : null;

                return ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'budgetDetails',
                            queryParameters: {
                              'budgetDetails': serializeParam(
                                listViewBudgetsRecord?.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: 198.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).textColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '9il8u06k' /* Producción activa */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '8cbuhvv3' /* Total pcs faltantes */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'n7v3mep9' /* Total pcs producidas */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .darkBackground,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rrbwd2z6' /* 250,000 */,
                                              ),
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            const Color(0xFF0C234F),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '6ay4kyrv' /* 152,500 */,
                                        ),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 25.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'omjhpm7y' /* 323,260 */,
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 10.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'h04pkil9' /* Monitoreo */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend',
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['listViewOnPageLoadAnimation']!);
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 115.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF0C234F),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '40uoqr0m' /* Entregados */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: Icon(
                              Icons.check_circle_outlined,
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              size: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 115.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF0C234F),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: Icon(
                              Icons.access_time_outlined,
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              size: 35.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '3bau88wj' /* En proceso */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 115.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).textColor,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: const Color(0xFF0C234F),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 25.0),
                              child: Icon(
                                Icons.highlight_off_sharp,
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                size: 35.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '9qgt9won' /* No entregados */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '29cu68xs' /* Productos */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).darkBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 115.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF0C234F),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'eqt3befj' /* Producto x */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: Icon(
                              Icons.shopping_cart,
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              size: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 115.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF0C234F),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: Icon(
                              Icons.shopping_cart,
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              size: 35.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'a8kyz4dh' /* Producto y */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 115.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).textColor,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: const Color(0xFF0C234F),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 25.0),
                              child: Icon(
                                Icons.shopping_cart,
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                size: 35.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'aeee4c9x' /* Producto z */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '75ymia30' /* Fases */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).darkBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 115.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF0C234F),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8vn5ey0h' /* Materia prima */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: Icon(
                              Icons.folder_rounded,
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              size: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 115.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF0C234F),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: Icon(
                              Icons.list,
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              size: 35.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'kzglxg0g' /* Gestión de inventarios */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 115.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).textColor,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: const Color(0xFF0C234F),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 25.0),
                              child: Icon(
                                Icons.fire_truck_rounded,
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                size: 35.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'i3cnt0zp' /* Lógistica */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
