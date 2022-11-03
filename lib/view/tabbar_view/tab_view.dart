// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/contant/constant_color.dart';
import 'package:task_app/custom_widget/custom_text.dart';
import 'package:task_app/model/product_model.dart' as model;
import 'package:task_app/view/tabbar_view/product_details.dart';
import 'package:task_app/view/tabbar_view/product_review.dart';

class TabBarViewWidget extends StatefulWidget {
       final model.ProductModel? data;

  TabBarViewWidget({Key? key,this.data}) : super(key: key);

  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        height:MediaQuery.of(context).size.height-300,
        child: Column(
          children: [
            TabBar(
              labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.black,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              tabs:const [

                Tab(child: Text("Product Details",),),
                Tab(child: Text("Product Review"),),

              ],
              
            ),
             Expanded(
             child: TabBarView(
               children: [
                 // first tab bar view widget
                 ProductDetails(data:widget.data),
                 ProductReviews(data: widget.data),

                 // second tab bar viiew widget
                
               ],
             ),
              ),

          ],
        ),
      ),

    );
  }
}