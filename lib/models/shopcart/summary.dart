

class ShopCartSummary {
    int totalCount;
    int totalOrigin;
    int totalAmount;
    int totalAdditionPoints;
    int totalPromotionDiscount;
    int totalCouponDiscount;

    ShopCartSummary({
        required this.totalCount,
        required this.totalOrigin,
        required this.totalAmount,
        required this.totalAdditionPoints,
        required this.totalPromotionDiscount,
        required this.totalCouponDiscount,
    });

    factory ShopCartSummary.fromJson(Map<String, dynamic> json) => ShopCartSummary(
        totalCount: json["total_count"],
        totalOrigin: json["total_origin"],
        totalAmount: json["total_amount"],
        totalAdditionPoints: json["total_addition_points"],
        totalPromotionDiscount: json["total_promotion_discount"],
        totalCouponDiscount: json["total_coupon_discount"],
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "total_origin": totalOrigin,
        "total_amount": totalAmount,
        "total_addition_points": totalAdditionPoints,
        "total_promotion_discount": totalPromotionDiscount,
        "total_coupon_discount": totalCouponDiscount,
    };

}