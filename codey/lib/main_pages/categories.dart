import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:codey/models/fromDatabase.dart';


class CategoriesHome extends StatelessWidget{
  const CategoriesHome({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context){
    return SafeArea(
      child: SingleChildScrollView(
              child: Container(
    padding: const EdgeInsets.all(15.0),
    color: Colors.brown[400],
    child: Column(children: [
        const SizedBox(height:25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Card(
            elevation: 10,
            child: Column(
              children: [
                Container(
                  color: Colors.brown[200],
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width*0.42,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesSub(category: 'Fashion')));
                    },
                    child: Image.asset('images/fashion.jpg',
                    fit:BoxFit.fill
                    ),)
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.42,
                  color: Colors.brown[300],
                  child: const Center(
                    child: Text(
                      'Fashion',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                  ),
                ),
              ],
            ), ),
          Card(
            elevation: 10,
            child: Column(
              children: [
                Container(
                  color: Colors.brown[200],
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width*0.42,
                  child:InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesSub(category: 'Lifestyle')));
                    
                    } ,
                    child: Image.asset(
                      'images/footwear.jpg',
                      fit:BoxFit.fill,
                      ),)
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.42,
                  color: Colors.brown[300],
                  child: const Center(
                    child: Text(
                      'Footwear',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                  ),
                ),
              ],
            ), ),
        ],),
        //------------------------------------------------------------------------------------------->
        const SizedBox(height:40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Card(
            
            elevation: 10,
            child: Column(
              children: [
                Container(
                  
                  color: Colors.brown[200],
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width*0.42,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesSub(category: 'Jewelery')));
                    },
                    child: Image.asset('images/jewellery.jpg',
                      fit:BoxFit.fill
                    ),)
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.42,
                  color: Colors.brown[300],
                  child: const Center(
                    child: Text(
                      'Jewellery',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                  ),
                ),
              ],
            ), ),
          Card(
            elevation: 10,
            child: Column(
              children: [
                Container(
                  color: Colors.brown[200],
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width*0.42,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesSub(category: 'Food')));
                    },
                    child: Image.asset('images/food.jpg',
                    fit:BoxFit.fill
                    ),)
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.42,
                  color: Colors.brown[300],
                  child: const Center(
                    child: Text(
                      'Food',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                  ),
                ),
                
              ],
            ), ),
        ],),

        SizedBox(height:30),
        
    ]),
          ),
      ),
      );
  }
}


class CategoriesSub extends StatelessWidget{
  String category;
  final user = FirebaseAuth.instance.currentUser;

  

   CategoriesSub({Key? key,  required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Center(child: Text('Categories_Detailed'),)),
          body: Container(
        width: MediaQuery.of(context).size.width*1,
        padding: EdgeInsets.all(20),
        color: Colors.brown[100],
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Database').where('category',isEqualTo:category).snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapShot){
            if(snapShot.hasData){
              var element = snapShot.requireData;
              return ListView.builder(
                
              itemCount: element.size,
              itemBuilder: (context,index){

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.035 ,
                          padding: EdgeInsets.all(5),
                          color: Colors.brown[300],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage(element.docs[index]['logo']),
                              ),
                              Text(
                                element.docs[index]['Name'],
                                style: TextStyle(
                                  color: Colors.brown[800],
                                  fontSize: 20,
                                  ),
                                  ),
                              Container(
                                color: Colors.brown[300],
                                child:Row(children: [
                                  InkWell(
                                    child: Icon(Icons.favorite,color: Colors.grey,size: 20,),
                                  ),
                                  SizedBox(width: 15,),
                                  InkWell(
                                    child: Icon(Icons.share,color: Colors.grey,size: 20,),
                                    
                                  ),
                                  SizedBox(width:10),
                                ],)
                              )
                            ]
                          ),
                        ),
                        //-------------------------------------------------------------------->
                        
                        Container(
                          color: Colors.brown[200],
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Enjoy '+element.docs[index]['offer'].toString()+'% off on your favourite brand',
                                style: TextStyle(fontSize: 10),
                                ),
                              Text(
                                'Shopping for your favourite '+element.docs[index]['category']+' was never this easy',
                                style: TextStyle(fontSize: 10),
                                ),
                              SizedBox(height:15),
                              Center(child: Text('Rate this')),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                IconButton(
                                  onPressed: (){}, icon: Icon(Icons.thumb_up_sharp,size: 20,)),
                                IconButton(
                                  onPressed: (){}, icon: Icon(Icons.thumb_down_sharp,size: 20,))
                              ],),

                              Padding(
                                padding: const EdgeInsets.only(left:45.0),
                                child: Row(children:[
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.45,
                                    color: Colors.brown,
                                    child: Center(child: Text(element.docs[index]['offerCode']))),
                                  MaterialButton(
                                    onPressed: (){},
                                    child: Text('Copy Code'),)
                                ]),
                              ),
                              
                                
                            ],
                          ),
                        ),
                        Container(
                                //child:Image.network('https://helpfulreader.com/wp-content/uploads/2018/03/lifestyle-848x500.jpg')
                              ),
                        Text(element.docs[index]['Name'].toString()+' '+index.toString()),
                      ],
                    ),
                    ),
                );
              },
              
                
              
              );
            }
            //var element = snapShotat;

            return Container(
              child: Center(
                child: Text('Check for debug'),
                ),
                );

          }),
      ),
    );
  }
}