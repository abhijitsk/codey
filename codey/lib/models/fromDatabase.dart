import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FromDatabase extends StatefulWidget{
  @override

  _FromDatabaseState createState()=>_FromDatabaseState();
}

class _FromDatabaseState extends State<FromDatabase>{

  List<String> docIds = [];
  final Stream<QuerySnapshot>  database = FirebaseFirestore.instance.collection('Database').snapshots();

  Future getName() async{
    await FirebaseFirestore.instance.collection('Database').get().then((snapshot) => snapshot.docs.forEach((element) { 
      docIds.add(element.reference.id);
    }));
  }
  
  @override



  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width*1,
      color: Colors.white,
      child: StreamBuilder<QuerySnapshot>(stream: database,builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        if  (snapshot.hasError){
          return Text('Something Went Wrong');
        }
        if (snapshot.connectionState==ConnectionState.waiting){
          return Text('Connection issue');
        }
        final data = snapshot.requireData;
        
        return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300,),
                  child: ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index){
              return Padding(
              padding: EdgeInsets.all(8.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)
                    ),
                  child: Row(
                    children: [
                      SizedBox(width:20),

                      Container(
                        height: 110,
                        width: 95,
                        child: Image.asset(data.docs[index]['logo']),),

                      SizedBox(width:25),

                      Container(
                        color: Colors.grey,
                        child: Column( 
                          children: [
                            Text(
                              data.docs[index]['Name'].toString(),
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                            ),
                            Text(
                            ''+data.docs[index]['offer']+ '% off',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                            ),
                            

                        ],),
                      ),

                      SizedBox(width:25),

                      Container(
                        child: MaterialButton(
                          color: Colors.blueGrey,
                          onPressed: (){
                            var code = data.docs[index]['offerCode'];
                            showDialog(context: context, builder: (BuildContext context)=> _ShowCode(getcode: code));
                          },
                          child: Text('Get Code'),
                          ),
                          
                          ),
                    ]),
                ),
              
              );
            }),
        );

      },) ,);
  }

}

class _ShowCode extends StatelessWidget{
  const _ShowCode({Key? key, required this.getcode}) : super(key: key);
  final String getcode;
  
  
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      elevation: 4,
      contentPadding: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
        child: Text(
          'Get Code',
          style: TextStyle(color: Colors.brown),
          )),


      content: Container(
        height: MediaQuery.of(context).size.height*0.05,
        child: Center(
          child: Column(
            children: [
              SizedBox(height:20),
              Text(
                getcode,
                style: TextStyle(color: Colors.brown),
                ),
              
            ],
          )),
      ),



      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('OK')),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel')),
      ],
    );
  }
  
}

class ShowCode extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      elevation: 4,
      contentPadding: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5) ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.power_settings_new_outlined,
          color: Colors.brown,)

        ]),
      content: Text('Do you want to LogOut ?',
          textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(onPressed: (){
          
        },
        child: Text('Yes'),),
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
        child: Text('No'),)
      ],
    );
  }
}