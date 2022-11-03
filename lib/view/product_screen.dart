// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:task_app/contant/constant_color.dart';
import 'package:task_app/controller/getDataController.dart';
import 'package:task_app/custom_widget/custom_card_desc.dart';
import 'package:task_app/custom_widget/custom_carsoul.dart';
import 'package:task_app/custom_widget/custom_dialog.dart';
import 'package:task_app/custom_widget/custom_text.dart';
import 'package:task_app/translations/locale_keys.g.dart';
import 'package:task_app/view/tabbar_view/tab_view.dart';


import '../custom_widget/custom_main_card.dart';
class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,  ref) {
    final viewModel=ref.watch(getDataFuture);
     return Scaffold(
      backgroundColor:  Colors.grey.shade100,
      body: viewModel.data==null?
      Center(child: CircularProgressIndicator(color: primaryColor),):
       LayoutBuilder(
        builder: (context, constraints) => ListView(
          scrollDirection: Axis.vertical,
          children: [
            
            SizedBox(
              height:
              MediaQuery.of(context).size.height-300,
              width: constraints.maxWidth,
              child: Stack(
              
              children: [
                
                CustomIndicator(images: viewModel.images),
                Positioned( 
                  top: 28.0,
                  left: context.locale.languageCode=="ar"?10.0:-10.0,
                  right: context.locale.languageCode=="en"?10.0:0.0,
                  
            
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    child:Row(
                    children: [
                      Container(
                        alignment: context.locale.languageCode=="ar"?Alignment.centerLeft:Alignment.centerRight,
                        height: 30.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: context.locale.languageCode=="en"?
                          BorderRadius.only(
                            topRight:Radius.circular(10),
                            bottomRight:Radius.circular(10)):
                             BorderRadius.only(
                            topLeft:Radius.circular(10),
                            bottomLeft:Radius.circular(10))
                        ),
                        child: Icon(context.locale.languageCode=="ar"?Icons.arrow_forward:Icons.arrow_back),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Share.share('hey! check out this new app https://play.google.com/store/search?q=pub%3ADivTag&c=apps');
                        },
                        child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.share,color: Colors.grey,size: 20.0,),
                        ),
                      ),
                      SizedBox(width: 5,),
                       GestureDetector (
                        onTap: (){
                          showDialog(
              barrierColor: Colors.black26,
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: LocaleKeys.lang.tr(),
                  description:LocaleKeys.alert_desc.tr(),
                );
              },
            );
                        },
                         child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.favorite_border,color: Colors.grey,size: 20.0,),
                                             ),
                       ),
                    ],
                  )) 
                  ),
                  ///************************Store and product cart************************************************** */
                  Positioned(
                    top: MediaQuery.of(context).size.height*.37,
                    child:CustomMainCard (
                      productName: viewModel.data!.name!,
                      onSale: viewModel.data!.onSale!,
                      price: viewModel.data!.regularPrice,
                      salePrice: viewModel.data!.salePrice.toString(),
                      rating:double.parse(viewModel.data!.rate.toString()) ,
                      logoImage: viewModel.data!.store!.logo,
                      storeName:  viewModel.data!.store!.name,
                      storeAddress:  viewModel.data!.store!.fullAddress,
                    )),
                  
                   
               
              ],
                ),
            ),
            //*********************Desc******************************************* */
             CustomCardDesc(desc:viewModel.data!.desc.toString(),),
               //*********************TabView for Product******************************************* */
             TabBarViewWidget(
              data: viewModel.data,
             ),
             //****************************Button for PRODUCT************************ */
             Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
              ),
              width: 200.0,
              child: Row(
                children: [
                   Expanded(
                     child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:  context.locale.languageCode=="en"?BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          // topRight:Radius.circular(20.0) 
                          ):BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          // topRight:Radius.circular(20.0) 
                          )
                      ),
                      child:
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              
                              viewModel.decrementCount();
                            },
                            child: Container(
                              padding: EdgeInsets.only(bottom: 30.0),
                              alignment: Alignment.center,
                              
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                              ),
                              child: Center(child: Icon(Icons.minimize,size: 20.0,)),
                            ),
                          ),
                          
                          CustomText(text: viewModel.count.toString(),size: 18,color: Colors.white,alignment: Alignment.center),
                          GestureDetector(
                            onTap: (){
                              
                              viewModel.incrementCount();
                            },
                            child: Container(
                              
                              // padding: EdgeInsets.only(bottom: 30.0),
                              alignment: Alignment.center,
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white

                              ),
                              child: Center(child: Icon(Icons.add,size: 20.0,)),
                            ),
                          ),
                   
                        ],
                      ),
                                     ),
                   ),
                  Container(
                    width: 100.0,
                    height: 60.0,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                        borderRadius: context.locale.languageCode=="en"? BorderRadius.only(
                          
                           topRight:Radius.circular(20.0) ,
                           bottomRight:Radius.circular(20.0) , 
                          ):BorderRadius.only(
                          
                           topLeft:Radius.circular(20.0) ,
                           bottomLeft:Radius.circular(20.0) , 
                          )
                    ),
                    child: CustomText(text: LocaleKeys.add_cart.tr(),size: 16,color: Colors.white,alignment: Alignment.center),
                  )
                ],
              ),
             )
             
          ],
        ),
      ),
    );
  }
}
