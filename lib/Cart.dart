import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:seedisland/addressPage.dart';

import 'package:seedisland/provider.dart';

import 'Hivemodel.dart';

class cartpage extends StatelessWidget {
  const cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final indexprovider = Provider.of<QuantityModel>(context);

    final getdata = Provider.of<HiveProvider>(context);
    getdata.getalldata();

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
                height: MediaQuery.of(context).size.width < 600 ? 60 : 100,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/seed.jpeg'))),
              ),
              SizedBox(width: 20),
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
                  ))
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      if (getdata.isEmpty) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Center(
                          child: Text(
                            'Cart is empty',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Divider(
                          height: 100,
                          color: Color.fromARGB(255, 30, 29, 29),
                          thickness: 1,
                          indent: 12,
                          endIndent: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            Text(
                              ' ${getdata.getTotalPrice()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 30),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Shipping & taxes calculated at checkout',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Calculate Shipping",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => addressPage(),
                                ));
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            color: Color.fromARGB(255, 247, 185, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart_checkout_sharp),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Continue Shopping",
                                    style: TextStyle(
                                        color: Color.fromRGBO(147, 0, 0, 1)),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Color.fromARGB(255, 83, 6, 0),
                                  )
                                ],
                              )),
                        )
                      ] else ...[
                        Container(
                            height: 280,
                            child: ValueListenableBuilder(
                              valueListenable: getdata.detailslist,
                              builder: (context, List<user> listuser, child) {
                                return ListView.builder(
                                    itemCount: listuser.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final data = listuser[index];
                                      return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 250,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius:
                                                      12.0, // soften the shadow
                                                  spreadRadius:
                                                      1.0, //extend the shadow
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              data.image))),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  height: 240,
                                                  width: 180,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              data.name,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            CircleAvatar(
                                                              radius: 17,
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          204,
                                                                          201,
                                                                          201),
                                                              child: Center(
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          getdata
                                                                              .remove(index);
                                                                        },
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              18,
                                                                        )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          data.notes,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text.rich(TextSpan(
                                                            text: 'Rs ',
                                                            children: <
                                                                InlineSpan>[
                                                              TextSpan(
                                                                text:
                                                                    "${data.price}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .red[
                                                                        900],
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ])),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          31,
                                                                          30,
                                                                          30),
                                                              child: IconButton(
                                                                  onPressed: Provider.of<
                                                                              QuantityModel>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .decrement,
                                                                  icon: Icon(Icons
                                                                      .remove)),
                                                            ),
                                                            SizedBox(
                                                              width: 12,
                                                            ),
                                                            Text(
                                                              '${indexprovider.quantity}',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              width: 12,
                                                            ),
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          31,
                                                                          30,
                                                                          30),
                                                              child: IconButton(
                                                                  onPressed: Provider.of<
                                                                              QuantityModel>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .increment,
                                                                  icon: Icon(
                                                                      Icons
                                                                          .add)),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ));
                                    });
                              },
                            )),
                        Divider(
                          height: 100,
                          color: Color.fromARGB(255, 30, 29, 29),
                          thickness: 1,
                          indent: 12,
                          endIndent: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            Text(
                              ' ${getdata.getTotalPrice()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 30),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Shipping & taxes calculated at checkout',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Calculate Shipping",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => addressPage(),
                                ));
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            color: Color.fromARGB(255, 247, 185, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart_checkout_sharp),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Continue Shopping",
                                    style: TextStyle(
                                        color: Color.fromRGBO(147, 0, 0, 1)),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Color.fromARGB(255, 83, 6, 0),
                                  )
                                ],
                              )),
                        )
                      ]
                    ]))));
  }
}
