import 'package:flutter/material.dart';
import 'package:pratokente/enums/basic_dialog_status.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked_services/stacked_services.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const BasicDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: _BasicDialogContent(request: request, completer: completer),
    );
  }
}

class _BasicDialogContent extends StatelessWidget {
  const _BasicDialogContent({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse dialogResponse) completer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidthPercentage(context, percentage: 0.04),
          ),
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              PratokenteText.subheading(
                request.title ?? '',
                align: TextAlign.center,
              ),
              verticalSpaceSmall,
              PratokenteText.body(
                request.description ?? '',
                align: TextAlign.center,
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null)
                    TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: false)),
                      child: PratokenteText.body(
                        request.secondaryButtonTitle!,
                        color: Colors.black,
                      ),
                    ),
                  TextButton(
                    onPressed: () => completer(DialogResponse(confirmed: true)),
                    child: PratokenteText.body(
                      request.mainButtonTitle ?? '',
                      color: kcPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -28,
          child: CircleAvatar(
            minRadius: 16,
            maxRadius: 28,
            backgroundColor: _getStatusColor(request.customData),
            child: Icon(
              _getStatusIcon(request.customData),
              size: 28,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(dynamic customData) {
    switch (customData) {
      case BasicDialogStatus.error:
        return kcRedColor;
      case BasicDialogStatus.warning:
        return kcOrangeColor;
      default:
        return kcPrimaryColor;
    }
  }

  IconData _getStatusIcon(dynamic regionDialogStatus) {
    if (regionDialogStatus is BasicDialogStatus)
      switch (regionDialogStatus) {
        case BasicDialogStatus.error:
          return Icons.close;
        case BasicDialogStatus.warning:
          return Icons.warning_amber;
        default:
          return Icons.check;
      }
    else {
      return Icons.check;
    }
  }
}
