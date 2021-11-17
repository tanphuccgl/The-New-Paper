class Response {

  List<Data>? data;

  Response({this.data});

  Response.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Data {

  String? title;
  String? localStamp;
  String? description;
  String? image;
  String? linkAeticle;


  Data(
      {
        this.title,
        this.localStamp,
        this.description,
        this.image,
        this.linkAeticle,
       });

  Data.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    localStamp = json['localStamp'];
    description = json['description'];
    image = json['image'];
    linkAeticle = json['linkAeticle'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['localStamp'] = this.localStamp;
    data['description'] = this.description;
    data['image'] = this.image;
    data['linkAeticle'] = this.linkAeticle;

    return data;
  }
}
