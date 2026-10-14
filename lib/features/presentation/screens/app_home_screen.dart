import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sabzi_bill/features/presentation/providers/home_screen_provider.dart';
import 'package:sabzi_bill/features/presentation/screens/customers/customers_list.dart';
import 'package:sabzi_bill/utils/const/app_text.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> homePageTitle = [
    AppText.appName,
    AppText.billHistory,
    AppText.vegetable,
    AppText.settings,
  ];
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<HomeScreenProvider>(
          builder: (context, provider, child) =>
              Text(homePageTitle[provider.currentIndex]),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomersListScreen(),
          Container(color: Colors.red),
          Container(color: Colors.purple),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Consumer<HomeScreenProvider>(
          builder: (context, provider, child) => BottomNavigationBar(
            onTap: (value) {
              provider.updateCurrentIndex(value);
              pageController.jumpToPage(value);
            },
            currentIndex: provider.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt),
                label: AppText.customers,
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.doc_chart_fill),
                label: AppText.bills,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.leaf),
                label: AppText.vegetable,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppText.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
