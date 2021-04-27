import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'test_multi_future_view_model.dart';

class TestMultiFutureView extends StatefulWidget {
  @override
  _TestMultiFutureViewState createState() => _TestMultiFutureViewState();
}

class _TestMultiFutureViewState extends State<TestMultiFutureView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TestMultiFutureViewModel>.reactive(
      builder:
          (BuildContext context, TestMultiFutureViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Text(viewModel.dataMap.length.toString()),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => TestMultiFutureViewModel(),
    );
  }
}
