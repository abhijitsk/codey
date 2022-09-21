import 'package:codey/models/databasemodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';


class Fav extends StatefulWidget{
  Fav({Key? key, }) : super(key: key);

  
  @override
  

  FavState createState()=>FavState();
}

class FavState extends State<Fav>{

  List<String> docIds = [];
  final Stream<QuerySnapshot>  database = FirebaseFirestore.instance.collection('Database').snapshots();
  
  


  
 

  bool _islikebuttonClicked = false;
  @override



  Widget build(BuildContext context){
     
    return FutureBuilder(
      future: FirestoreData().getData(),
      builder: (context, AsyncSnapshot docs) {
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
                 // var search_data = snapshot.data!.docs[index].data()
                  //  as Map<String,dynamic>;
                  try{
                    for (var favids in docs.data['fav']){

                    if(data.docs[index].id==favids.toString()){

                      return Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.brown[300],
                          ),
                        child: Row(
                          children: [
                            const SizedBox(width:10),

                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(),
                              height: 90,
                              width: 80,
                              child: Image.asset(data.docs[index]['logo'],fit:BoxFit.fill),
                              ),

                            const SizedBox(width:5),

                            Container(
                              width: 150,
                              color: Colors.brown[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center, 
                                children: [
                                  Text(
                                    data.docs[index]['Name'].toString(),
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                                  ),
                                  Text(
                                  ''+data.docs[index]['offer']+ '% off'+' on selected merchandise'+'\n'+'Grab it before offer expires',
                                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                                  ),
                                  //Text(data.docs[index].id),
                                  //Text(checkdata().toString()),
                                  //favfromDatabase(),
                                  //Text(docs.data['fav'].toString())
                                  //FavfromDatabase(),
                                  
                              ],),
                            ),

                            const SizedBox(width:5),

                            

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              IconButton(
                                onPressed: (){
                                  
                                  setState(() {
                                    
                                    _islikebuttonClicked = !_islikebuttonClicked;
                                  });
                                   },
                                icon:  Icon(Icons.favorite,
                                  color: _islikebuttonClicked? Colors.blue:Colors.red,)),

                              const SizedBox(height: 30,),

                              MaterialButton(
                                onPressed: (){
                                  var code = data.docs[index]['offerCode'];
                                  showDialog(context: context, builder: (BuildContext context)=> _ShowCode(getcode: code));
                                },
                                color: Colors.blueGrey,
                                child: const Text('Get Code'),
                                ),
                            ],),

                            
                          ]),
                      ),
                    ),
                  
                  );
                    }//

                    
                  }

                  }catch(e){
                    return Container(
                      child: Text('SOmethinf'),
                    );

                  }
                
                  
                  return Container(child: Text(docs.data['DOB'].toString()),);


                  return Container();
                  //
                  
                   
 
                  }
                  
                       
                ),
            );

          },) ,);
      }
    );
  }

}

class _ShowCode extends StatelessWidget{
  const _ShowCode({Key? key, required this.getcode}) : super(key: key);
  final String getcode;
  
  
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.brown[200],
      elevation: 4,
      contentPadding: const EdgeInsets.all(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: const Center(
        child: Text(
          'Get Code',
          style: TextStyle(color: Colors.brown),
          )),


      content: Container(
                
        height: MediaQuery.of(context).size.height*0.1,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height:10),
              Text(
                getcode,
                style: const TextStyle(color: Colors.deepOrange,fontSize: 30),
                ),
              
            ],
          )),
      ),



      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text('OK')),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text('Cancel')),
      ],
    );
  }
  


}


class FavfromDatabase extends StatefulWidget{
  FavfromDatabase({Key? key}) : super(key: key);

  @override
  State<FavfromDatabase> createState() => FromDatabaseState();
}

class FromDatabaseState extends State<FavfromDatabase> {
  late Database db;
  List docs = [];

  void initState(){
    super.initState();
    initialise();
    
  }

  initialise(){
    db = Database();
    db.initialiase();
    db.readFav().then((value) => {
      setState((){
        docs =value;
      })
    });
  }

  @override

  Widget build(BuildContext context){
    return Container(
      child: Text(docs.toString()),
    );
  
}
}
