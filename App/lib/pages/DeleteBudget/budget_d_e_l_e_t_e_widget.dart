import '../../authentication/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/other/other_icon_button.dart';
import '/other/other_theme.dart';
import '/other/util.dart';
import '/other/other_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'budget_d_e_l_e_t_e_model.dart';
export 'budget_d_e_l_e_t_e_model.dart';

class BudgetDELETEWidget extends StatefulWidget {
  const BudgetDELETEWidget({
    Key? key,
    this.budgetList,
  }) : super(key: key);

  final DocumentReference? budgetList;

  @override
  _BudgetDELETEWidgetState createState() => _BudgetDELETEWidgetState();
}

class _BudgetDELETEWidgetState extends State<BudgetDELETEWidget> {
  late BudgetDELETEModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BudgetDELETEModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return StreamBuilder<BudgetsRecord>(
      stream: BudgetsRecord.getDocument(widget.budgetList!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF093C2B),
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitPumpingHeart(
                  color: Theme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final budgetDELETEBudgetsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF093C2B),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.737,
                  decoration: BoxDecoration(
                    color: Color(0xFF093C2B),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    border: Border.all(
                      color: Color(0xFF093C2B),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Theme.of(context).primaryBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: IconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                buttonSize: 48.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Theme.of(context).secondaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 100.0, 0.0, 50.0),
                          child: Image.asset(
                            'assets/images/delete.png',
                            width: 200.0,
                            height: 180.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 20.0),
                          child: Text(
                            'Delete Budget',
                            style: Theme.of(context).displaySmall.override(
                                  fontFamily: 'Lexend',
                                  color: Color(0xFFF1C1DC),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'If you delete this budget, your transactions will no longer be associated with it.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).bodySmall.override(
                                        fontFamily: 'Lexend',
                                        color: Color(0xFFF1C1DC),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 24.0),
                          child: StreamBuilder<List<BudgetListRecord>>(
                            stream: queryBudgetListRecord(
                              queryBuilder: (budgetListRecord) =>
                                  budgetListRecord.where(
                                'budgetUser',
                                isEqualTo:
                                    budgetDELETEBudgetsRecord.userBudgets,
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
                                      color: Theme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<BudgetListRecord>
                                  buttonBudgetListRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonBudgetListRecord =
                                  buttonBudgetListRecordList.isNotEmpty
                                      ? buttonBudgetListRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  await budgetDELETEBudgetsRecord.reference
                                      .delete();

                                  await buttonBudgetListRecord!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'budget': FieldValue.arrayRemove([
                                          budgetDELETEBudgetsRecord.budetName
                                        ]),
                                      },
                                    ),
                                  });

                                  context.goNamed(
                                    'MY_Budgets',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    },
                                  );
                                },
                                text: 'Delete Budget',
                                options: FFButtonOptions(
                                  width: 347.0,
                                  height: 62.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF1C1DC),
                                  textStyle:
                                      Theme.of(context).titleSmall.override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF093C2B),
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
