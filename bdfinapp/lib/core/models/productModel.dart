class Product {
  String id;
  String address;
  String name;
  String phone;
  String email;
  String password;

  Product({this.id, this.address, this.name, this.phone,this.email,this.password});

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        address = snapshot['address'] ?? '',
        name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '',
        password = snapshot['password'] ?? '',
        phone = snapshot['phone'] ?? '';

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "address": address,
      "email":email,
      "password":password,
    };
  }
}
