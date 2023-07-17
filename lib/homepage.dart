import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ipix_mechine_test/detailspage.dart';
import 'package:ipix_mechine_test/loginpage.dart';
import 'package:ipix_mechine_test/restaurentMOdel.dart';
import 'package:ipix_mechine_test/widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class hompage extends StatefulWidget {
  const hompage({super.key});

  @override
  State<hompage> createState() => _hompageState();
}

class _hompageState extends State<hompage> {
 Future<RestaurantModel?> apiCall() async {
  try{
    var url = "https://run.mocky.io/v3/b91498e7-c7fd-48bc-b16a-5cb970a3af8a";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    var data=jsonDecode(response.body);
    var data1=
    RestaurantModel.fromJson(data);
    return data1;
  }catch(e){
    throw Exception("Error Occured$e");
  }
  }
  void logoutUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 245, 245),
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap:() =>logoutUser(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffFF8C23),
          toolbarHeight: 60,
          title: Text(
            "REATAURANTS",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          )),
      body: FutureBuilder(
          future: apiCall(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
return Center(child: Text(snapshot.hasError.toString()),);
            }else if(snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.restaurants!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => detailspage(data: snapshot.data!.restaurants![index]),
                              )),
                          child: hotelwidgets(data: snapshot.data!.restaurants![index],index: index,));
                    },
                  ),
                )
              ],
            );
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
}
