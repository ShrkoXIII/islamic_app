import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/taps/hadeeth/hadeth_data.dart';
import 'package:islamic_app/taps/hadeeth/hadeth_details_screen.dart';
import 'package:islamic_app/widgets/loading.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<HadethData> hadeeth = [];

  @override
  Widget build(BuildContext context) {
    if (hadeeth.isEmpty) {
      load_hadeth_file();
    }
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/hadeth_logo.png'),
          Expanded(
            child: hadeeth.isEmpty
                ? Loading()
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 3,
                    ),
                    // InkWell, GestureDetector to make the widget clickable
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          HadethDetailsScreen.routename,
                          arguments: hadeeth[index],
                        );
                      },
                      child: Text(
                        hadeeth[index].title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    itemCount: hadeeth.length,
                  ),
          )
        ],
      ),
    );
  }

  Future<void> load_hadeth_file() async {
    String ahadeth_file_content =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethstring = ahadeth_file_content.split('#\r\n');
    hadeeth = ahadethstring.map((hadethString) {
      List<String> hadeeth_lines = hadethString.split('\n');
      String title = hadeeth_lines[0];
      hadeeth_lines.removeAt(0);
      List<String> content = hadeeth_lines;
      return HadethData(content: content, title: title);
    }).toList();
    setState(() {});
  }
}
