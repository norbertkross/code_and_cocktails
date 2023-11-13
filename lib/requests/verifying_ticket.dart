import 'package:code_and_cocktails/models/ticket_request_error.dart';
import 'package:code_and_cocktails/models/ticket_request_success.dart';
import 'package:code_and_cocktails/requests/urls.dart';
import 'package:dio/dio.dart';

import '../models/err_success_model.dart';

class VerifyingTicketSingleton {
  final dio = Dio();

  // Private constructor
  VerifyingTicketSingleton._();

  // Singleton instance
  static final VerifyingTicketSingleton _instance =
      VerifyingTicketSingleton._();

  // Variable and setter
  String _myVariable = '';

  set myVariable(String value) {
    _myVariable = value;
  }

  // Getter
  String get myVariable {
    return _myVariable;
  }

  // Factory constructor to access the singleton instance
  factory VerifyingTicketSingleton() {
    return _instance;
  }

  Future<ErrSuccResponse?> verifyMyTicket({String ticketID = ""}) async {
    print("ID: ${ticketID.split("/").last}");
    ticketID = ticketID.split("/").last;
    Response response = await dio.get(
        // 'https://be-cnc-production.up.railway.app/api/ticket/check-in/$ticketID'
       Urls.VerifyMyTicket + '$ticketID'
        );
    print(response.realUri);
    print(response.data.toString());
    print(
        "Status code: ${response.statusCode} data null: ${response.data == null} ");

    if (response.data == null || response.data.toString().isEmpty) {
      return null;
    }

    if (response.statusCode == 200) {
      return ErrSuccResponse(
          success: TicketSuccessResponse.fromJson(response.data), error: null);
    } else {
      return ErrSuccResponse(
        success: null,
        error: TicketErrorResponse.fromJson(response.data),
      );
    }
  }

  Future<List<TicketSuccessResponse>?> getAllTickets() async {
    Response response = await dio.get(
        // 'https://be-cnc-production.up.railway.app/api/ticket/check-in/$ticketID'
         Urls.GetAllTickets);
    print(response.realUri);
    print(response.data.toString());
    print(
        "Status code: ${response.statusCode} data null: ${response.data == null} ");

    if (response.data == null || response.data.toString().isEmpty) {
      return null;
    }

    if (response.statusCode == 200) {
      List data = response.data;

      List<TicketSuccessResponse> allItems = data.map((element) => TicketSuccessResponse.fromJson(element)).toList();

      return allItems;
      
    } else {
      return null;
    }
  }
}

// void main() {
//   // Access the singleton instance
//   VerifyingTicketSingleton singleton = VerifyingTicketSingleton();

//   // Set and get the variable
//   singleton.myVariable = 'Hello, Singleton!';
//   print(singleton.myVariable); // Output: Hello, Singleton!
// }

