// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/star.dart';
import 'package:amazon_clone/features/product_details/services/product_details_services.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:amazon_clone/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';
import '../../search/screens/search_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "/product-details";
  final Product product;
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;

      if (widget.product.rating![i].userId == userProvider.user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  navigateToSearchScreen(searchQuery) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: searchQuery,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42.h,
                  margin: EdgeInsets.only(left: 15.w),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(7.r),
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.search),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.only(top: 20.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1.w),
                        ),
                        hintText: "Search product",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 42.h,
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25.h,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  Stars(rating: avgRating),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(height: 15.h),
              CarouselSlider(
                items: widget.product.images.map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) => Image.network(
                        i,
                        fit: BoxFit.cover,
                        height: 200.h,
                      ),
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 230.h,
                  autoPlay: true,
                ),
              ),
              Divider(color: Colors.black12),
              RichText(
                text: TextSpan(
                  text: "Deal Price: ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\$${widget.product.price}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Text(widget.product.description),
              Divider(color: Colors.black12),
              SizedBox(height: 12.h),
              CustomButton(text: "By Now", onTap: () {}),
              SizedBox(height: 12.h),
              CustomButton(
                text: "Add to Cart",
                color: Color.fromRGBO(254, 216, 19, 1),
                onTap: () {},
              ),
              SizedBox(height: 10.h),
              Divider(color: Colors.black12),
              Text(
                "Rate The Product",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBar.builder(
                initialRating: myRating,
                allowHalfRating: true,
                minRating: 1,
                itemCount: 5,
                direction: Axis.horizontal,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: GlobalVariables.secondaryColor,
                  );
                },
                onRatingUpdate: (value) {
                  ProducDetailsServices().rateProduct(
                    context: context,
                    product: widget.product,
                    rating: value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
