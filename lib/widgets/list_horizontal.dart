import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String image =
    "https://spiderimg.amarujala.com/assets/images/2017/04/15/750x506/tech-news_1492263376.jpeg";
String text =
    "Lại một người trở về từ mây khi chuyện tình ta đã chấm hết liệu sẽ có Cơ hội nào cho ";

Widget buildList({List? listData}) {
  return Container(
      height: 240,
      width: 345,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: _item(
                urlWeb: listData?[index]["linkArticle"],
                urlImage: listData?[index]["image"] ?? image,
                title1: listData?[index]["title"]),
          );
        },
        itemCount: listData?.length,
        scrollDirection: Axis.horizontal,
      ));
}

Widget _item({String? title1, String? urlImage, String? urlWeb}) {
  return GestureDetector(
    onTap: () {
      launch(urlWeb!);
      print("${urlWeb}");
    },
    child: Container(
      width: 230,
      height: 230,
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
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: iconBookmark(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: title(title: title1),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
            ),
            child: Row(
              children: [
                avatar(),
                SizedBox(
                  width: 15,
                ),
                name(),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget iconBookmark() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: IconButton(
      icon: Icon(
        Icons.bookmark,
        color: Colors.white,
        size: 25,
      ),
      onPressed: () {},
    ),
  );
}

Widget title({String? title}) {
  return Padding(
    padding: EdgeInsets.only(left: 15, top: 50),
    child: Container(
      height: 50,
      width: 180,
      child: Text(
        title!,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(
            fontWeight: FontWeight.w700, color: Colors.white, fontSize: 15),
      ),
    ),
  );
}

Widget avatar() {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover),
    ),
  );
}

Widget name() {
  return Text(
    "Billie Eilish",
    style: TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
  );
}
