import 'package:flutter/material.dart';

class SandwichSpot extends StatefulWidget {
  const SandwichSpot({super.key});

  @override
  State<SandwichSpot> createState() => _SandwichSpotState();
}

class _SandwichSpotState extends State<SandwichSpot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [Image.asset('assets/images/sandwich_spot.jpg'),
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
                        Text("Chicken Sandwich",style: TextStyle(fontSize: 28),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Promo Pack",style: TextStyle(fontSize: 28),),
                      ],
                    ),
                    Text("""
Stacked Sandwich Deal! 🥪✨

Brace yourself for the ultimate sandwich experience with our *Stacked Sandwich Deal*! Packed with layers of fresh, flavorful ingredients, this deal is a must-try for sandwich lovers everywhere!

What’s Inside:
- 2 Gourmet Sandwiches - Choose from our selection of mouth-watering options, each crafted with artisan bread, fresh veggies, and premium meats and cheeses.
- Crispy Side Snack - Golden chips or a fresh side salad to pair perfectly with your sandwich.
- Refreshing Drink - Select from a range of beverages to complete your meal and keep you energized!

Perfect for lunch, dinner, or any time in between! Grab a friend or enjoy it solo – this deal won’t be around forever, so make it yours while it lasts!

Order your Stacked Sandwich Deal* today and dive into sandwich perfection!
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