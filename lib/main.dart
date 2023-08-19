import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Cache Helper/cache_helper.dart';
import 'Screens/Loading/loading_screen.dart';
import 'Screens/OnBoarding/OnBoarding_second/on_boarding_second_screen.dart';
import 'Screens/home/Chat/chat details/chat_details_screen.dart';
import 'Screens/home/Google Map/gogle_map_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screens/home/My Map/map_screen.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.onInit();

  bool isFirstLaunch =await CacheHelper.getFromSharedPreferences('isFirstLaunch') ?? true;

  if (isFirstLaunch) {
    runApp(MyApp(firstRun: true,));
    await CacheHelper.saveToSharedPreferences('isFirstLaunch', false);
  } else {
    runApp(MyApp(firstRun: false,));
  }
 
}

class MyApp extends StatelessWidget {
   MyApp({super.key, required this.firstRun});
  final bool firstRun;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ScreenUtilInit(
          designSize:const Size(428, 926),
          builder: (BuildContext context, Widget? child) {
            return  GetMaterialApp(
                debugShowCheckedModeBanner: false,
                home:LoadingScreen(firstRun: firstRun,)//OnBoardingSecondScreen()////ViewScreen()//OpenChatScreen()//MapScreen()//
            );
          }
      ),
    );
  }
}