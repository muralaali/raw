import 'package:flutter/material.dart';
import 'package:raw/ui/views/home/widgets/home_header.dart';
import 'package:raw/ui/views/home/widgets/home_search_text_field.dart';
import 'package:raw/ui/views/home/widgets/home_services.dart';
import 'package:raw/ui/views/home/widgets/home_slider_widget.dart';
import 'package:raw/ui/views/home/widgets/home_top_rated.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      onModelReady: (HomeViewModel model) async => await model.init(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) =>
          Scaffold(
              body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
        child: Column(
          children: [
            HomeHeaderWidget(model),
            HomeSearchTextFieldWidget(
              model,
              controller: model.searchController,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeSliderWidget(model),
                    HomeServicesWidget(model),
                    HomeTopRatedWidget(model),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
