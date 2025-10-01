
class Payment {
    int status;
    String statusName;
    int method;
    String expiredAt;
    String methodName;
    String? info;

    Payment({
        required this.status,
        required this.statusName,
        required this.method,
        required this.expiredAt,
        required this.methodName,
        required this.info,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        status: json["status"],
        statusName: json["status_name"],
        method: json["method"],
        expiredAt: json["expired_at"],
        methodName: json["method_name"],
        info: json["info"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_name": statusName,
        "method": method,
        "expired_at": expiredAt,
        "method_name": methodName,
        "info": info,
    };
}