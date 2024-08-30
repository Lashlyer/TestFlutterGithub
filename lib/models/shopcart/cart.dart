

class Cart {
    int type;
    int id;
    String name;
    int productId;
    String productNo;
    int orderType;
    String orderTypeKey;
    dynamic vendorNo;
    dynamic vendorName;
    int skuId;
    String skuNo;
    String skuVendor;
    String standard;
    int stock;
    int price;
    int salePrice;
    int taxType;
    bool smTake;
    int points;
    int limit;
    String image;
    int quantity;
    int quantityPresent;
    Status status;
    int subtotal;
    int subtotalOrigin;
    int count;
    int promotionDiscount;
    int couponDiscount;
    Offer offer;

    Cart({
        required this.type,
        required this.id,
        required this.name,
        required this.productId,
        required this.productNo,
        required this.orderType,
        required this.orderTypeKey,
        required this.vendorNo,
        required this.vendorName,
        required this.skuId,
        required this.skuNo,
        required this.skuVendor,
        required this.standard,
        required this.stock,
        required this.price,
        required this.salePrice,
        required this.taxType,
        required this.smTake,
        required this.points,
        required this.limit,
        required this.image,
        required this.quantity,
        required this.quantityPresent,
        required this.status,
        required this.subtotal,
        required this.subtotalOrigin,
        required this.count,
        required this.promotionDiscount,
        required this.couponDiscount,
        required this.offer,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        type: json["type"],
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        productNo: json["product_no"],
        orderType: json["order_type"],
        orderTypeKey: json["order_type_key"],
        vendorNo: json["vendor_no"],
        vendorName: json["vendor_name"],
        skuId: json["sku_id"],
        skuNo: json["sku_no"],
        skuVendor: json["sku_vendor"],
        standard: json["standard"],
        stock: json["stock"],
        price: json["price"],
        salePrice: json["sale_price"],
        taxType: json["tax_type"],
        smTake: json["sm_take"],
        points: json["points"],
        limit: json["limit"],
        image: json["image"],
        quantity: json["quantity"],
        quantityPresent: json["quantity_present"],
        status: Status.fromJson(json["status"]),
        subtotal: json["subtotal"],
        subtotalOrigin: json["subtotal_origin"],
        count: json["count"],
        promotionDiscount: json["promotion_discount"],
        couponDiscount: json["coupon_discount"],
        offer: Offer.fromJson(json["offer"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "name": name,
        "product_id": productId,
        "product_no": productNo,
        "order_type": orderType,
        "order_type_key": orderTypeKey,
        "vendor_no": vendorNo,
        "vendor_name": vendorName,
        "sku_id": skuId,
        "sku_no": skuNo,
        "sku_vendor": skuVendor,
        "standard": standard,
        "stock": stock,
        "price": price,
        "sale_price": salePrice,
        "tax_type": taxType,
        "sm_take": smTake,
        "points": points,
        "limit": limit,
        "image": image,
        "quantity": quantity,
        "quantity_present": quantityPresent,
        "status": status.toJson(),
        "subtotal": subtotal,
        "subtotal_origin": subtotalOrigin,
        "count": count,
        "promotion_discount": promotionDiscount,
        "coupon_discount": couponDiscount,
        "offer": offer.toJson(),
    };
}

class Offer {
    int type;

    Offer({
        required this.type,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
    };
}

class Status {
    int code;
    dynamic message;

    Status({
        required this.code,
        required this.message,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
    };
}