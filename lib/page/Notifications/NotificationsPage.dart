import 'package:flutter/material.dart';
import 'package:trucksadriver/Widget/bodys.dart';
import 'package:trucksadriver/halp/BoxDecoration.dart';
import 'package:trucksadriver/halp/TextStyle.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Bodys(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height / 10,
                    child: Row(
                      children: [
                        Container(
                          height: height / 10,
                          width: height / 10,
                          decoration: inputBD.copyWith(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtouHyQs-o0vAd48QnW1OYJMdhxDXOpU0Yvg&usqp=CAU"))),
                        ),
                        Container(
                            width: width / 1.35,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "data",
                                style: Text1,
                              ),
                            ))
                      ],
                    ),
                  ),
                )));
  }
}
