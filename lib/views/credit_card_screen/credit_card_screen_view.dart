import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/views/credit_card_screen/credit_card_screen_model.dart';
import 'package:icefishingderby/widgets/dumb_widgets/field.dart';
import 'package:stacked/stacked.dart';
import '../../constants/colors.dart';

class CreditCardView extends StatefulWidget {
  @override
  _CreditCardViewState createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  var title = GoogleFonts.workSans(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 34);
  var subtitle = GoogleFonts.workSans(
    color: Colors.white.withOpacity(0.35),
  );
  bool _showMode = true;

  var _cardNumber = "5500400055649650";
  var _expiryDate = "9/26";
  var _cardHolderName = "ZEESHAN ALI HAMDANI";
  var _cvvCode = "123";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreditCardViewModel>.reactive(
      viewModelBuilder: () => CreditCardViewModel(),
      builder: (context, model, widget) {
        return Scaffold(
          backgroundColor: ccColor,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Credit Cards",
                            style: title,
                          ),
                          Text(
                            "Select or add a credit card.",
                            style: subtitle,
                          ),
                        ],
                      ),
                      FlatButton(
                        child: Icon(!_showMode ? Icons.list : Icons.add),
                        onPressed: _toggleMode,
                        color: Colors.white,
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                ),
                if (!_showMode) _addNewCard() else _showCreditCards()
              ],
            ),
          )),
        );
      },
    );
  }

  Expanded _showCreditCards() {
    return Expanded(
      flex: 5,
      child: ListView(
        children: [
          for (int i = 0; i < 5; i++) _buildCreditCardsButton(i),
        ],
      ),
    );
  }

  _buildCreditCardsButton(int index) {
    var cc = CreditCardWidget(
      cardNumber: "5500400055649650",
      expiryDate: "9/26",
      cardHolderName: "ZEESHAN ALI HAMDANI",
      cvvCode: "123",
      showBackView: false,
      height: 150,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Color(0xff363855),
      child: ListTile(
          leading: Text(
            (index + 1).toString(),
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          title: Text(
            cc.cardNumber,
            style: GoogleFonts.alata(color: Colors.white),
          ),
          trailing: Image.asset(
            CardTypeIconAsset[
                index % 2 == 0 ? CardType.mastercard : CardType.visa],
            height: 20,
            package: 'flutter_credit_card',
          )),
    );
  }

  _addNewCard() {
    var _formKey = GlobalKey<FormState>();
    return Expanded(
        flex: 5,
        child: ListView(
          children: [
            CreditCardWidget(
              cardNumber: _cardNumber,
              expiryDate: _expiryDate,
              cardHolderName: _cardHolderName,
              cvvCode: _cvvCode,
              showBackView: false,
              cardBgColor: ccColor,
            ),
            Divider(
              height: 35,
              thickness: 2,
              color: Colors.grey.withOpacity(0.2),
            ),
            Text(
              "Input Card Details",
              style: subtitle,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6,
              ),
              child: Column(
                children: [
                  CCTextField(
                    icon: Icon(
                      MaterialIcons.person,
                      color: Colors.blueGrey,
                    ),
                    hintText: "Card Holder Name",
                    onChanged: (val) {
                      setState(() {
                        _cardHolderName = val;
                      });
                    },
                  ),
                  CCTextField(
                    icon: Icon(
                      Icons.credit_card,
                      color: Colors.blueGrey,
                    ),
                    hintText: "Credit Card Number",
                    onChanged: (val) {
                      setState(() {
                        _cardNumber = val;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CCTextField(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.blueGrey,
                          ),
                          hintText: "Expiry Date",
                          onChanged: (val) {
                            setState(() {
                              _expiryDate = val;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CCTextField(
                          hintText: "CVV",
                          onChanged: (val) {
                            setState(() {
                              _cvvCode = val;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
            // Field(),
            // Field(),
            // Field(),
          ],
        ));
  }

  void _toggleMode() {
    setState(() {
      _showMode = !_showMode;
    });
  }
}

class CCTextField extends StatelessWidget {
  final hintText, onChanged, icon;
  const CCTextField({
    Key key,
    this.hintText,
    this.onChanged,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 50,
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            icon: icon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}


//  CreditCardForm(
//                     formKey: _formKey, // Required
//                     onCreditCardModelChange: (CreditCardModel data) {
//                       setState(() {
//                         _cardHolderName = data.cardHolderName;
//                         _expiryDate = data.expiryDate;
//                         _cardNumber = data.cardNumber;
//                         _cvvCode = data.cvvCode;
//                       });
//                     }, // Required
//                     themeColor: Colors.white,
//                     obscureCvv: true,
//                     obscureNumber: true,

//                     expiryDateDecoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)),
//                       labelText: 'Expired Date',
//                       hintText: 'XX/XX',
//                     ),
//                     cvvCodeDecoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)),
//                       labelText: 'CVV',
//                       hintText: 'XXX',
//                     ),
//                     cardHolderDecoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)),
//                       labelText: 'Card Holder',
//                     ),
//                     cardNumberDecoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)),
//                       labelText: 'Number',
//                       hintText: 'XXXX XXXX XXXX XXXX',
//                     ),
//                   ),