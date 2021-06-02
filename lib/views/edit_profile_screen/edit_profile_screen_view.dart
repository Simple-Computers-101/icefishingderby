import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:stacked/stacked.dart';
import 'edit_profile_screen_view_model.dart';

class EditProfileScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileScreenViewModel>.reactive(
      builder: (BuildContext context, EditProfileScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Profile",
                style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            backgroundColor: widgetcolor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: widgetcolor,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      height: ScreenUtil().setHeight(120),
                                      width: ScreenUtil().setWidth(120),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xFF83A1E1), width: 5),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/profile.jpg")),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF83A1E1)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.camera_alt_rounded,
                                              size: 20, color: Colors.white),
                                        ),
                                      ),
                                      onTap: () async {},
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("Edit Profile",
                                style: GoogleFonts.josefinSans(
                                    color: Color(0xFF83A1E1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: widgetcolor,
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFields(
                            onChanged: (na) {},
                            icon: Tab(
                              child: Icon(
                                Icons.person,
                                color: appColor,
                              ),
                            ),
                            hintText: "Fahad Khalid",
                            secureText: false,
                            borderColor: appColor,
                            focusColor: Colors.white,
                            context: null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFields(
                            onChanged: (na) {},
                            icon: Tab(
                              child: Icon(
                                Icons.mail,
                                color: appColor,
                              ),
                            ),
                            hintText: "Fahad8Khalid@gmail.com",
                            secureText: false,
                            borderColor: appColor,
                            focusColor: Colors.white,
                            context: null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFields(
                            onChanged: (na) {},
                            icon: Tab(
                              child: Icon(
                                Icons.person,
                                color: appColor,
                              ),
                            ),
                            hintText: "Fahad Khalid",
                            secureText: false,
                            borderColor: appColor,
                            focusColor: Colors.white,
                            context: null,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 8,
                              offset: Offset(4, 4),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.blueAccent)),
                      child: GestureDetector(
                          onTap: (){},
                          child: Center(
                            child: Text(
                              "     Update    ",
                              style: t10appColor,
                            ),
                          )),
                    )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => EditProfileScreenViewModel(),
    );
  }
}
