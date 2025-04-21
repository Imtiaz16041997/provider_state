

class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }

}

class InternetException extends AppException {
  InternetException([String? message]) : super(message,'No Internet Connection');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message]) : super(message,'Request Time Out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message,'Internal Server error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message,'Internal Server Url');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message,'Error while Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message,'Invalid Request');
}


class UnAuthorisedException extends AppException {
  UnAuthorisedException([String? message]) : super(message,'UnAuthorised request');
}