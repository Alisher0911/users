import 'package:dio/dio.dart';
import 'package:makit/data/models/user/user_model.dart';

class UserRepository { 

  final _apiClient = Dio();

  Future<List<User>> getUsers() async {
    final response = await _apiClient.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((x) => User.fromJson(x))
          .toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
}