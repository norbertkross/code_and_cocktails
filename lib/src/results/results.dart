import 'package:code_and_cocktails/requests/verifying_ticket.dart';
import 'package:code_and_cocktails/src/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../models/err_success_model.dart';
import 'results_data.dart';

class ResultsPage extends StatefulWidget {
  final Barcode? result;

  const ResultsPage({super.key, required this.result});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  bool? verifyingTicket;
  ErrSuccResponse? results;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      VerifyingTicketSingleton verifyingTicketSingleton =
          VerifyingTicketSingleton();

      setState(() {
        verifyingTicket = true;
      });

      results = await verifyingTicketSingleton.verifyMyTicket(
          ticketID: widget.result?.code ?? '');


          if(results == null){

        setState(() {
          verifyingTicket = null;
        });
            return null;
          }

      if (results?.error == null) {
            print("RESP OK:");
        setState(() {
          verifyingTicket = false;
        });
      } else {
                    print("RESP ERR:");

        setState(() {
          verifyingTicket = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: (results?.success?.qrCodeBase64 ?? '').isNotEmpty ? Theme.of(context).primaryColor : Color(0xffEA1154),
        onPressed: () {
          Navigator.pop(context);
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (builder) => const HomePage()),
          //     (route) => false);
        },
        child: Icon(
          (results?.success?.qrCodeBase64 ?? '').isNotEmpty ? Icons.done : Icons.close,
          color: Theme.of(context).canvasColor,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).primaryColor,
            )),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        centerTitle: true,
        title: Text(
          "Ticket verification",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [

          verifyingTicket ==false?
          const SizedBox()
          :
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            // color: Colors.amber,
                            width: 120,
                            height: 120,
                            child:
                                SvgPicture.asset("assets/ticket-77dfce33.svg"),
                          ),
                        ),
                       verifyingTicket == true?
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ) : verifyingTicket ==false?
                        
                         const SizedBox()

                         : const SizedBox(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(top:18.0),
                            child: Text("Error verifying ticket",style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Click arrow to scan next ticket",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).disabledColor.withOpacity(.9),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

       verifyingTicket ==false?
        Column(
            children: [
              // const SizedBox(
              //   height: 30,
              // ),

             ResultsData(successResponse: results?.success,result: widget.result,),
            ],
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
