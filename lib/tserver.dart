import 'package:http/http.dart' as http;

main()async{
  final response = await http.Client().post('http://localhost:5000/operators', body: {'owner' : 'SOmebidy'});
  print(response.body);
}
