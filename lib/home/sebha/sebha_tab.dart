import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbehCount=0;
  int index=0;
  double angle=0;
  List<String> tasbeh=[
   'سبحان الله',
   'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'لا حول ولا قوة إلا بالله'
  ];
onTap(){
tasbehCount++;
angle+=3;
if(tasbehCount%33==0){
 index++;
}
if(index==tasbeh.length){
  index=0;
  tasbehCount=0;
}
setState(() {

});
}

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 40,),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              provider.isDarkMode()?
              Image.asset(
                'assets/images/head_sebha_dark.png',

              )
                  :
              Image.asset(
                'assets/images/head_sebha_logo.png',

              ),
              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.085),
                child: GestureDetector(
                  onTap: onTap,
                    child: Transform.rotate(angle: angle,
                    child:
                    provider.isDarkMode()?
                    Image.asset(
                      'assets/images/body_sebha_dark.png',

                    )
                        :
                    Image.asset(
                      'assets/images/body_sebha_logo.png',

                    ),)),
              ),
            ],
          ),
          SizedBox(height: 10,),

          Text('عدد التسبيحات',
           style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,
             color: provider.isDarkMode()?
             MyTheme.yellowColor
                 :MyTheme.blackColor,),

          ),
          Container(
            padding:EdgeInsets.all(20) ,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(color: provider.isDarkMode()?
            MyTheme.yellowColor
                :MyTheme.primaryLight,
                borderRadius: BorderRadius.circular(20)),
            child: Text('$tasbehCount',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,
            ),
          )
          ),
          Container(
              padding:EdgeInsets.symmetric(vertical: 8,horizontal: 12) ,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: provider.isDarkMode()?
              MyTheme.yellowColor
                  :MyTheme.primaryLight,
                  borderRadius: BorderRadius.circular(26)),
              child: Text(tasbeh[index],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,),
              )
          ),

        ],
      ),
    );
  }
}
