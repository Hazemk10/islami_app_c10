import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        SizedBox(height: 130),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(height: 25),
        Text(
          'إذاعة القرآن الكريم',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,color: provider.isDarkMode()?
          MyTheme.yellowColor
              :MyTheme.blackColor,),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_previous,color: provider.isDarkMode()?
              MyTheme.yellowColor
                  :MyTheme.primaryLight,),
              iconSize: 36,
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow,color: provider.isDarkMode()?
              MyTheme.yellowColor
                  :MyTheme.primaryLight,),
              iconSize: 48,
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next,color: provider.isDarkMode()?
              MyTheme.yellowColor
                  :MyTheme.primaryLight,),
              iconSize: 36,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
