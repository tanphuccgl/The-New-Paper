import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket/models/res.dart';
import 'package:socket/widgets/list_horizontal.dart';
import 'package:socket/widgets/list_vertical.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  static const String routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? listData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  void connect() {
    IO.Socket socket = IO.io('http://api.itcode.vn:3005', <String, dynamic>{
      "transports": ["websocket"],        ///default
      "autoConnect": true
    });
    socket.connect();     ///kết nối với server
/// lấy dữ liệu
    socket.on("getData", (data) {
      if (data != null) {
        listData = data;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int? temp= listData?.length.toInt();

    return listData?.isNotEmpty != false
        ? Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 15),
                child: Container(
                  height: size.height + temp! *50,
                  width: size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            title(),
                            search(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            content(title: "US Politics"),
                            showALl(),
                          ],
                        ),
                      ),
                      Row(
                        children: [buildList(listData: listData)],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            content(title: "Middle East"),
                            showALl(),
                          ],
                        ),
                      ),
                      buildListVer(listData: listData)
                    ],
                  ),
                ),
              ),
            ))
        :  const Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ));
  }

  Widget showALl() {
    return Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            "Show all",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ));
  }

  Widget content({String? title}) {
    return Text(
      "$title",
      style: GoogleFonts.alikeAngular(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );
  }

  Widget title() {
    return Text(
      "The New Work Time",
      style: GoogleFonts.alikeAngular(
          color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );
  }

  Widget search() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: IconButton(
        icon: Icon(
          Icons.search,
        ),
        onPressed: () {
          getData();
        },
        color: Colors.black,
      ),
    );
  }

  void getData() {}
}
