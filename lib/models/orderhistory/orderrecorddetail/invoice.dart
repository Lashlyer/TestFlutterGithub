import "package:shopping_list/models/orderhistory/orderrecorddetail/invoiceitem.dart";

class Invoice {
  int status;
  String statusName;
  int type;
  String typeName;
  int carrierType;
  String carrierTypeName;
  String? carrierNo;
  String? companyName;
  String? companyNo;
  String? donateName;
  String? donateNo;
  List<InvoiceItem> items;

  Invoice({
    required this.status,
    required this.statusName,
    required this.type,
    required this.typeName,
    required this.carrierType,
    required this.carrierTypeName,
    required this.carrierNo,
    required this.companyName,
    required this.companyNo,
    required this.donateName,
    required this.donateNo,
    required this.items,
  });

  String getInvoiceMethod() {
    switch (type) {
      case 1:
        return '$typeName\n$carrierTypeName$carrierNo';
      case 2:
        return '$typeName\n抬頭：$companyName\n統編：$companyNo';
      case 3:
        return '$typeName\n$donateName $donateNo';
      default:
        return '';
    }
  }

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        status: json["status"],
        statusName: json["status_name"],
        type: json["type"],
        typeName: json["type_name"],
        carrierType: json["carrier_type"],
        carrierTypeName: json["carrier_type_name"],
        carrierNo: json["carrier_no"],
        companyName: json["company_name"],
        companyNo: json["company_no"],
        donateName: json["donate_name"],
        donateNo: json["donate_no"],
        items: List<InvoiceItem>.from(
            json["items"].map((x) => InvoiceItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_name": statusName,
        "type": type,
        "type_name": typeName,
        "carrier_type": carrierType,
        "carrier_type_name": carrierTypeName,
        "carrier_no": carrierNo,
        "company_name": companyName,
        "company_no": companyNo,
        "donate_name": donateName,
        "donate_no": donateNo,
        "items": List<InvoiceItem>.from(items.map((x) => x.toJson())),
      };
}
