
class Note {
    String name;
    int type;
    int price;
    int discount;
    int quantity;
    int subtotal;

    Note({
        required this.name,
        required this.type,
        required this.price,
        required this.discount,
        required this.quantity,
        required this.subtotal,
    });

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        name: json["name"],
        type: json["type"],
        price: json["price"],
        discount: json["discount"],
        quantity: json["quantity"],
        subtotal: json["subtotal"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "price": price,
        "discount": discount,
        "quantity": quantity,
        "subtotal": subtotal,
    };
}