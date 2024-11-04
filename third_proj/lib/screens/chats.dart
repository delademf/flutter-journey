import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
               
      body: Padding(
        padding: const EdgeInsets.all(10),
        
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 1,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFF31B2ED)              )
                        ,child: IconButton(onPressed:(){
                          Navigator.pushNamed(context, "/Mainscreen");
                        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,) )),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Text("Search", style: TextStyle(color: Color(0xFF31B2ED),fontSize: 20),),
                        )
                  ],
                ),
              ),

          SizedBox(height: 15,),
           TextField(

                        decoration: InputDecoration(
                          
                            filled: true,
                            fillColor: Color(0xFF31B2ED),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF31B2ED), width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            hintText: "Search for a vendor or product",hintStyle: TextStyle(color: Colors.white))),
            
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.timelapse,color: Colors.grey,),
                  Text('No recent search',style: TextStyle(color: Colors.grey,fontSize: 12),)
                ],
              ),
            )
           
          ],
        ),
      ),);
  }
}