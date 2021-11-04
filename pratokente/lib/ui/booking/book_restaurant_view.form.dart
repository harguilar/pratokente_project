// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DateValueKey = 'date';
const String TimeValueKey = 'time';

mixin $BookRestaurantView on StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final FocusNode dateFocusNode = FocusNode();
  final FocusNode timeFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    dateController.addListener(() => _updateFormData(model));
    timeController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            DateValueKey: dateController.text,
            TimeValueKey: timeController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    dateController.dispose();
    timeController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get dateValue => this.formValueMap[DateValueKey];
  String? get timeValue => this.formValueMap[TimeValueKey];

  bool get hasDate => this.formValueMap.containsKey(DateValueKey);
  bool get hasTime => this.formValueMap.containsKey(TimeValueKey);
}

extension Methods on FormViewModel {}
