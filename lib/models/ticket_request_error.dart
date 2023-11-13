class TicketErrorResponse {
  bool? success;
  String? message;

  TicketErrorResponse({this.success, this.message});

  TicketErrorResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
