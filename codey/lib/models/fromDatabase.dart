

import 'package:codey/models/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';


class FromDatabase extends StatefulWidget{
  FromDatabase({Key? key, required this.brandName}) : super(key: key);
  String brandName = "";
  
  @override
  

  _FromDatabaseState createState()=>_FromDatabaseState();
}

class _FromDatabaseState extends State<FromDatabase>{
  bool isVisible = false;
  
  final user = FirebaseAuth.instance.currentUser;


  final Stream<QuerySnapshot>  database = FirebaseFirestore.instance.collection('Database').snapshots();
  
    
  
  
  
  @override

  addRemovefav(List id,bool isFav){

    if(isFav==false){
      try{
       FirebaseFirestore.instance.collection('EditProfile').doc(user?.email.toString()).update({'fav':FieldValue.arrayUnion(id)});
    }catch(e){

      print('error');

    }

    }else{
      try{
         FirebaseFirestore.instance.collection('EditProfile').doc(user?.email.toString()).update({'fav':FieldValue.arrayRemove(id)});

      }catch(e){

      }
    }

    


  }

  

  Widget build(BuildContext context){
    return FutureBuilder(
      future: FirestoreData().getData(),
      builder: (context,AsyncSnapshot userdata) {
       
          return Container(
          
          width: MediaQuery.of(context).size.width*1,
          color: Colors.brown[400],
          child: StreamBuilder<QuerySnapshot>(stream: database,builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
            if  (snapshot.hasError){
              return const Text('Something Went Wrong');
            }
            if (snapshot.connectionState==ConnectionState.waiting){
              return const Text('Connection issue');
            }
            final data = snapshot.requireData;
            
          
            
            return ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 700,),
                      child: ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index){
                  var search_data = snapshot.data!.docs[index].data()
                    as Map<String,dynamic>;
                  bool _islikebuttonClicked = false;
                  if(userdata.hasData){

                  
                  if(userdata.data['fav'].contains(data.docs[index].id)){
                    _islikebuttonClicked = true;

                  }

                  }

                  if (search_data['Name'].toString().toLowerCase().startsWith(widget.brandName.toLowerCase())){
                   return Padding(
                     padding: EdgeInsets.all(8),
                                        child: Card(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       elevation: 10,
                       child: Container(
                         width: MediaQuery.of(context).size.width*0.9,
                         height: 200,
                         decoration: BoxDecoration(
                           color: Colors.brown[300],
                           ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const SizedBox(width:5),

                             Card(
                               elevation: 20,
                                 child: Container(
                                 
                                 decoration: const BoxDecoration(),
                                 height: 60,
                                 width: 60,
                                 child: Image.asset(data.docs[index]['logo'],fit:BoxFit.fill),
                                 ),
                             ),

                             const SizedBox(width:5),

                             Container(
                               width: 150,
                               color: Colors.brown[300],
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center, 
                                 children: [
                                   Text(
                                     textAlign:TextAlign.center,
                                     data.docs[index]['Name'].toString(),
                                     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                                   ),
                                   Text(
                                     textAlign:TextAlign.center,
                                   ''+data.docs[index]['offer']+ '% off'+' on selected merchandise'+'\n'+'Grab it before offer expires',
                                   style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                                   ),
                                   
                                   
                               ],),
                             ),

                             const SizedBox(width:5),

                             

                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                               IconButton(
                                 
                                 onPressed: (){
                                   
                                   addRemovefav([data.docs[index].id],_islikebuttonClicked);
                                   
                                   setState(() {

                                     
                                     _islikebuttonClicked = !_islikebuttonClicked;
                                   });
                                    },
                                 icon:  (Icon(Icons.favorite,
                                   color: _islikebuttonClicked? Colors.red:Colors.grey,
                                   shadows:[ Shadow(color:Colors.brown,offset: Offset(1.0,2.0),blurRadius: 10)],
                                   ))),

                               const SizedBox(height: 30,),

                               MaterialButton(
                                 onPressed: (){
                                   
                                   var code = data.docs[index]['offerCode'];
                                   showModalBottomSheet(
                                     //isScrollControlled: true,
                                     backgroundColor: Colors.brown[200],
                                     context: context,
                                     shape: const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.vertical(top:Radius.circular(25))
                                     ), 
                                     builder: (BuildContext context){

                                       return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                                         return Container(
                                       padding: const EdgeInsets.all(20),

                                       height: MediaQuery.of(context).size.height*0.7,
                                       child: Column(

                                         children: [
                                           Container(
                                             width: MediaQuery.of(context).size.width*1,
                                    
                                            // color: Colors.cyan,
                                             child: Stack(
                                               children: [
                                                 
                                                 Row(
                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                    Card(
                                                   elevation: 20,
                                                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(95)),
                                                   child: CircleAvatar(
                                                    radius: 50,
                                                    //child: Image.asset(data.docs[index]['logo']),
                                                    foregroundImage: AssetImage(data.docs[index]['logo'],),
                                                   ),
                                               ),
                                                   
                                                Container(
                                                    width: MediaQuery.of(context).size.width*0.5,
                                                    child: Text(
                                                     
                                                     textAlign:TextAlign.center,
                                                     data.docs[index]['Name'].toString(),
                                                     style:  TextStyle(//shadows: [ Shadow(blurRadius:10,color: Colors.brown,offset:Offset(5.0,5.0)]),
                                                       fontSize: 30,fontWeight: FontWeight.bold,
                                                       shadows: [Shadow(blurRadius: 10,color: Colors.brown,offset: Offset(5.0,5.0))],)
                                                     ),
                                                ),
                                                    IconButton(onPressed: (){
                                                      //await Share.share('Pls check this out');

                                                      setState((){

                                                       isVisible=!isVisible;

                                                      });
                                                      
                                                    }, icon: Icon(Icons.share,shadows: [
                                                      Shadow(color: Colors.brown,offset:Offset(4,3),blurRadius: 9)
                                                    ],)),
                                                      ],
                                                
                                                    ),
                                                    Positioned(
                                                   top: 8,
                                                   right:35,
                                                  child: Card(
                                                     color: Colors.brown[100],
                                                     

                                                      child: Visibility(
                                                        visible: isVisible,
                                                                                                            child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         mainAxisSize: MainAxisSize.min,
                                                         children: [
                                                           IconButton(
                                                             onPressed: (){
                                                             setState((){
                                                               isVisible = !isVisible;
                                                             });
                                                           }, 
                                                           icon: Icon(
                                                             FontAwesomeIcons.facebookMessenger,
                                                             color: Colors.blue,
                                                             size:35,
                                                             shadows: [
                                                               Shadow(blurRadius: 1, color:Colors.brown.shade200,offset: Offset(5,5))
                                                             ],
                                                             )),

                                                           IconButton(onPressed: (){
                                                             setState((){
                                                               isVisible = !isVisible;
                                                             });
                                                           }, icon: Icon(
                                                             FontAwesomeIcons.whatsapp,
                                                             color: Colors.green.shade900,
                                                             size:35,
                                                             shadows: [
                                                                Shadow(blurRadius: 1, color:Colors.brown.shade200,offset: Offset(5,5))
                                                             ],
                                                             )),
                                                           IconButton(onPressed: (){
                                                             setState((){
                                                               isVisible = !isVisible;
                                                             });
                                                           }, icon:  Icon(
                                                             FontAwesomeIcons.instagram,
                                                             color: Colors.brown.shade900,
                                                             size:35,
                                                             shadows: [
                                                               Shadow(blurRadius: 1, color:Colors.brown.shade200,offset: Offset(5,5))
                                                             ],
                                                             )),
                                                           IconButton(onPressed: (){
                                                             setState((){
                                                               isVisible = !isVisible;
                                                             });
                                                           }, icon: Icon(
                                                             Icons.mail_outline_sharp, 
                                                             color: Colors.red,
                                                             size:35,
                                                             shadows: [
                                                               Shadow(blurRadius: 1, color:Colors.brown.shade200,offset: Offset(5,5))
                                                             ],
                                                             )),
                                                            IconButton(onPressed: (){
                                                             setState((){
                                                               isVisible = !isVisible;
                                                             });
                                                           }, icon: Icon(
                                                             FontAwesomeIcons.linkedin,
                                                             color: Colors.blue.shade900,
                                                             size:35,
                                                             shadows: [
                                                                Shadow(blurRadius: 1, color:Colors.brown.shade200,offset: Offset(5,5))
                                                             ],
                                                             )),
                                                           
                                                         ],
                                                     ),
                                                      ),
                                                   ),
                                                 ),

                                                 

                                               ],
                                             ),
                                           ),
                                           const SizedBox(height:35),
                                           Text(
                                             textAlign:TextAlign.center,
                                             data.docs[index]['offer'].toString()+'% offer on selected items click below to get the offer'),
                                           
                                           const SizedBox(height:45),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Container(
                                                 color: Colors.grey,
                                                 height: MediaQuery.of(context).size.height*0.05,
                                                 width: MediaQuery.of(context).size.width*0.60,
                                                 child: Center(child: Text(data.docs[index]['offerCode'])),
                                               ),
                                               MaterialButton(
                                                 color: Colors.grey,
                                                 onPressed: (){},
                                                 child: const Text('Copy Code'),)
                                             ],
                                           ),
                                           const SizedBox(height:35),

                                           const Center(child: Text(
                                             'Visit the store',
                                             style: TextStyle(
                                               fontSize: 18,
                                               fontWeight: FontWeight.bold,
                                               decoration: TextDecoration.underline),),),

                                           SizedBox(height:20),


                                           
                                           
                                         ],
                                       ),);
                                       });

                                     
                                     

                                   });
                                 },
                                 color: Colors.blueGrey,
                                 child: const Text('Get Code'),
                                 ),
                             ],),
                             SizedBox(width:5)

                             
                           ]),
                       ),
                     ),
                   );
 
                  }
                  
                  return Container(
                    color: Colors.blue,
                  );          
                  }
                ),
            );

          },) ,);

        
        

        
      }
    );
  }

}

class _ShowCode extends StatefulWidget{
  const _ShowCode({Key? key, required this.getcode}) : super(key: key);
  final String getcode;

  @override
  State<_ShowCode> createState() => _ShowCodeState();
}

class _ShowCodeState extends State<_ShowCode> {
  @override
  Widget build(BuildContext context){
    return Container(
      child: Text(widget.getcode),
    );
  }
}