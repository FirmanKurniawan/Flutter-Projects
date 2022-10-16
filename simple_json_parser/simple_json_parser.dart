import 'dart:convert';

///[getPeople] get people data from json
Future<List<Data>> getPeople() async {
  //Should be changed with http request, currently use local json map
  var response = jsonEncode(json);
  PeopleModel peopleModel = PeopleModel.fromJson(jsonDecode(response));
  return peopleModel.data;
}

void main() async {
  final data = await getPeople();
  print(data);

  ///result
  ///{id: 1 name: Locke address: NY st},
  ///{id: 2 name: James address: NY st},
  ///{id: 3 name: Jane address: NY st}]
}

class PeopleModel {
  final String message;
  final List<Data> data;
  PeopleModel({required this.data, required this.message});

  //create factory class to convert json to dart object
  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        message: json['message'],
        data: List<Data>.from(
          json['data'].map<Data>(
            (e) => Data(
              id: e['id'],
              name: e['name'],
              address: e['address'],
            ),
          ),
        ),
      );
  @override
  String toString() => 'message : $message  Data length : ${data.length}';
}

class Data {
  final int id;
  final String name;
  final String address;
  Data({required this.id, required this.name, required this.address});
  @override
  String toString() => '{id: $id name: $name address: $address}';
}

Map json = {
  "message": "OK",
  "data": [
    {"id": 1, "name": "Locke", "address": "NY st"},
    {"id": 2, "name": "James", "address": "NY st"},
    {"id": 3, "name": "Jane", "address": "NY st"}
  ]
};
