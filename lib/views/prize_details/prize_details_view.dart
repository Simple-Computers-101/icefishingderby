import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:stacked/stacked.dart';
import 'prize_details_view_model.dart';
          
class PrizeDetailsView extends StatefulWidget {
  @override
  _PrizeDetailsViewState createState() => _PrizeDetailsViewState();
}

class _PrizeDetailsViewState extends State<PrizeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrizeDetailsViewModel>.reactive(
      builder: (BuildContext context, PrizeDetailsViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: backgroundcolor,
            elevation: 0,
            title: Icon(FontAwesome.trophy, size: 30,),
          ),
          body: ListView(
            children: [

              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                            width: ScreenUtil().setWidth(double.infinity),
                            height: ScreenUtil().setHeight(120),
                            decoration: BoxDecoration(
                                color: widgetcolor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(35),
                                    bottomRight: Radius.circular(35))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/f2.png',
                                height: ScreenUtil().setHeight(100),
                              ),
                            )),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight:    Radius.circular(15))

                      ),
                      child: Text('Cash Prize', style: t1,),
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        minLeadingWidth: 2,
                        horizontalTitleGap: 3,

                        tileColor: widgetcolor,
                        leading: Text('Winner' , style: t1,),
                        trailing: Text('Not Assigned', style: t1,),
                      //  title: Icon(FontAwesome.trophy, color: Colors.orange,),
                      ),
                    ),

                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                         tileColor: widgetcolor,
                        leading: Text('Total Tickets' , style: t1,),
                        trailing: Text('15055', style: t1,),
                        //title: Icon(FontAwesome.ticket, color: Colors.orange,),
                        
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                         tileColor: widgetcolor,
                        leading: Text('Your Tickets' , style: t1,),
                        trailing: Text('2', style: t1,),
                      //  title: Icon(FontAwesome.ticket, color: Colors.orange,),
                      ),
                    ),

                  ],
                ),

                
                OutlinedButton.icon(
                  
                  onPressed: (){

                },
                
                 icon: Icon(FontAwesome.cart_plus), label: Text('Buy More Tickets', style: t1,))
                

            ],
          ),
        );
      },
      viewModelBuilder: () => PrizeDetailsViewModel(),
    );
  }
}
