import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'contact_view.form.dart';
import 'contact_viewmodel.dart';
import 'package:flutter/material.dart';

@FormView(fields: [
  FormTextField(name: 'message'),
])
class ContactView extends StatelessWidget with $ContactView {
  ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
        disposeViewModel: false,
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange,
                title: PratokenteText.headingThree('Apoio/Sugestão'),
                centerTitle: true,
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/Template2/girlcallcenter.png",
                        height: 175.0,
                      ),
                      PratokenteText.body(
                        'Mande-nos uma mensagem',
                      ),
                      verticalSpaceRegular,
                      Flexible(
                        child: Card(
                          //color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: messageController,
                              maxLines: 8,
                              decoration: InputDecoration.collapsed(
                                hintText:
                                    "Escreva aqui a sua mensagem/Sugestão para PratoKente",
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceRegular,
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: PratokenteButton(
                          title: "Enviar",
                          onTap: () {
                            model.sendMessage();
                            messageController.clear();
                          },
                        ),
                      ),
                      /* Center(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child:RaisedButton(
                        color: Color.fromRGBO(64, 75, 96, .9),
                        child: Text(
                          "Enviar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: model.isBusy ?null :() {
                          if(messageController.text.length>10){
                            model.supportMessageModel.text =
                                messageController.text;
                            model.sendMessage(context);

                            messageController.clear();

                          }
                          else
                            Flushbar(
                              title: "MENSAGEM DEMADIADO CURTA ",
                              message:
                              "Escreva uma mensagem adequada!",
                              duration: Duration(seconds: 2),
                              flushbarStyle: FlushbarStyle.FLOATING,
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              reverseAnimationCurve: Curves.decelerate,
                              forwardAnimationCurve: Curves.elasticOut,
                              backgroundColor: Colors.red,
                            )..show(context);

                        },
                      ),
                    ),
                  )*/
                    ]),
              ),
            ),
        viewModelBuilder: () => ContactViewModel());
  }
}
