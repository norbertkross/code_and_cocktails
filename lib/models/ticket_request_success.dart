class TicketSuccessResponse {
  String? sId;
  String? event;
  String? ticketType;
  String? couponCode;
  int? quantity;
  int? squadLimit;
  Customer? customer;
  Payment? payment;
  String? createdAt;
  String? updatedAt;
  String? qrCodeBase64;
  int? iV;

  TicketSuccessResponse(
      {this.sId,
      this.event,
      this.ticketType,
      this.couponCode,
      this.quantity,
      this.squadLimit,
      this.customer,
      this.payment,
      this.createdAt,
      this.updatedAt,
      this.iV,qrCodeBase64});

  TicketSuccessResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    event = json['event'];
    ticketType = json['ticketType'];
    couponCode = json['couponCode'];
    quantity = json['quantity'];
    squadLimit = json['squadLimit'];
    qrCodeBase64 = json['qrCodeBase64'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    payment =
        json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['event'] = this.event;
    data['ticketType'] = this.ticketType;
    data['couponCode'] = this.couponCode;
    data['quantity'] = this.quantity;
    data['squadLimit'] = this.squadLimit;
    data['qrCodeBase64'] = this.qrCodeBase64;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Customer {
  String? name;
  String? email;
  String? phone;

  Customer({this.name, this.email, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Payment {
  int? amount;
  String? method;
  String? currency;
  String? status;
  String? reference;

  Payment(
      {this.amount, this.method, this.currency, this.status, this.reference});

  Payment.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    method = json['method'];
    currency = json['currency'];
    status = json['status'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['method'] = this.method;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['reference'] = this.reference;
    return data;
  }
}
