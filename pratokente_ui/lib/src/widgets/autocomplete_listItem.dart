import 'package:flutter/material.dart';
import 'package:pratokente_ui/src/shared/app_colors.dart';
import 'package:pratokente_ui/src/widgets/pratokente_text.dart';

class AutoCompleteListItem extends StatelessWidget {
  final String state, city;
  final Function onTap;

  const AutoCompleteListItem(
      {Key? key, required this.state, required this.city, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.near_me,
            color: kcMediumGreyColor,
          ),
          onTap: () => onTap(),
          title: PratokenteText.subheading(city),
          subtitle: PratokenteText.caption(state),
        ),
        Divider(
          indent: 50,
        )
      ],
    );
  }
}
