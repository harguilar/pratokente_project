import 'package:flutter/material.dart';
import 'package:pratokente/ui/contact/contact_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'profile_view.form.dart';
import 'profile_viewmodel.dart';
import 'package:pratokente_ui/pratokente_ui.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'address'),
])
class ProfileViewEmail extends StatelessWidget with $ProfileViewEmail {
  ProfileViewEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      // onModelReady: (model) => model.setCurrentUser(),
      builder: (context, model, child) => WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: PratokenteText.headingThree('Perfil do Utilizador'),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    model.signOut();
                  })
            ],
            //leading: Container(),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 352.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/Template2/backgroundProfile.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 67.0, left: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/Template2/profile.png"),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12.withOpacity(0.1),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0)
                                  ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 20.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    PratokenteText.body(
                                        model.currentUser.name?.toString() ??
                                            "Sem nome"),
                                    verticalSpaceTiny,
                                    PratokenteText.body(
                                        model.currentUser.email?.toString() ??
                                            "Sem nome"),
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 230.0),
                  child: Column(
                    children: <Widget>[
/*                       InkWell(
                        onTap: () => showDialogEditProfile(
                            context, nameController, addressController),
                        child: category(
                          txt: "Edit Profile",
                          image: "assets/Template2/icon/editProfile.png",
                          padding: 20.0,
                        ),
                      ), */
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  ContactView(), /*new CallCenterT2(),*/
                            ),
                          );
                        },
                        child: category(
                          txt: "Call Center",
                          image: "assets/Template2/icon/callCenter.png",
                          padding: 20.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /*                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => new AboutApps())); */
                        },
                        child: category(
                          txt: "About Apps",
                          image: "assets/Template2/icon/aboutApps.png",
                          padding: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async => false,
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
/*
showDialogEditProfile(
        BuildContext context,
        final TextEditingController nameController,
        final TextEditingController addressController) =>
    showDialog(
        useRootNavigator: true,
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return ViewModelBuilder<ProfileViewModel>.reactive(
              disposeViewModel: false,
              initialiseSpecialViewModelsOnce: true,
              builder: (context, model, child) {
                return AlertDialog(
                  title: Text("Editar Perfil"),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          initialValue: model.currentUser.name,
                          decoration: InputDecoration(
                              labelText: "Nome", border: OutlineInputBorder()),
                          controller: nameController,
                          // onChanged: (value) => model.currentUser.name = value,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue: 'model.currentUser.address',
                          decoration: InputDecoration(
                              labelText: "Endereço",
                              border: OutlineInputBorder()),
                          //  onChanged: (value) => model.currentUser.address = value,
                          controller: addressController,
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    InkWell(
                        child: Text("Salvar"),
                        onTap: () async {
                          User? updatedUser;

                          // updatedUser!.name = NameValueKey.toLowerCase();
                          //  model.currentUser.name = NameValueKey.toLowerCase();

                          model.updateUser(updatedUser: model.currentUser);
                          Navigator.pop(context);
                        }),
                    // },
                    //  ),
                    InkWell(
                      child: Text("Cancelar"),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
              viewModelBuilder: () => ProfileViewModel(), 
              );
        }); */

/// Component category class to set list
/// /
//
/// *
class category extends StatelessWidget {
  @override
  String? txt, image;
  GestureTapCallback? tap;
  double? padding;
  Widget? icon;

  category({this.txt, this.image, this.tap, this.padding, this.icon});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Image.asset(
                        image!,
                        height: 45.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        txt!,
                        style: TextStyle(
                          fontSize: 16.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Sofia",
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 15.0,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
