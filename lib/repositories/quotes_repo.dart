import 'package:http/http.dart' as http;
import 'package:mindcare/const/api_Urls.dart';
import 'package:mindcare/models/quotes_model.dart';
class QuotesRepo {

  Future<List<QuotesModel>> getQuotes() async {
    var response = await http.get(Uri.parse(domain_url+'/api/quotes/'));
    if (response.statusCode == 200) {
      return QuotesModelFromJson(response.body);
    } else {
      throw Exception('Failed to load Quotes');
    }
  }
}