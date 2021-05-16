import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:stacked/stacked.dart';
import 'transaction_history_view_model.dart';

class TransactionHistoryView extends StatelessWidget {
  var index = 1;
  var font = GoogleFonts.montserrat(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionHistoryViewModel>.reactive(
      builder: (BuildContext context, TransactionHistoryViewModel viewModel,
          Widget _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Transaction History"),
          ),
          body: Center(
            child: ListView(
              children: [
                if (viewModel.dataReady)
                  ...viewModel.tHistory.docs.map((e) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Text(
                          "${index++}",
                          style: font,
                        ),
                        tileColor: widgetcolor,
                        title: Text(
                          e['card_number'],
                          style: font,
                        ),
                        subtitle: Text(
                          e['reason'],
                          style: font.copyWith(color: Colors.grey),
                        ),
                        trailing: Text(
                          e['amount'],
                          style: font.copyWith(color: Colors.blue),
                        ),
                      ),
                    );
                  })
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => TransactionHistoryViewModel(),
    );
  }
}
