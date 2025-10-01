
import 'package:flutter/material.dart';
import 'package:shopping_list/network/response/api_response.dart';

abstract class BaseViewModel {

  final BuildContext? context;

  final ApiResponse? response;

  BaseViewModel(this.response, {required this.context});

  setResponse(ApiResponse response);
}