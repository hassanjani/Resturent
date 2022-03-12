import 'package:flutter/material.dart';
import 'package:user_app/data/datasource/remote/dio/dio_client.dart';
import 'package:user_app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:user_app/data/model/response/base/api_response.dart';
import 'package:user_app/utill/app_constants.dart';

class OrderRepo {
  final DioClient dioClient;

  OrderRepo({@required this.dioClient});

  Future<ApiResponse> getOrderList() async {
    try {
      final response = await dioClient.get(AppConstants.ORDER_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOrderDetails(String orderID) async {
    try {
      final response =
          await dioClient.get(AppConstants.ORDER_DETAILS_URI + orderID);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getShippingList() async {
    try {
      final response = await dioClient.get(AppConstants.SHIPPING_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> placeOrder(Map<String, dynamic> orderData) async {
    try {
      print(orderData);
      final response =
          await dioClient.post(AppConstants.ORDER_PLACE_URI, data: orderData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTrackingInfo(String orderID) async {
    try {
      final response = await dioClient.get(AppConstants.TRACKING_URI + orderID);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
