import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Screens/shopPage.dart';
import 'package:naemen/Screens/splash_screen.dart';



import 'utils/theme_manager.dart';

void main() async {
  

  runApp(const MyApp());
}
ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

    @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }


  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 780),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
      //        theme: lightTheme,
      // darkTheme: darkTheme,
      // themeMode: _themeManager.themeMode,
            
            debugShowCheckedModeBanner: false,
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: child!,
              );
            },
            home:  
            //ShopPage()
            SplashScreen()
            ///HomePage()
            //BubbelBarExample()
              
          );
        });
  }
}
