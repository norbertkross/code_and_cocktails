import 'ticket_request_error.dart';
import 'ticket_request_success.dart';

class ErrSuccResponse {
  TicketSuccessResponse? success;
  TicketErrorResponse? error;

  ErrSuccResponse({this.success, this.error});

  // ErrSuccResponse.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   error = json['message'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data['success'] = success;
  //   data['message'] = error;
  //   return data;
  // }
}
