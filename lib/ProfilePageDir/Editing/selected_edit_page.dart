import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:vbuddyproject/Constants/sizes.dart';
import 'package:vbuddyproject/ProfilePageDir/Editing/edit_listing.dart';
import 'package:vbuddyproject/widget/back_btn_design.dart';


class SelectedEditPage extends StatefulWidget {
  final DocumentSnapshot item;

  const SelectedEditPage({required this.item});

  @override
  State<SelectedEditPage> createState() => _SelectedEditPageState();
}

class _SelectedEditPageState extends State<SelectedEditPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = widget.item['createdAt'];
    DateTime date = timestamp.toDate();

// Format the DateTime object as a string using the DateFormat class from the intl package
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);

    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: backiconButtonDesign(),
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Color.fromRGBO(255, 248, 238, 10),
          // height: myHeight,
          // width: myWidth,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: myHeight * 0.4,
                  // width: myWidth * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          spreadRadius: 3,
                          offset: Offset(0, 5)),
                    ],
                    image: DecorationImage(
                        image: NetworkImage(widget.item['imageUrl']),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              // Icon(
                              //   Icons.label,
                              //   size: myWidth * 0.050,
                              // ),
                              Text(
                                widget.item['title'],
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0.03,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.category,
                                size: myWidth * 0.050,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "Category",
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            widget.item['subcategory'] +
                                "(" +
                                widget.item['majorcategory'] +
                                ")",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0.02,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.description,
                                size: myWidth * 0.050,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            widget.item['description'],
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0.02,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: myWidth * 0.050,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "Uploaded By",
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            widget.item['creatorname'],
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0.02,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: myWidth * 0.050,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "Uploaded On",
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            formattedDate,
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0.02,
                        ),
                        Container(
                          child: Row(
                            children: [
                              LineIcon.indianRupeeSign(
                                size: myWidth * 0.050,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: widget.item['category'].toString() == "sell" ?Text(
                            "₹${widget.item['price']}",
                            style: TextStyle(fontSize: 19.0),
                          ) : Text(
                            "₹${widget.item['price']} /${widget.item['perhourvalue']}hrs",
                            style: TextStyle(fontSize: 19.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //EDIT
                  MaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditListing(item: widget.item,)));
                    },
                    minWidth: myWidth*0.4,
                    height: 50,
                    color: Colors.deepPurple[200],
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "EDIT",
                          style: TextStyle(

                              letterSpacing: textLetterSpacingValue,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  //DELETE
                  MaterialButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete Listing'),
                          content: Text('Are you sure you want to delete?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'No');
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteDocument(widget.item.id);
                                Navigator.pop(context, 'Yes');
                                Navigator.pop(context);
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    minWidth: myWidth*0.4,
                    height: 50,
                    color: Colors.red[400],
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete),
                        Text(
                          "DELETE",
                          style: TextStyle(
                              letterSpacing: textLetterSpacingValue,
                              fontWeight: buttonTextWeight,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void deleteDocument(documentId) {
    FirebaseFirestore.instance
        .collection('all_section')
        .doc(documentId)
        .delete()
        .then((value) => print("Document deleted"))
        .catchError((error) => print("Failed to delete document: $error"));
  }
}
