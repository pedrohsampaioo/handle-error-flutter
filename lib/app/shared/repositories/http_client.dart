import 'dart:io';

class FakeHttpClient {
  Future<String> fetch() async {
    await Future.delayed(Duration(milliseconds: 500));  
    //throw SocketException("No Internet!");
    //throw HttpException("404");
    //return "abs";
    //throw FileSystemException();
    return '{"name":"Pedro","id": 1}';
  }
}
