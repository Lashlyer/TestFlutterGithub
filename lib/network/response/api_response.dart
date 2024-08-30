

import 'package:shopping_list/network/response/apistatus.dart';

class ApiResponse<T> {
  //! Data members with T as generics
  ApiStatus? status;
  String? message;
  T? data;

// ! Contructor
  ApiResponse(this.status, this.message, this.data);

// ! Named Constructors with initializer list
  ApiResponse.loading() : status = ApiStatus.loading;
  ApiResponse.completed(this.data) : status = ApiStatus.completed;
  ApiResponse.error(this.message) : status = ApiStatus.error;

  @override
  String toString() {
    return "status : $status\n message : $message\n data : $data ";
  }
}