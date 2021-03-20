import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:stacked/stacked.dart';
import 'product_description_view_model.dart';
          
class ProductDescriptionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDescriptionViewModel>.reactive(
      builder: (BuildContext context, ProductDescriptionViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: backgroundcolor,
            elevation: 0,
            leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          ),
          body: Padding(
            padding: EdgeInsets.only(left:10, right:10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/shirt.png',height: 300,),
                  Padding(
                    padding: EdgeInsets.only(left:5, right:5,top:60),
                    child: Container( 
                      width: ScreenUtil().setWidth(400),
                      height:ScreenUtil().setHeight(230),
                      
                      decoration: BoxDecoration(
                        color: widgetcolor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30,top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('Shirt', style: GoogleFonts.montserrat(
           color: Colors.white,
       fontWeight: FontWeight.bold,
       fontSize: ScreenUtil().setSp(20))),
       SizedBox(
         width: ScreenUtil().setWidth(220),
       ),
       Icon(FontAwesomeIcons.dollarSign,color: Colors.white, size: 18,),
                 Text('20', style: GoogleFonts.montserrat(
                 color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: ScreenUtil().setSp(20))),
                            ],),
                          ),
                          Material(
                          color: widgetcolor,
                            child: Padding(
                              padding:const EdgeInsets.only(left: 30,top: 20),
                              child: Wrap(children: [
                                Text('An everyday casual staple in a vibrant pink & navy checkered flannel fabric. Finished with navy blue elbow patch, this beautiful shirt is perfect for off duty days.An everyday casual staple in a vibrant pink & navy checkered flannel fabric. Finished with navy blue elbow patch, this beautiful shirt is perfect for off duty days',style: GoogleFonts.josefinSans(
                 color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: ScreenUtil().setSp(15)))
                              ],),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                width: ScreenUtil().setWidth(100),
                                height: ScreenUtil().setHeight(40),
                                
                                decoration: BoxDecoration(
                                  color: backgroundcolor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: FlatButton(
                child: Text('Buy',style: GoogleFonts.montserrat(
                 color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: ScreenUtil().setSp(15))),
                textColor: Colors.white,
                onPressed: () {},
              ),
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ),
                  
                ],
              ),
              
            ),
          ),
        );
      },
      viewModelBuilder: () => ProductDescriptionViewModel(),
    );
  }
}
