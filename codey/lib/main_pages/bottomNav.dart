import 'package:codey/main_pages/editprofile.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:codey/main_pages/homepage.dart';
import 'package:codey/main_pages/profile.dart';
import 'package:codey/main_pages/search.dart';
import 'package:codey/main_pages/categories.dart';


class BottomNav extends StatefulWidget{
  BottomNav({Key? key, this.index=0 }) : super(key: key);
  int index ;

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
        return CategoriesHome();

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
      body: _navOptions(widget.index),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0,
        items: const[
          
          TabItem(title:'Home',icon: Icons.home_filled),
          TabItem(icon: Icons.category, title: 'Categories'),
          TabItem(icon: Icons.search,title: 'Search'),
          TabItem(icon: Icons.person,title: 'Profile'),
        ],
        onTap: (index){
          setState(() {
            widget.index=index;
          });
        },
        backgroundColor: Colors.brown,
        
      )
      
    );
  
  }
}