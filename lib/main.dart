import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/translations/codegen_loader.g.dart';
import 'package:task_app/view/product_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   runApp(
    EasyLocalization(
      child:  ProviderScope(child: MyApp()), 
      supportedLocales: [Locale('en'), Locale('ar',)],
      fallbackLocale:Locale('en',), 
      path:'assets/translations',
      assetLoader: CodegenLoader(),
      )
   
    );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ProductScreen(),
    );
  }
}


