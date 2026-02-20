import 'package:dio/dio.dart';

String getErrorMessage(dynamic error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection timed out. Please check your internet and try again.";

      case DioExceptionType.connectionError:
        return "Couldn't connect to the server. Please check your internet connection.";

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 404) {
          return "The requested data was not found.";
        } else if (statusCode == 500) {
          return "Server error. Please try again later.";
        } else if (statusCode == 503) {
          return "Service temporarily unavailable. Please try again later.";
        }
        return "Something went wrong (Error $statusCode).";

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      case DioExceptionType.badCertificate:
        return "Secure connection failed. Please try again later.";

      case DioExceptionType.unknown:
        return "An unexpected error occurred. Please try again.";
    }
  }

  return "An unexpected error occurred. Please try again.";
}
