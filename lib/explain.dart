import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:seedisland/Cart.dart';
import 'package:seedisland/List.dart';
import 'package:seedisland/provider.dart';

class explainpage extends StatelessWidget {
  explainpage({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    final indexprovider = Provider.of<QuantityModel>(context);
    indexprovider.increment();
    indexprovider.decrement();
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
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.width < 600 ? 60 : 100,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/seed.jpeg'))),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.022,
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
                  ))
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    // mainAxisAlignment: MainAxisAlignment.start,
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
                        height: MediaQuery.of(context).size.height * 0.024,
                      ),
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(images[index]))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(texts[index]),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5),
                          IconButton(onPressed: () {
                            getdata.buttonclick(
                                texts[index],
                                notes[index],
                                nursarynames[index],
                                int.parse(price[index]),
                                images[index],
                                1);
                            final favoriteState = Provider.of<QuantityModel>(
                                context,
                                listen: false);
                            favoriteState.toggleFavorite();
                          }, icon: Consumer<QuantityModel>(
                            builder: (context, favoriteState, _) {
                              return Icon(
                                favoriteState.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favoriteState.isFavorite
                                    ? Colors.red
                                    : Colors.grey,
                              );
                            },
                          ))
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014,
                      ),
                      SizedBox(
                          height: 70,
                          width: 250,
                          child: Text(
                            notes[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 17),
                          )),
                      Row(
                        children: [
                          Text(
                            'By ',
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            nursarynames[index],
                            style: TextStyle(
                                color: Colors.red[900],
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      RatingBar.builder(
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 16,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 20,
                            width: 100,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                "Save Rs. 50.00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Text(
                            'RS. 499.00',
                            style: TextStyle(
                                color: Color.fromARGB(31, 149, 89, 24),
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rs ${price[index]}.00',
                            style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022,
                      ),
                      InkWell(
                        onTap: () {
                          getdata.buttonclick(
                              texts[index],
                              notes[index],
                              nursarynames[index],
                              int.parse(price[index]),
                              images[index],
                              1);
                          // print('object');
                          _showAlertDialog(context);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.amber)),
                          child: Center(
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      InkWell(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.amber,
                          child: Center(
                            child: Text(
                              "Buy  Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ]))));
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // title: Text('Message'),
        content: Text('Cart successfully added'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
