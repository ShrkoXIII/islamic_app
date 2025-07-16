import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/widgets/loading.dart';

class SurahDetailsScreen extends StatefulWidget {
  static const String routename = 'sura_details';

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SurahDetailsScreenArguments args = ModalRoute.of(context)!
        .settings
        .arguments as SurahDetailsScreenArguments;
    if (ayat.isEmpty) {
      loadsurafile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.sura_name,
          ),
        ),
        body: ayat.isEmpty
            ? Loading()
            : Container(
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
                    ayat[index],
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  itemCount: ayat.length,
                ),
              ),
      ),
    );
  }

  Future<void> loadsurafile(int index) async {
    // read file
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    ayat = sura.split('\n');
    setState(() {});
  }
}

class SurahDetailsScreenArguments {
  int index;
  String sura_name;
  SurahDetailsScreenArguments({required this.index, required this.sura_name});
}
