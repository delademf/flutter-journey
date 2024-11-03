import 'package:flutter/material.dart';

class BurgerSpot extends StatefulWidget {
  const BurgerSpot({super.key});

  @override
  State<BurgerSpot> createState() => _BurgerSpotState();
}

class _BurgerSpotState extends State<BurgerSpot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [Image.asset('assets/images/main_all.jpg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF31B2ED)              )
                  ,child: IconButton(onPressed:(){
                    Navigator.pushNamed(context, "/Mainscreen");
                  }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,) )),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                // color: Color(0xFF31B2ED)

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.checklist)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 78,
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 80, 171, 244),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                            child: Text("Popular",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        Icon(Icons.location_on_rounded,color: Color(0xFF31B2ED),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Chicken Burger",style: TextStyle(fontSize: 28),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Promo Pack",style: TextStyle(fontSize: 28),),
                      ],
                    ),
                    Text("""
Cluckin’ Good Deal! 🍔🐔
Get ready for the ultimate chicken burger experience! Dive into juicy, crispy, and oh-so-flavorful bites with our *Chicken Burger Promo Pack*. Perfect for those times when one burger just isn’t enough!

What’s Inside:
- 2 Premium Chicken Burgers - Each crafted with a tender, seasoned chicken fillet, fresh lettuce, ripe tomatoes, and our signature creamy sauce on a toasted bun.
- Golden Fries - Crispy on the outside, fluffy on the inside – the ideal sidekick!
- Refreshing Drink - Choose from a selection of refreshing beverages to complete your meal!

This pack is perfect for sharing or enjoying solo – because two burgers are always better than one! Don’t miss out on this unbeatable deal – *limited time only*!

Grab your Chicken Burger Promo Pack today!
                    """)
                  ],
                ),
              ),
            ),
            ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor: Color(0xFF31B2ED),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 90, vertical: 10),
                                child: //isLoading
                                    // ? CircularProgressIndicator(
                                    //     backgroundColor: Color(0xFF31B2ED),
                                    //   ):
                                    Text(
                                        'Add To Cart',
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                              ),
                            ),
                            SizedBox(height: 10,)
            
            
            
          ],
        ),
      ),

    );
  }
}