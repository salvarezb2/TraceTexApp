import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'book_appointment_widget.dart' show BookAppointmentWidget;
import 'package:flutter/material.dart';

class BookAppointmentModel extends FlutterFlowModel<BookAppointmentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for personsName widget.
  FocusNode? personsNameFocusNode;
  TextEditingController? personsNameTextController;
  String? Function(BuildContext, String?)? personsNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for problemDescription widget.
  FocusNode? problemDescriptionFocusNode;
  TextEditingController? problemDescriptionTextController;
  String? Function(BuildContext, String?)?
      problemDescriptionTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    personsNameFocusNode?.dispose();
    personsNameTextController?.dispose();

    problemDescriptionFocusNode?.dispose();
    problemDescriptionTextController?.dispose();
  }
}
