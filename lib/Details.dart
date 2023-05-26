import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:seedisland/Cart.dart';
import 'package:seedisland/Details.dart';
import 'package:seedisland/List.dart';
import 'package:seedisland/drawer.dart';

class detailspage extends StatelessWidget {
  detailspage({super.key});
  // final buttonindex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width < 600 ? 10 : 45,
            ),
            Container(
              width: MediaQuery.of(context).size.width < 600 ? 200 : 100,
              height: MediaQuery.of(context).size.width < 600 ? 60 : 100,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('asset/seed.jpeg'))),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width < 600 ? 10 : 45,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cartpage(),
                      ));
                },
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Indoor Plants',
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.amber,
                height: 40,
                width: 311,
                child: Container(
                  height: 40,
                  width: 310,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(4)),
                            child: Icon(Icons.search)),
                        border: OutlineInputBorder(),
                        hintText: 'What are you looking for ?',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 20),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromARGB(0, 12, 3, 3)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                          )
                        ],
                      ),
                      child: SizedBox(
                        height: 40,
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(images[index]))),
                            ),
                            Text(
                              notes[index],
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 90,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text.rich(TextSpan(
                                    text: 'Rs. ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: price[index],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                    ])),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
