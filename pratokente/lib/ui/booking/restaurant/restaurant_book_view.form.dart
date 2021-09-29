// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DataValueKey = 'data';
const String HoraValueKey = 'hora';

mixin $RestaurantBookView on StatelessWidget {
  final TextEditingController dataController = TextEditingController();
  final TextEditingController horaController = TextEditingController();
  final FocusNode dataFocusNode = FocusNode();
  final FocusNode horaFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    dataController.addListener(() => _updateFormData(model));
    horaController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            DataValueKey: dataController.text,
            HoraValueKey: horaController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    dataController.dispose();
    horaController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get dataValue => this.formValueMap[DataValueKey];
  String? get horaValue => this.formValueMap[HoraValueKey];

  bool get hasData => this.formValueMap.containsKey(DataValueKey);
  bool get hasHora => this.formValueMap.containsKey(HoraValueKey);
}

extension Methods on FormViewModel {}
