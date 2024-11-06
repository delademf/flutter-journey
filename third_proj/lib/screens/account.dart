import 'package:flutter/material.dart';
import 'package:third_proj/screens/logIn_screen.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 40),
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
                          child: Text("     Account", style: TextStyle(color: Color(0xFF31B2ED),fontSize: 20),),
                        )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF31B2ED)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ecl Food Service Account',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700, color: Colors.white),),
                    )
                    
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed: (){
                Navigator.pushNamed(context, "/Profile");

                },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person_4_outlined,color: Color(0xFF31B2ED),),
                          Text(' Account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                          
                        ],
                      ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.shopping_cart_outlined,color: Color(0xFF31B2ED),),
                          Text(' Order',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                          
                        ],
                      ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed:(){
                  Navigator.pushNamed(context, "/ratings");
                },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.reviews_outlined,color: Color(0xFF31B2ED),),
                          Text(' Ratings and Reviews',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                          
                        ],
                      ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed: () {
                  Navigator.pushNamed(context, "/addressbook");
                },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.book,color: Color(0xFF31B2ED),),
                          Text(' Address Book',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                          
                        ],
                      ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed: () {
                   Navigator.pushNamed(context, '/payment');
                },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.payment_sharp,color: Color(0xFF31B2ED),),
                          Text(' Payment Method',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed: () {
                },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.settings,color: Color(0xFF31B2ED),),
                          Text(' Settings',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),),
                        ],
                      ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF31B2ED)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('  SETTINGS',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.white),),
                    )
                    
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/changepassword');
                },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(' Change Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                          
                        ],
                      ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 0.2))
                ),
                child: TextButton(onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
                },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.logout_outlined,color: Color(0xFF31B2ED),),
                          Text(' Logout',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                          
                        ],
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}