import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/regexp.dart';
import 'package:icefishingderby/services/stripe_payment.dart';
import 'package:icefishingderby/views/credit_card_screen/credit_card_screen_model.dart';
import 'package:icefishingderby/widgets/dumb_widgets/field.dart';
import 'package:stacked/stacked.dart';
import 'package:stripe_payment/stripe_payment.dart';
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
  var _cardHolderName = "CARD HOLDER A";
  var _cvvCode = "123";

  CreditCardViewModel _model;

  GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreditCardViewModel>.reactive(
      viewModelBuilder: () => CreditCardViewModel(),
      builder: (context, CreditCardViewModel model, widget) {
        _model = model;
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: widgetcolor,
            title: Text("Payment Information", style: GoogleFonts.josefinSans()),
          ),
          key: _scaffKey,
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
                      Row(
                        children: [
                          FlatButton(
                            child: Icon(!_showMode ? Icons.list : Icons.add),
                            onPressed: _toggleMode,
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                if (!_showMode)
                  _addNewCard(model)
                else
                  Expanded(
                    flex: 5,
                    child: model.fetchingCards
                        ? Center(child: CircularProgressIndicator())
                          : _showCreditCards(
                            model.fetchedCards['cards'], model, context),
                  ),
                TextButton(
                  onPressed: () {
                    _addNewCard1(context);
                  },
                  child: Text('Pay with new Card'),
                )
              ],
            ),
          )),
        );
      },
    );
  }

  _addNewCard1(context) async {
    //TODO:Make Payment amount dynamic
    var res =
        await StripeService.payWithNewCard(amount: '150', currency: 'USD');

    _scaffKey.currentState.showSnackBar(SnackBar(
      content: Text(res.message),
      //duration: Duration(milliseconds: ),
    ));
  }

    Widget _showCreditCards(cards, model, contenxt) {
    if (cards == null) {
      return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error, size: 250, color: Color(0xff161622)),
              Text("No Credit Cards.",
                  style: GoogleFonts.montserrat(color: Colors.white)),
            ],
          ));
    }
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return ListView(
      children: [
        for (int i = 0; i < cards.length; i++)
          _buildCreditCardsButton(cards[i], i, model, args),
      ],
    );
  }

  _buildCreditCardsButton(Map card, index, model, args) {
    var cc = CreditCardWidget(
      cardNumber: card['card_number'],
      expiryDate: card['expiry'],
      cardHolderName: card['holder_name'],
      cvvCode: card['cvv'],
      showBackView: false,
      height: 150,
    );
    var exp = cc.expiryDate.split('/');

    return FlatButton(
      onPressed: () {
        model.confirmPayment(
           CreditCard(
                cvc: cc.cvvCode,
                number: cc.cardNumber,
                name: cc.cardHolderName,
                expMonth: int.parse(exp[0]),
                expYear: int.parse(exp[1])),
            paymentDetails: args);
        //Send Card to Stripe.
      },
      child: Container(
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
          // subtitle: Text(cc.cardType.toString()),
          trailing: Image.asset(
            CardTypeIconAsset[getCardType(cc.cardNumber)],
            height: 20,
            package: 'flutter_credit_card',
          ),
        ),
      ),
    );
  }

  getCardType(String cardNum) {
    if (cardNum.startsWith('4'))
      return CardType.visa;
    else if (cardNum.startsWith('5'))
      return CardType.mastercard;
    else if (cardNum.startsWith('6'))
      return CardType.discover;
    else
      return CardType.otherBrand;
  }

  _addNewCard(model) {
    var _formKey = GlobalKey<FormState>();
    return Expanded(
      flex: 5,
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            GestureDetector(
              child: CreditCardWidget(
                cardNumber: _cardNumber,
                expiryDate: _expiryDate,
                cardHolderName: _cardHolderName,
                cvvCode: _cvvCode,
                showBackView: false,
                cardBgColor: ccColor,
              ),
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
                    validator: (String val) {
                      return !holder_pattern.hasMatch(val)
                          ? "Invalid Holder Name"
                          : null;
                    },
                    icon: Icon(
                      MaterialIcons.person,
                      color: Colors.blueGrey,
                    ),
                    hintText: "Card Holder Name",
                    onSaved: (val) {
                      setState(() {
                        _cardHolderName = val;
                      });
                    },
                  ),
                  CCTextField(
                    validator: (val) {
                      return !card_Exp.hasMatch(val)
                          ? "Invalid Card Number"
                          : null;
                    },
                    icon: Icon(
                      Icons.credit_card,
                      color: Colors.blueGrey,
                    ),
                    hintText: "Credit Card Number",
                    onSaved: (val) {
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
                          validator: (val) {
                            return !expiry_date.hasMatch(val)
                                ? "Invalid Expiration Date"
                                : null;
                          },
                          onSaved: (val) {
                            setState(() {
                              _expiryDate = val;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CCTextField(
                          hintText: "CVV",
                          onSaved: (val) {
                            setState(() {
                              _cvvCode = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 20),

                    alignment: Alignment.centerRight,

                    child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () async {
                        var isValid = _formKey.currentState.validate();
                        if (isValid) {
                          _formKey.currentState.save();
                          model
                              .saveCardToFirebase(_cardHolderName, _cardNumber,
                                  _cvvCode, _expiryDate)
                              .then((value) {
                            _scaffKey.currentState.showSnackBar(
                                SnackBar(content: Text('Success')));
                          }, onError: (error) {
                            _scaffKey.currentState.showSnackBar(
                                SnackBar(content: Text(error.toString())));
                          });
                        }
                      },
                      child: Text('Save'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
            // Field(),
            // Field(),
            // Field(),
          ],
        ),
      ),
    );
  }

  void _toggleMode() {
    setState(() {
      _showMode = !_showMode;
    });
  }
}

class CCTextField extends StatelessWidget {
  final hintText, onSaved, icon, validator;
  const CCTextField({
    Key key,
    this.hintText,
    this.onSaved,
    this.icon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 50,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        onSaved: onSaved,
        validator: validator,
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
