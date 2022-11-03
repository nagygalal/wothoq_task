// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task_app/contant/constant_color.dart';
import 'package:task_app/custom_widget/custom_text.dart';

class CustomMainCard extends StatelessWidget {
  final String? productName;
  final dynamic price;
  final String? salePrice;
  final bool? onSale;
  final double? rating;
  final String? logoImage;
  final String? storeName;
  final String? storeAddress;

  const CustomMainCard(
      {Key? key,
      this.productName,
      this.price,
      this.salePrice,
      this.onSale = false,
      this.rating,
      this.logoImage,
      this.storeName,
      this.storeAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      child: Column(
        children: [
          CustomText(
            text: productName!,
            size: 20.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              onSale == true
                  ? CustomText(
                      text: salePrice!+ " SAR",
                      size: 18.0,
                    )
                  : SizedBox(),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: price.toString()+ " SAR",
                size: 16.0,
                color: secondColor,
                decoration: TextDecoration.lineThrough,
              ),
              Spacer(),
              RatingBar.builder(
                initialRating: rating!,
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
              SizedBox(
                width: 10.0,
              ),
              CustomText(
                text: "(" + rating.toString() + ")",
                size: 15.0,
                color: secondColor,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Divider(thickness: 2, color: secondColor, endIndent: 7, indent: 7),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
             
              CachedNetworkImage(
        imageUrl:logoImage!,
  imageBuilder: (context, imageProvider) => Container(
    width: 60.0,
    height: 60.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey,
      image: DecorationImage(
        image: imageProvider, fit: BoxFit.fill),
    ),
  ),
  placeholder: (context, url) => Icon(Icons.error),
  errorWidget: (context, url, error) => Icon(Icons.error),
),
                
              SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: storeName!,
                    size: 18.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.red),
                      CustomText(
                        text: storeAddress!,
                        size: 16.0,
                        color: secondColor,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
