import 'package:flutter/material.dart';

class PizzaSpot extends StatefulWidget {
  const PizzaSpot({super.key});

  @override
  State<PizzaSpot> createState() => _PizzaSpotState();
}

class _PizzaSpotState extends State<PizzaSpot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [Image.asset('assets/images/pizza_spot.jpg'),
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
                        Text("Beef Pizza",style: TextStyle(fontSize: 28),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Promo Pack",style: TextStyle(fontSize: 28),),
                      ],
                    ),
                    Text("""
Pizza Lovers’ Paradise! 🍕🔥

Prepare yourself for a pizza feast like no other with our *Pizza Promo Pack*! Loaded with all the cheesy, saucy goodness you crave, this pack is a true slice of heaven for all pizza fans out there!

What’s Inside:
- 2 Large Signature Pizzas - Choose from a variety of our best-selling flavors, each topped with a perfect blend of cheeses, fresh veggies, and premium meats on our signature crispy crust.
- Garlic Breadsticks - Warm, soft, and loaded with garlic butter goodness – the ideal complement to every slice.
- Refreshing Drink - Pick from our range of beverages to cool down as you enjoy every delicious bite!

Perfect for a group hangout or a solo pizza night – because with two pizzas, there’s plenty to share (or not)! Don’t miss this fantastic deal – *available for a limited time only*!

Order your Pizza Promo Pack now and treat yourself to a pizza paradise!
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