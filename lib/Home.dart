import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedisland/Cart.dart';
import 'package:seedisland/Details.dart';
import 'package:seedisland/FireBase.dart';
import 'package:seedisland/List.dart';
import 'package:seedisland/Myaccount.dart';

class Myhomepage extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  Myhomepage({super.key});
  late int buttonindex = -1;
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
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width < 600 ? 60 : 100,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('asset/seed.jpeg'))),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width < 600 ? 20 : 45,
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
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 40,
                width: MediaQuery.of(context).size.width * 0.9,
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
                height: 10,
              ),
              CarouselSlider(
                items: imgList
                    .map((item) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Image.asset(item,
                                  fit: BoxFit.fill, width: 1000)),
                        ))
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 600,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detailspage(),
                                ));
                          },
                          child: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.amber,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 165,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(images[index],
                                              scale: 5))),
                                ),
                                SizedBox(
                                  height: 150,
                                  width: 140,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          texts[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'courier',
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012,
                                        ),
                                        Text(
                                          notes[index],
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w200),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 30,
                                            width: 80,
                                            child: Center(
                                              child: Text(
                                                "Buy Now",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color.fromARGB(
                                                    255, 47, 45, 45)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.transparent),
                  accountName: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FirebaseAuth.instance.currentUser!.displayName ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.close)
                    ],
                  ),
                  otherAccountsPicturesSize: Size(20, 10),
                  accountEmail: Text(
                    FirebaseAuth.instance.currentUser!.email ?? "",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL ?? ""),
                  ),
                  currentAccountPictureSize: Size.square(40)),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: NetworkImage(
              //       'https://images.unsplash.com/photo-1553095066-5014bc7b7f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&w=1000&q=80',
              //     ),
              //   ),
              // ),
            ),
            ListTile(
              onTap: () {},
              // leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              // leading: Icon(Icons.settings),
              title: Text(
                "settings",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              onTap: () {
                firebasegoogleauth().signOut();
              },
              // leading: Icon(Icons.logout_rounded),
              title: Text(
                "Log out",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Myaccount(),
                ));
              },
              title: Text(
                "My Account",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
