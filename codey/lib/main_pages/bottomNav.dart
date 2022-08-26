import 'package:flutter/material.dart';
import 'package:codey/main_pages/homepage.dart';
import 'package:codey/main_pages/profile.dart';

class BottomNav extends StatefulWidget{
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState()=> _BottomNavState();
}

class _BottomNavState extends State<BottomNav>{
  @override

  int _selectedIndex = 0;

  Widget _navOptions(int _currentIndex){
    switch(_currentIndex){
      case 0 :
        return BodyPage();

      case 1: 
        return BodyPage();

      case 2 :
        return BodyPage();

      case 3 :
        return UserDetails();

        break;

      default:
       return BodyPage();
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _navOptions(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        selectedLabelStyle: TextStyle(color: Colors.black,fontSize: 15),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            
            label: 'Home',
            icon: _selectedIndex ==0?Icon(Icons.home_filled):Icon(Icons.home_outlined),

          ),
          BottomNavigationBarItem(
            label: 'Category',
            icon: _selectedIndex ==1?Icon(Icons.category):Icon(Icons.category_outlined),
            
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: _selectedIndex ==2?Icon(Icons.settings):Icon(Icons.settings_outlined),
            
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: _selectedIndex ==3?Icon(Icons.person):Icon(Icons.person_outline),
            
          )
        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      
    );
  
  }
}