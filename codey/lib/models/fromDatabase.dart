import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FromDatabase extends StatefulWidget{
  const FromDatabase({Key? key}) : super(key: key);

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
          return const Text('Something Went Wrong');
        }
        if (snapshot.connectionState==ConnectionState.waiting){
          return const Text('Connection issue');
        }
        final data = snapshot.requireData;
        bool _islikebuttonClicked = false;
        
        return ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 400,),
                  child: ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index){
              return Padding(
              padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)
                    ),
                  child: Row(
                    children: [
                      const SizedBox(width:20),

                      Container(
                        height: 110,
                        width: 95,
                        child: Image.asset(data.docs[index]['logo']),),

                      const SizedBox(width:5),

                      Container(
                        width: 150,
                        color: Colors.grey,
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
                            Text('')
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
      contentPadding: const EdgeInsets.all(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: const Center(
        child: Text(
          'Get Code',
          style: TextStyle(color: Colors.brown),
          )),


      content: Container(
        height: MediaQuery.of(context).size.height*0.05,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height:20),
              Text(
                getcode,
                style: const TextStyle(color: Colors.brown),
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

