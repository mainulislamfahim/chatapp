class ApiEndpoint {
  ///  Base URL
  static const String domailUrl = 'http://192.168.198.83:3000'; //  192.168.198.83
  static const String baseUrl = '$domailUrl/api/users';

  ///  Auth
  static const String register = '$baseUrl/register'; // post
  static const String login = '$baseUrl/signin'; // post

}
