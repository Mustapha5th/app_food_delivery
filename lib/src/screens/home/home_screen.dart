import 'package:app_food_delivery/src/admin/pages/add_food_item.dart';
import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/pages/explore_page.dart';
import 'package:app_food_delivery/src/pages/home_page.dart';
import 'package:app_food_delivery/src/pages/order_page.dart';
import 'package:app_food_delivery/src/pages/profile_page.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pages

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthenticationService _firebaseAuth = AuthenticationService();

  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  ExplorePage favoritePage;
  ProfilePage profilePage;

  @override
  void initState() {
    super.initState();

    // Call the fetch method on food
    //  widget.mainModel.fetchFoods();
    //widget.model.fetchFoods();

    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = ExplorePage();
    profilePage = ProfilePage();
    pages = [homePage, favoritePage, orderPage, profilePage];

    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
                currentTabIndex == 0
                    ? "Food Delivery App"
                    : currentTabIndex == 1
                        ? "All Food Items"
                        : currentTabIndex == 2
                            ? "Orders"
                            : "Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  // size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: _buildShoppingCart(),
                onPressed: () {},
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                },
                leading: Icon(Icons.list),
                title: Text("Add food Item"),
              ),
              ListTile(
                onTap: () async {
                  dynamic result = await _firebaseAuth.signOut();
              
                },
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              )
            ]),
          ),
          resizeToAvoidBottomPadding: false,
          bottomNavigationBar: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  currentTabIndex = index;
                  currentPage = pages[index];
                });
              },
              currentIndex: currentTabIndex,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Explore"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ]),
          body: currentPage,
        ),
      ),
    );
  }

  Widget _buildShoppingCart() {
    return Stack(
      children: [
        Icon(
          Icons.shopping_cart,
          //size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          right: 0.0,
          child: Container(
            height: 12.0,
            width: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
