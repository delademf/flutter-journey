import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF31B2ED),
                  
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            );
          },
        ),
        automaticallyImplyLeading: true,
        title: Column(
          children: [
           
          ],
        ),
        
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF31B2ED),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Order');
                },
              ),
            ),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            
            
              Positioned(
                top: 30,
                left: 30,
                right: 30,

                child: Container(
                  height: 500,
                  padding:EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow( color: Colors.grey,blurRadius: 5),],
                    borderRadius: BorderRadius.circular(20)
                                
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),
                      Lottie.asset("assets/images/no_order_yet.json",width: 200,height: 200),
                      SizedBox(height:10),
                      Text('NO ORDER FOUND',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,),),
                      Text("Looks like you haven't made your order yet",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal),)
                    ],
                  ),
                ),
              ), 

              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 300,
                              child: ElevatedButton(onPressed:(){},
                              child: const Text('START YOUR ORDER',style: TextStyle(fontFamily: 'Nunito',fontSize: 15,fontWeight:FontWeight.w900,color: Colors.white),),
                                  style: ElevatedButton.styleFrom(elevation: 10, backgroundColor: Color(0xFF31B2ED),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                                  )
                                  ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
        ),
      )
    );
  }
}