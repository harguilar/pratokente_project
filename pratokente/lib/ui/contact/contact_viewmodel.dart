import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/core/datamodels/support_message/support_message.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:pratokente/core/services/support/support_services.dart';
import 'package:pratokente/core/services/users/users_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'contact_view.form.dart';

class ContactViewModel extends FormViewModel {
  final log = getLogger('ContactViewModel');
  final _userService = locator<UserService>();

  final _supportService = locator<SupportService>();

  final _snackbarService = locator<SnackbarService>();

  User get currentUser => _userService.getCurrentUser;

  Future<void> sendMessage() async {
    try {
      setBusy(true);

      log.i('Set Form Value With Data: $formValueMap');
      if ((messageValue != null) && (messageValue != '')) {
        _supportService.sendMessage(SupportMessage(
            senderEmail: _userService.getCurrentUser.email,
            id: _userService.getCurrentUser.id,
            senderName: _userService.getCurrentUser.name,
            dateSent: DateTime.now(),
            senderMgs: messageValue.toString()));

        _snackbarService.showSnackbar(
          title: "MENSAGEM ENVIADA COM SUCESSO ",
          message: "Entraremos em contacto brevemente!",
        );
        //messageValue.clear();
      } else {
        setValidationMessage('You Must Write a message to the user !');
        _snackbarService.showSnackbar(
          title: "MENSAGEM NÃO ENVIADA",
          message: "Falha ao enviar mensagem de apoio!",
        );
      }
    } catch (e) {
      log.w('Crush Error ', e.toString());
    }
    setBusy(false);
    notifyListeners();
  }

  @override
  void setFormStatus() {}
}
