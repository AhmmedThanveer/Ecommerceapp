import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:seedisland/provider.dart';

class addressPage extends StatelessWidget {
  const addressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Shipping address',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              SizedBox(height: 20.0),
              Consumer<QuantityModel>(
                builder: (context, countryProvider, _) => SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: DropdownButtonFormField<String>(
                    value: countryProvider.selectedCountry,
                    decoration: InputDecoration(
                      labelText: '  Country/Religion',
                      border: OutlineInputBorder(),
                    ),
                    items: countryProvider.countryList.map((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (value) {
                      countryProvider.setSelectedCountry(value!);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Fullname',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Lastname',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Address',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Appartment,suite,etc..',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'City',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'State',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Pincode',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Phone',
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color.fromARGB(255, 0, 3, 18), // Background color
                      ),
                      onPressed: () {},
                      child: Text("Continue to shopping")),
                ),
              )
            ]),
          ),
        ));
  }
}
