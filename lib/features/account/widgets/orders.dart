import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);

  final List productList = [
    "https://cdn.shopify.com/s/files/1/0070/7032/files/image5_4578a9e6-2eff-4a5a-8d8c-9292252ec848.jpg?v=1620247043",
    "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy7PrzvzQ5EirKAH1wpz8gG8YFWqZR4v6kk8TPuJnvrpHUTakuy9IhjaaUuYzdn5BIick&usqp=CAU",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.sp),
              child: Text(
                "Your Orders",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.only(right: 15.sp),
              child: Text(
                "See All",
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10.w, top: 20.h),
          height: 170.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return SingleProduct(image: productList[index]);
            },
          ),
        ),
      ],
    );
  }
}
