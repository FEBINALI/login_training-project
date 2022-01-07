import 'package:flutter/material.dart';

class innerpage extends StatefulWidget {
  const innerpage({Key? key}) : super(key: key);

  @override
  _innerpageState createState() => _innerpageState();
}

class _innerpageState extends State<innerpage> {

  
  var dropdownvalue = 'SSLC';
  var items =  ['SSLC', 'PLUS TWO', 'UNDER GRADUATION', 'POST GRADUATION'];
   
   final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('display form'),
        ),
        body: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 90,bottom: 90,left: 10,right:10),
              child: Card(
                elevation: 10,
                child: Column(
                  
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Text('ADD YOUR FIELDS'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: myController,
                          
                            decoration: InputDecoration( 
suffixIcon: IconButton(
 icon: Icon(Icons.send),
 onPressed: () => setState(() => items.add(myController.text),
 ),
 )
                            ),      
                        ),),
          

          
                             
                       
                     
       
                          
                        
                        
                      
                       SizedBox(height: 15,),


                      Text('EDUCATION STATUS'),

                       SizedBox(height: 10,),
                      DropdownButton<String>(
                        value: dropdownvalue,
                        isDense: false,
                       
                      
                        
                        onChanged: ( newvalue ){
                      setState(() {
                        dropdownvalue = newvalue!;
                      });
                                    },
                        items: items
                         
                        .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(), 
                      ),

                      
              SizedBox(width: 20,),
               IconButton(
 icon: Icon(Icons.remove),
 onPressed: () => setState(() => items.removeLast(),
 ),
 )  
              ]
              
              ),
                 ) ),
          ),
        ),
      ),
      
    
    );
  }
}
