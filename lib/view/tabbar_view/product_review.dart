import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task_app/contant/constant_color.dart';
import 'package:task_app/custom_widget/custom_text.dart';
import 'package:task_app/model/product_model.dart';

class ProductReviews extends StatelessWidget {
      final ProductModel? data;

   ProductReviews({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data!.reviews!.length,
      itemBuilder: (context,index){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(text:data!.reviews![index].userName! ,size: 18.0,),
                  Spacer(),
                  RatingBar.builder(
                initialRating:double.parse( data!.reviews![index].rate.toString())
               ,
                direction: Axis.horizontal,
                ignoreGestures: true,
                itemCount: 4,
                itemSize: 16,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
                ],
              ),
              const SizedBox(height: 10.0,),
               CustomText(text:data!.reviews![index].review! ,size: 16.0,color: secondColor,),
               const SizedBox(height: 10.0,),
               CustomText(text:data!.reviews![index].createdAt! ,size: 14.0,color: secondColor,alignment: Alignment.bottomRight,),
                const SizedBox(height: 5.0,),
               Divider(thickness: 2,)
            ],
          ),
        );
      },
    );
  }
}