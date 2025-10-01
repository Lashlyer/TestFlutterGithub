
class OrderListItem {
    int id;
    String no;
    String tip;
    int tipType;
    String date;
    String expiredAt;
    int amount;
    String summary;
    int button;
    String type;
    String category;
    int paymentMethod;
    int paymentStatus;
    int shippingStatus;
    String shippingStatusName;
    int orderStatus;
    String orderStatusName;
    int invoiceStatus;
    String invoiceStatusName;
    String shippingMethods;

    OrderListItem({
        required this.id,
        required this.no,
        required this.tip,
        required this.tipType,
        required this.date,
        required this.expiredAt,
        required this.amount,
        required this.summary,
        required this.button,
        required this.type,
        required this.category,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.shippingStatus,
        required this.shippingStatusName,
        required this.orderStatus,
        required this.orderStatusName,
        required this.invoiceStatus,
        required this.invoiceStatusName,
        required this.shippingMethods,
    });

    factory OrderListItem.fromJson(Map<String, dynamic> json) => OrderListItem(
        id: json["id"],
        no: json["no"],
        tip: json["tip"] ?? '',
        tipType: json["tip_type"],
        date: json["date"],
        expiredAt: json["expired_at"],
        amount: json["amount"],
        summary: json["summary"],
        button: json["button"],
        type: json["type"],
        category: json["category"],
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        shippingStatus: json["shipping_status"],
        shippingStatusName: json["shipping_status_name"],
        orderStatus: json["order_status"],
        orderStatusName: json["order_status_name"],
        invoiceStatus: json["invoice_status"],
        invoiceStatusName: json["invoice_status_name"],
        shippingMethods: json["shipping_methods"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "tip": tip,
        "tip_type": tipType,
        "date": date,
        "expired_at": expiredAt,
        "amount": amount,
        "summary": summary,
        "button": button,
        "type": type,
        "category": category,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "shipping_status": shippingStatus,
        "shipping_status_name": shippingStatusName,
        "order_status": orderStatus,
        "order_status_name": orderStatusName,
        "invoice_status": invoiceStatus,
        "invoice_status_name": invoiceStatusName,
        "shipping_methods": shippingMethods,
    };
}