
class Present {
    String name;
    int orderType;
    int productId;
    String productNo;
    int skuId;
    String skuNo;
    String skuVendor;
    String standard;
    String image;
    int price;
    int salePrice;
    int taxType;
    int quantity;
    int subtotal;
    int stock;
    int promotionId;
    String promotionName;
    bool valid;

    Present({
        required this.name,
        required this.orderType,
        required this.productId,
        required this.productNo,
        required this.skuId,
        required this.skuNo,
        required this.skuVendor,
        required this.standard,
        required this.image,
        required this.price,
        required this.salePrice,
        required this.taxType,
        required this.quantity,
        required this.subtotal,
        required this.stock,
        required this.promotionId,
        required this.promotionName,
        required this.valid,
    });

    factory Present.fromJson(Map<String, dynamic> json) => Present(
        name: json["name"],
        orderType: json["order_type"],
        productId: json["product_id"],
        productNo: json["product_no"],
        skuId: json["sku_id"],
        skuNo: json["sku_no"],
        skuVendor: json["sku_vendor"],
        standard: json["standard"],
        image: json["image"],
        price: json["price"],
        salePrice: json["sale_price"],
        taxType: json["tax_type"],
        quantity: json["quantity"],
        subtotal: json["subtotal"],
        stock: json["stock"],
        promotionId: json["promotion_id"],
        promotionName: json["promotion_name"],
        valid: json["valid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "order_type": orderType,
        "product_id": productId,
        "product_no": productNo,
        "sku_id": skuId,
        "sku_no": skuNo,
        "sku_vendor": skuVendor,
        "standard": standard,
        "image": image,
        "price": price,
        "sale_price": salePrice,
        "tax_type": taxType,
        "quantity": quantity,
        "subtotal": subtotal,
        "stock": stock,
        "promotion_id": promotionId,
        "promotion_name": promotionName,
        "valid": valid,
    };
}