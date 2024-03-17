import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/quran/item_sura_details_screen.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
class SuraDetailsScreen extends StatefulWidget {
static const String routeName ='sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
List<String> verses =[];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args =ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(verses.isEmpty){
      loadFile(args.index);
    }
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset(
          'assets/images/dark_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        )
            :
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
    Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    title: Text(
    '${args.name}',
    style: Theme.of(context).textTheme.titleLarge,
    ),
    ),
      body: verses.isEmpty?
          Center(child: CircularProgressIndicator(
            color: MyTheme.primaryLight,
          ))
          :
      Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height*0.06 ,
          horizontal: MediaQuery.of(context).size.width*0.05 ,
        ),

        decoration: BoxDecoration(
            color: provider.isDarkMode()?
                MyTheme.primaryDark
                :
            MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(25)
        ),
        child: ListView.separated(
          separatorBuilder: (context,index){
            return Divider(
              color: provider.isDarkMode()?
              MyTheme.yellowColor
                  :MyTheme.primaryLight,
              thickness: 1,
            );
          },
            itemBuilder: (context,index){
           return ItemSuraDetailsScreen(name:verses[index], index: index,);
            },
          itemCount: verses.length ,
        ),
      ) ,
    ),
    ]
    );
  }

  void loadFile(int index)async{
    String content =await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines = content.split('\n');
    verses = lines ;
    setState(() {

    });

  }
}
class SuraDetailsArgs{
  String name;
  int index;
  SuraDetailsArgs({required this.name,required this.index});
}