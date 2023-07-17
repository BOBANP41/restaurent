import 'package:flutter/material.dart';
import 'package:ipix_mechine_test/detailswidget.dart';
import 'package:ipix_mechine_test/restaurentMOdel.dart';

class detailspage extends StatefulWidget {
  const detailspage({Key? key,required this.data});

  final Restaurant data;

  @override
  State<detailspage> createState() => _detailspageState();
}

class _detailspageState extends State<detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 230,child: Image.network(widget.data.photograph.toString(),fit: BoxFit.fill,),

          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Row(
              children: [
                Text(
                  widget.data.name.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 45,
                  height: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(widget.data.reviews![0].rating.toString(), style: TextStyle(color: Colors.white)),
                      ),
                      Icon(Icons.star, size: 15, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              widget.data.neighborhood.toString() ,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  maxRadius: 10,
                  child: Center(
                    child: Icon(Icons.clear, size: 20, color: Colors.white),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  widget.data.cuisineType.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 15, top: 8),
            child: Row(
              children: [
                Icon(Icons.location_pin, color: Colors.black12),
                SizedBox(width: 2),
                Text(widget.data.address.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 15, top: 8),
            child: Row(
              children: [
                Icon(Icons.access_time_filled, color: Colors.black12),
                SizedBox(width: 2),
                Text(widget.data.operatingHours!.tuesday.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Text(
              "Rating & Reviews",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),


Expanded(child: Padding(
  padding: const EdgeInsets.only(left: 9,right: 9),
  child:   ListView.separated(itemBuilder: (context, index) {
  
    return detailwidget(data: widget.data.reviews![index],);
  
  }, separatorBuilder: (context, index) => Divider(), itemCount: widget.data.reviews!.length),
))





        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFF8C23),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        
        onPressed: () {
          
        },
       child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_outlined,color: Colors.white,),
          Text("GO",style: TextStyle(color: Colors.white),)
        ],
       ),
    
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
