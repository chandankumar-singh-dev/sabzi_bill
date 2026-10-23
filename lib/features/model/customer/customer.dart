class Customer {
  int? id;
  String name;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;

  Customer(this.id ,this.name, this.phone, this.address, this.createdAt, this.updatedAt);

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      json["id"] as int?,
      json['name'] as String,
      json['phone'] as String?,
      json['address'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
