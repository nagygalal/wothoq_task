import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_app/contant/constant_color.dart';
import 'package:task_app/custom_widget/custom_text.dart';

import '../../model/product_model.dart';

class ProductDetails extends StatelessWidget {
    final ProductModel? data;

   ProductDetails({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
      itemCount: data!.productDetails!.length,
      //  shrinkWrap: true,
      itemBuilder: (context,index){
        return Container(
          height: 30.0,
          alignment: Alignment.center,
          color: index.isOdd?Colors.grey.shade200:Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text:context.locale.languageCode=="en"?
              data!.productDetails![index].nameEn!:data!.productDetails![index].nameAr!,alignment: Alignment.center,),
              Spacer(),
               CustomText(text: data!.productDetails![index].value!,alignment: Alignment.center,),
            ],
          ),
        );
      },
    );
  }
}