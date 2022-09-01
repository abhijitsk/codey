import 'package:flutter/material.dart';
import 'package:codey/models/fromDatabase.dart';

class SearchFunction extends StatefulWidget {
  @override
  SearchFunctionState createState() => SearchFunctionState();


}

class SearchFunctionState extends State<SearchFunction> {
  String brandName = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            
        color: Colors.brown[200],
        padding: EdgeInsets.all(20.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Browse Offers',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (val){
                      setState(() {
                        brandName = val;
                      });
                    },
                    style: TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.grey[700],
                        ),
                        hintText: 'Search the brand',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Image.asset(
                    'images/filter.png',
                    color: Colors.black,)),
              ),
            SizedBox(width:5),
            ],
          ),
        SizedBox(height: 20),
        FromDatabase(brandName: brandName,),
        ]),
      ),
    );
  }
}
