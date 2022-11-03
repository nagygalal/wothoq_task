import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task_app/model/product_model.dart';

import '../contant/constant_color.dart';
 
class CustomIndicator extends StatefulWidget {
  final List<Images>images;

  const CustomIndicator({super.key, required this.images});
  @override
  State<StatefulWidget> createState() {
    return CustomIndicatorState();
  }
}
 
class CustomIndicatorState extends State<CustomIndicator> {
 
  int currentPos = 0;
 
 
  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: Alignment.bottomCenter,
        children: [
          Container(
            width:  MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(

              itemCount: widget.images.length,
              options: CarouselOptions(
                height: 270.0,
                viewportFraction: 1,
                // initialPage: 1,

                  // autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  }
              ),
              itemBuilder: (context,indexx,index){
                return MyImageView( widget.images[indexx]);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  widget.images.map((url) {
              int index =  widget.images.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPos == index
                      ? primaryColor
                      : Colors.white,
                ),
              );
            }).toList(),
          ),
        ]
      );
    
  }
}
 
class MyImageView extends StatelessWidget{
 
  Images imgPath;
 
  MyImageView(this.imgPath);
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
   imageUrl:imgPath.img!,
   placeholder: (context, url) =>Image.network("https://www.nicepng.com/png/detail/225-2255762_error404-error-404-icono-png.png")  ,
   errorWidget: (context, url, error) =>  Icon(Icons.error),
);
    
  }
 
}