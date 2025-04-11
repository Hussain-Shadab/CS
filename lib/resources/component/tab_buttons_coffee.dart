import 'package:coffee_shop/provider/increment-provider.dart';
import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TabButtonsCoffee extends StatefulWidget {
  final String? imagePath;
  final String? titleText;
  final String? subTitle;
  final String? rateText;

  const TabButtonsCoffee(
      {Key? key,
        this.imagePath,
        this.titleText,
        this.subTitle,
        this.rateText,

      })
      : super(key: key);

  @override
  State<TabButtonsCoffee> createState() => _TabButtonsCoffeeState();
}

class _TabButtonsCoffeeState extends State<TabButtonsCoffee> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.r),
      height: 260.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
alignment: Alignment.topRight,
            children:[
              Container(
                height: 155.h,
                width: 160.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(0.r)),
                child: Image.asset(
                  widget.imagePath ?? '',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                
                  child: Container(
                height: 27.h,
                width: 55.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(14.r),
                      bottomLeft: Radius.circular(20.r),
                        
                      ),
                      color: AppColors.blackColor.withOpacity(0.2)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: AppColors.ratingStarColor,size: 18.r,),
                        SizedBox(width: 5.w,),
                        CustomText(text: '4.2',style: TextStyle(fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w600),)
                      ],
                    ),
              )),
            ],
          ),
          SizedBox(height: 5.h,),
          CustomText(
            text: widget.titleText ?? 'No Text is Shown',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.titleTextColor),
          ),
          SizedBox(height: 5.h,),
          CustomText(
            text: widget.subTitle ?? 'No Text is Shown',
            style: TextStyle(fontSize: 14.sp, color: AppColors.subTitleTextColor),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.rateText ?? 'Rate is Manually.',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.titleTextColor
              ),
              ),
              IncrementDecrement()
              
            ],
          )
        ],
      ),
    );
  }
  
}

class IncrementDecrement extends StatefulWidget {
  final VoidCallback? onTap;
  const IncrementDecrement({
    Key?key,
    this.onTap,
}) : super(key: key);

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {

  // int _quantity = 1;
  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final coffee=Provider.of<CoffeProvider>(context,listen: true);
    return Row(
      children: [
        // SizedBox(width: 10,),
        CustomButton(

        // padding: EdgeInsets.all(5.r),
          height: 29.h,
          width: 29.w,
          borderRadius: BorderRadius.circular(20.r),
          onTap: (){
          coffee.decrement().toString();

          // setState(() {
          //   if(_quantity > 1) _quantity --;
          // });
          },
          iconData: Icons.remove,
          iconColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,

        ),
        SizedBox(width: 2.w,),
        Consumer<CoffeProvider>(builder: (context,provider,child){
          return  CustomText(text: provider.quantity.toString());
        }),
        SizedBox(width: 2.w,),
        CustomButton(
          padding: EdgeInsets.all(5.r),
          height: 28.h,
          width: 28.w,
          fontSize: 14,
          borderRadius: BorderRadius.circular(20.r),
          onTap: (){
            coffee.increment().toString();
            // setState(() {
            //   _quantity ++;
            // });
          },
          iconData: Icons.add,
          iconColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,

        ),
      ],
    );

  }
}
