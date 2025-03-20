import 'package:coffee_shop/logics/tab_buttons_logic.dart';
import 'package:coffee_shop/provider/bottom_navigation_provider.dart';
import 'package:coffee_shop/provider/increment-provider.dart';
import 'package:coffee_shop/provider/tab_buttons_provider.dart';
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

  final List<Widget> _pages = [
    Text('0'),
    Text('1'),
    Text('4'),
    Text('5'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);

    final TextEditingController searchController = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final coffeProvider = Provider.of<CoffeeProvider>(context);
    final tabProvider = Provider.of<TabButtonsProvider>(context);
    List<Map<String, dynamic>> filteredCoffee =
        coffeProvider.coffeeItems.where((coffee) {
      String selectedCategory = [
        'All Coffee',
        'Machiato',
        'Latte',
        'Latte Special'
      ][tabProvider.selectedIndex];
      bool isMatch = selectedCategory == 'All Coffee' ||
          coffee['category'] == selectedCategory;
      print("Item: ${coffee['title']}, Category: ${coffee['category']}, Match: $isMatch");
      return isMatch;
    }).toList();
    return Scaffold(
        body: Stack(children: [
          Column(
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
              SizedBox(
                height: 60.h,
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
                        Consumer<CoffeProvider>(
                          builder: (context, provider, child) {
                            List<Map<String, dynamic>> filteredCoffee =
                                coffeProvider.coffeeItems.where((coffee) {
                              String selectedCategory = [
                                'All Coffee',
                                'Machiato',
                                'Latte',
                                'Latte Special'
                              ][tabProvider.selectedIndex];
                              return selectedCategory == 'All Coffee' ||
                                  coffee['category'] == selectedCategory;
                            }).toList();

                            return Column(
                              children: filteredCoffee.map((coffee) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TabButtonsCoffee(
                                    imagePath: getCoffeeImage(coffee['title']),
                                    titleText: coffee['title'],
                                    subTitle: coffee['subTitle'],
                                    rateText: coffee['price'].toString(),
                                  ),
                                );
                              }).toList(),
                            );
                          },
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
          Positioned(
              width: 360.w,
              top: 180.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10.r),
                        // ),
                        child: Stack(
                      children: [
                        Image.asset(
                          AppImages.banner,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            left: 30,
                            top: 20,
                            child: Container(
                              height: 26.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  color: AppColors.promoColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: CustomText(
                                  text: 'Promo',
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                ),
                              ),
                            )),
                        // SizedBox(height: 40),

                        Positioned(
                            left: 30,
                            top: 70,
                            child: Image.asset(AppImages.getFree))
                      ],
                    ))),
              )),
        ]),
        // _pages[bottomNavigationProvider.selectedIndex], // Selected page display karein
        bottomNavigationBar: Consumer<BottomNavigationProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.greyColor,
              currentIndex: bottomNavigationProvider.selectedIndex,
              // Selected index highlight karein
              onTap: (index) {
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
        ));
  }

  String getCoffeeImage(String title) {
    switch (title) {
      case 'Flat White':
        return AppImages.flatWhite;
      case 'Mocha Fusi':
        return AppImages.mochaFusi;
      case 'Coffee Machao':
        return AppImages.coffeeMachao;
      case 'Coffee Pana':
        return AppImages.coffePana;

      default:
        return AppImages.mochaFusi; // Fallback image
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
}
