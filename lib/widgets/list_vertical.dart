import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket/widgets/list_horizontal.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildListVer({List? listData}) {
  int? temp = listData?.length.toInt();
  return Container(
      height: temp! * 110,
      width: 345,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: _item(
                urlWeb: listData?[index]["linkArticle"],
                urlImage: listData?[index]["image"] ?? image,
                text: listData?[index]["title"]),
          );
        },
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listData?.length,
        scrollDirection: Axis.vertical,
      ));
}

Widget _item({String? urlWeb, String? urlImage, String? text}) {
  return GestureDetector(
    onTap: () {
      launch(urlWeb!);
      print("${urlWeb}");
    },
    child: Container(
      height: 80,
      width: 345,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imageWidget(urlImage: urlImage),
          content(text: text),
        ],
      ),
    ),
  );
}

Widget title({String? text}) {
  return Container(
    width: 345 - 150,
    child: Text(
      text!,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          textBaseline: TextBaseline.ideographic),
      maxLines: 2,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget dateAndTime() {
  return Container(
      width: 345 - 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Novem.17,2021",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 10),
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              Icons.circle,
              color: Colors.grey,
              size: 5,
            ),
          ),
          Text(
            "1:01 AM",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 10),
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ));
}

Widget content({String? text}) {
  return Container(
    height: 80,
    width: 345 - 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title(text: text),
        dateAndTime(),
      ],
    ),
  );
}

Widget imageWidget({String? urlImage}) {
  return Container(
      height: 80,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(color: Colors.grey),
        image: DecorationImage(
            image: NetworkImage(
              urlImage!,
            ),
            fit: BoxFit.cover),
      ));
}
