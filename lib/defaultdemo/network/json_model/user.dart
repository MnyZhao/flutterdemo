import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
      };
}

void main() {
  String jsonList = '[{"name":"Jack","email":"sdf"},{"name":"John"}]';
  List<dynamic> user = json.decode(jsonList);
  user.forEach((f) => print(f['name']));

}

