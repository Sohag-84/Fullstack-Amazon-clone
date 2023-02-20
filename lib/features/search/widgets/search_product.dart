// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/star.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchProduct extends StatelessWidget {
  final Product product;
  const SearchProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    double avgRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                height: 135.h,
                width: 135.w,
                fit: BoxFit.contain,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    child: Stars(rating: avgRating),
                  ),
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    child: Text(
                      "\$${product.price}",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Eligible for FREE shipping",
                    ),
                  ),
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    child: Text(
                      "In Stock",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
