import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:stacked/stacked.dart';
import 'buy_products_view_model.dart';

class BuyProductsView extends StatefulWidget {
  @override
  _BuyProductsViewState createState() => _BuyProductsViewState();
}

class _BuyProductsViewState extends State<BuyProductsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyProductsViewModel>.reactive(
      builder:
          (BuildContext context, BuyProductsViewModel viewModel, Widget _) {
        return Scaffold(
            backgroundColor: backgroundcolor,
            appBar: AppBar(
              backgroundColor: widgetcolor,
              elevation: 0,
              title: Text('Buy Products', style: GoogleFonts.montserrat()),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HomeHeader2(
                                title: 'Shirts',
                              ),
                            ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(40),
                  ),
                  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HomeHeader2(
                                title: 'Neck Gaitors',
                              ),
                            ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                        CreateCard(
                          imagurl: 'assets/shirt.png',
                          price: '20',
                          title: 'Neck gaitor',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
      viewModelBuilder: () => BuyProductsViewModel(),
    );
  }
}

class Heading extends StatefulWidget {
  final title;

  const Heading({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HeadingState createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hello');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: ScreenUtil().setHeight(35),
        width: ScreenUtil().setWidth(150),
        padding: EdgeInsets.only(top: 10, left: 16),
        child: Text(this.widget.title,
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(20))),
        decoration: BoxDecoration(
          color: widgetcolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
      ),
    );
  }
}

class CreateCard extends StatelessWidget {
  final price;
  final imagurl;
  final title;
  const CreateCard({
    Key key,
    this.title,
    this.price,
    this.imagurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(150),
      decoration: BoxDecoration(
          color: widgetcolor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Image.asset(
              this.imagurl,
              height: 60,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Text(this.title,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(15))),
            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),
            //  Row(
            //    crossAxisAlignment: CrossAxisAlignment.start,
            //    children: [
            //      Icon(FontAwesomeIcons.dollarSign,color: Colors.white, size: 13,),
            //      Text(this.price, style: GoogleFonts.josefinSans(
            //      color: Colors.white,
            //  fontWeight: FontWeight.bold,
            //  fontSize: ScreenUtil().setSp(15))),
            //    ],
            //  ),
          ],
        ),
      ),
    );
  }
}
