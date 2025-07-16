import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/taps/hadeeth/hadeth_data.dart';
import 'package:islamic_app/widgets/loading.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routename = 'hadeth_details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HadethData hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethData;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            hadeth.title,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppTheme.wight,
          ),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemBuilder: (context, index) => Text(
              hadeth.content[index],
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            itemCount: hadeth.content.length,
          ),
        ),
      ),
    );
  }
}
