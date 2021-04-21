import 'package:flutter/material.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';
import 'show_qr_code_view_model.dart';

class ShowQrCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowQrCodeViewModel>.reactive(
      builder: (BuildContext context, ShowQrCodeViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundcolor,
          ),
          body: Center(
            child: QrImage(
              foregroundColor: Colors.white,
              gapless: false,
              data: viewModel.registrationId,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
        );
      },
      viewModelBuilder: () => ShowQrCodeViewModel(),
    );
  }
}
