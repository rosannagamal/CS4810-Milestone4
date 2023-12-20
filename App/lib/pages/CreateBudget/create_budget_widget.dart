import '../../authentication/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/other/other_animations.dart';
import '/other/other_icon_button.dart';
import '/other/other_theme.dart';
import '/other/util.dart';
import '/other/other_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_budget_model.dart';
export 'create_budget_model.dart';

class CreateBudgetWidget extends StatefulWidget {
  const CreateBudgetWidget({
    Key? key,
    this.budgetUser,
  }) : super(key: key);

  final DocumentReference? budgetUser;

  @override
  _CreateBudgetWidgetState createState() => _CreateBudgetWidgetState();
}

class _CreateBudgetWidgetState extends State<CreateBudgetWidget>
    with TickerProviderStateMixin {
  late CreateBudgetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateBudgetModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.budgetNameController ??= TextEditingController();
    _model.budgetNameFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).darkBackground,
      body: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Material(
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
                  width: MediaQuery.sizeOf(context).width * 0.865,
                  height: MediaQuery.sizeOf(context).height * 0.777,
                  decoration: BoxDecoration(
                    color: Theme.of(context).darkBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Create Budget',
                                style: Theme.of(context).displaySmall,
                              ),
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 100.0,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: Theme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: Theme.of(context).darkBackground,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  hintText: 'Amount',
                                  hintStyle:
                                      Theme.of(context).displaySmall.override(
                                            fontFamily: 'Lexend',
                                            color: Theme.of(context).textColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).textColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 24.0, 24.0),
                                  prefixIcon: Icon(
                                    Icons.attach_money_rounded,
                                    color: Theme.of(context).primaryText,
                                    size: 32.0,
                                  ),
                                ),
                                style: Theme.of(context).displaySmall.override(
                                      fontFamily: 'Lexend',
                                      color: Theme.of(context).textColor,
                                    ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation']!),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 20.0),
                          child: TextFormField(
                            controller: _model.budgetNameController,
                            focusNode: _model.budgetNameFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Budget Name',
                              labelStyle:
                                  Theme.of(context).titleMedium.override(
                                        fontFamily: 'Lexend',
                                        color: Theme.of(context).textColor,
                                      ),
                              hintStyle: Theme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend',
                                    color: Theme.of(context).darkBackground,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).grayLight,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 32.0, 24.0, 32.0),
                            ),
                            style: Theme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  color: Theme.of(context).textColor,
                                ),
                            textAlign: TextAlign.start,
                            validator: _model.budgetNameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        TextFormField(
                          controller: _model.textController3,
                          focusNode: _model.textFieldFocusNode2,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context).bodyMedium.override(
                                  fontFamily: 'Lexend',
                                  color: Theme.of(context).darkBackground,
                                ),
                            hintText: 'Description',
                            hintStyle: Theme.of(context).bodySmall.override(
                                  fontFamily: 'Lexend',
                                  color: Theme.of(context).textColor,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).grayLight,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 40.0, 24.0, 0.0),
                          ),
                          style: Theme.of(context).bodyMedium.override(
                                fontFamily: 'Lexend',
                                color: Theme.of(context).textColor,
                              ),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          validator: _model.textController3Validator
                              .asValidator(context),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await queryBudgetsRecordOnce(
                                    queryBuilder: (budgetsRecord) =>
                                        budgetsRecord
                                            .where(
                                              'budetName',
                                              isEqualTo: _model
                                                  .budgetNameController.text,
                                            )
                                            .where(
                                              'budgetDescription',
                                              isEqualTo:
                                                  _model.textController3.text,
                                            )
                                            .where(
                                              'budgetAmount',
                                              isEqualTo:
                                                  _model.textController1.text,
                                            ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 24.0),
                                      child:
                                          StreamBuilder<List<BudgetListRecord>>(
                                        stream: queryBudgetListRecord(
                                          queryBuilder: (budgetListRecord) =>
                                              budgetListRecord.where(
                                            'budgetUser',
                                            isEqualTo: widget.budgetUser,
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
                                                  color:
                                                      Theme.of(context).primary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<BudgetListRecord>
                                              buttonBudgetListRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final buttonBudgetListRecord =
                                              buttonBudgetListRecordList
                                                      .isNotEmpty
                                                  ? buttonBudgetListRecordList
                                                      .first
                                                  : null;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              await BudgetsRecord.collection
                                                  .doc()
                                                  .set(createBudgetsRecordData(
                                                    budetName: _model
                                                        .budgetNameController
                                                        .text,
                                                    budgetAmount: _model
                                                        .textController1.text,
                                                    budgetCreated:
                                                        getCurrentTimestamp,
                                                    budgetDescription: _model
                                                        .textController3.text,
                                                    budgetTime: '29 days left',
                                                    userBudgets:
                                                        buttonBudgetListRecord
                                                            ?.budgetUser,
                                                    budgetAmountNumber:
                                                        int.tryParse(_model
                                                            .textController1
                                                            .text),
                                                  ));

                                              await buttonBudgetListRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'budget':
                                                        FieldValue.arrayUnion([
                                                      _model
                                                          .budgetNameController
                                                          .text
                                                    ]),
                                                  },
                                                ),
                                              });
                                              context.pop();
                                            },
                                            text: 'Create budget',
                                            options: FFButtonOptions(
                                              width: 237.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFF1C1DC),
                                              textStyle: Theme.of(context)
                                                  .titleSmall
                                                  .override(
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
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
          ],
        ),
      ),
    );
  }
}
