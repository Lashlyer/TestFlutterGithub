

class InvoiceItem {
    int id;
    String no;
    String orderNo;
    String orderName;
    String random;
    int amount;
    String date;
    String summary;
    String? extrals;

    InvoiceItem({
        required this.id,
        required this.no,
        required this.orderNo,
        required this.orderName,
        required this.random,
        required this.amount,
        required this.date,
        required this.summary,
        required this.extrals,
    });

    factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
        id: json["id"],
        no: json["no"],
        orderNo: json["order_no"],
        orderName: json["order_name"],
        random: json["random"],
        amount: json["amount"],
        date: json["date"],
        summary: json["summary"],
        extrals: json["extrals"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "order_no": orderNo,
        "order_name": orderName,
        "random": random,
        "amount": amount,
        "date": date,
        "summary": summary,
        "extrals": extrals,
    };
}