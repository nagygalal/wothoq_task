import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_model.dart';

final getDataFuture=ChangeNotifierProvider<GetData>((ref)=>GetData());

class GetData extends ChangeNotifier{
  String? token;
  ProductModel? data;
 List<Images>images=[];
 int count=1;
  GetData(){
    getDataApi();
  }
  void incrementCount(){
  count++;
  notifyListeners();
  }
  void decrementCount(){
    if(count>0){
      count--;

    }
  
  notifyListeners();
  }
  Future getDataApi()async{
    // images=[];
     var dio=Dio();
    dio.options.headers={
      "lang":"en",
      "Content-Type":"application/json",
      "Authorization":token,

    };
    
    
   final response= await dio.get("https://run.mocky.io/v3/1243be15-efd5-4132-9bd0-eeb33f325f51",);
   print(response.data.toString());
  
    data=ProductModel.fromJson(response.data);
     List<Images>imageList=data!.images!;
    for(int i=0;i<imageList.length;i++){
      Images img=Images(
        id:data!.images![i].id,
        img:data!.images![i].img,  
      );
       images.add(img);
       notifyListeners();
     

    }
    
    
  }
}