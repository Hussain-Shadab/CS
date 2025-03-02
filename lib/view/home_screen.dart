import 'package:coffee_shop/logics/tab_buttons_logic.dart';
import 'package:coffee_shop/provider/bottom_navigation_provider.dart';
import 'package:coffee_shop/provider/increment-provider.dart';
import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/component/drop_down_button.dart';
import 'package:coffee_shop/resources/component/tab_buttons_coffee.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:coffee_shop/resources/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String imgPath;
  final String imgtext;
   HomeScreen({Key? key, required this.imgPath, required this.imgtext})
      : super(key: key);

  final List<Widget> _pages =[
    Text('0'),
    Text('1'),
    Text('4'),
    Text('5'),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    final TextEditingController searchController = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.35,
                width: width * 1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.bgColor1st, AppColors.bgColor2nd])),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Location',
                        style: TextStyle(
                            fontSize: 15.sp, color: AppColors.greyColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      DropDownButton(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.bgColor1st,
                                        AppColors.bgColor2nd
                                      ])),
                              child: TextFormField(
                                controller: searchController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search_sharp,
                                      color: AppColors.greyColor,
                                      size: 30.sm,
                                    ),
                                    hintText: 'Search Coffee',
                                    hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 15.sm),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.sm,
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomButton(
                              onTap: () {},
                              height: height * .07,
                              width: width * .1,
                              iconData: Icons.tune_outlined,
                              fontSize: 30.sm,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  width: 350.w,
                  top: 250.h,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27.0, right: 20),
                    child: Image.asset('assets/banner1.png'),
                  ))
            ],
          ),
          Expanded(
            child: Container(
              color: AppColors.greyColor.withOpacity(0.09),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: TabButtonsLogic()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Consumer<CoffeProvider>(
                            builder: (context, provider, child) {
                              print('run');
                          return TabButtonsCoffee(

                            imagePath: AppImages.flatWhite,
                            titleText: 'Flat White',
                            subTitle: 'Expresso',
                            rateText: provider.price.toString(),
                          );
                        }),
                        Consumer<CoffeProvider>(

                            builder: (context, provider, child) {
                          return TabButtonsCoffee(
                            imagePath: AppImages.mochaFusi,
                            titleText: 'Mocha Fusi',
                            subTitle: 'Ice/Hot',
                            rateText: provider.price1.toString(),
                          );
                        })
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Consumer<CoffeProvider>(
                            builder: (context, provider, child) {
                          return TabButtonsCoffee(
                            imagePath: AppImages.coffeeMachao,
                            titleText: 'Coffee Mocha',
                            subTitle: 'Deep Foam',
                            rateText: provider.price2.toString(),
                          );
                        }),
                        Consumer<CoffeProvider>(
                            builder: (context, provider, child) {
                          return TabButtonsCoffee(
                            imagePath: AppImages.coffePana,
                            titleText: 'Coffee Pana',
                            subTitle: 'Ice/Hot',
                            rateText: provider.price3.toString(),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // _pages[bottomNavigationProvider.selectedIndex], // Selected page display karein
      bottomNavigationBar: Consumer<BottomNavigationProvider>(
        builder: (context,provider,child){
          return BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyColor,
            currentIndex: bottomNavigationProvider.selectedIndex, // Selected index highlight karein
            onTap: (index){
              bottomNavigationProvider.updateIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      )
    );
  }
}
//
// class BottomNavigationBarExample extends StatefulWidget {
//   @override
//   _BottomNavigationBarState createState() => _BottomNavigationBarState();
// }
//
// class _BottomNavigationBarState extends State<BottomNavigationBarExample> {
//   int selectedIndex = 0;
//
//
//   final List<Widget> _pages = [
//     Center(child: Text('Order Page')),
//     Center(child: Text('Data Page')),
//     Center(child: Text('Section Page')),
//     Center(child: Text('Current Page')),
//   ];
//
//
//   void _onTap(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[selectedIndex], // Display the selected page
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex, // Highlight the selected item
//         onTap: _onTap, // Handle item taps
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''
//               // Add a label
//               ),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''
//               // Add a label
//               ),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications),label: '')
//         ],
//       ),
//     );
//   }
// }
