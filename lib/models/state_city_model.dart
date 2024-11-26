import 'dart:convert';

Statelist statelistFromJson(String str) => Statelist.fromJson(json.decode(str));

String statelistToJson(Statelist data) => json.encode(data.toJson());

class Statelist {
  final List<StateModel> stateList;
  final String error;
  final String statuscode;
  final String total;

  Statelist({
    required this.stateList,
    required this.error,
    required this.statuscode,
    required this.total,
  });

  factory Statelist.fromJson(Map<String, dynamic> json) => Statelist(
        stateList: List<StateModel>.from(
            (json["noticlist"] ?? []).map((x) => StateModel.fromJson(x))),
        error: json["error"],
        statuscode: json["statuscode"],
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "noticlist": List<dynamic>.from(stateList.map((x) => x.toJson())),
        "error": error,
        "statuscode": statuscode,
        "Total": total,
      };
}

class StateModel {
  final String id;
  final String name;
  final dynamic subId;

  StateModel({
    required this.id,
    required this.name,
    required this.subId,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["ID"],
        name: json["Name"],
        subId: json["SubID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "SubID": subId,
      };
}
