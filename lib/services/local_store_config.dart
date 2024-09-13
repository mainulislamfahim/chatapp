import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathprovider;


class HiveService {
  static var box;

  static initHive() async {
    var dir = await pathprovider.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('appData');
  }

  static setToken(String token){
    box.put('token', token);
  }
  static Future<String?> getToken() async{
   return await box.get('token');
  }


  static setLanguage(String language) {
    box.put('language', language);
  }

  static getLanguage() {
    return box.get('language', defaultValue: 'en_en');
  }

}
