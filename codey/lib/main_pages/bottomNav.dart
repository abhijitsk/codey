import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:codey/main_pages/homepage.dart';
import 'package:codey/main_pages/profile.dart';
import 'package:codey/main_pages/search.dart';

class BottomNav extends StatefulWidget{
  const BottomNav({Key? key}) : super(key: key);

  @override
  BottomNavState createState()=> BottomNavState();
}

class BottomNavState extends State<BottomNav>{
  int _selectedIndex = 0;
  @override

  

  Widget _navOptions(int _currentIndex){
    switch(_currentIndex){
      case 0 :
        return BodyPage();

      case 1: 
        return BodyPage();

      case 2 :
        return SearchFunction();

      case 3 :
        return Profile();

        break;

      default:
       return BodyPage();
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _navOptions(_selectedIndex),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _selectedIndex,
        items: const[
          
          TabItem(title:'Home',icon: Icons.home_filled),
          TabItem(icon: Icons.category, title: 'Categories'),
          TabItem(icon: Icons.search,title: 'Search'),
          TabItem(icon: Icons.person,title: 'Profile'),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
        backgroundColor: Colors.brown,
        
      )
      
    );
  
  }
}