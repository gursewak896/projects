import 'dart:convert';
import 'package:api_parsing_using_bloc/models/user_model.dart';
import 'package:http/http.dart';

//class that is reponsible to make api call request to server and retrieve data from it.
class UserRepository {
  String endpoint = 'https://reqres.in/api/users3?page=2';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
