class OrderItem {
  int? id;
  int? foodId;
  int? quantity;
  int? userId;
  String? idForOrder;

  String? foodName;
  String? dateCreated;
  String? completionStatus;


  OrderItem({
     this.id,
     this.foodId,
     this.quantity,
     this.userId,
     this.idForOrder,

     this.foodName,
     this.dateCreated,
     this.completionStatus,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      foodId: json['foodId'],
      quantity: json['quantity'],
      userId: json['userId'],
      idForOrder: json['idForOrder'],
      foodName: json['foodName'],
      dateCreated: json['dateCreated'],
      completionStatus: json['completionStatus'],
    );
  }
}