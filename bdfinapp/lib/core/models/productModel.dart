class Product {
  String id;
  String address;
  String name;
  String phone;
  String email;
  String password;
  String birthdate;
  String profession;

  Product(
      {this.id,
      this.address,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.profession,
      this.birthdate});

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        address = snapshot['address'] ?? '',
        name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '',
        password = snapshot['password'] ?? '',
        birthdate = snapshot['birthdate'] ?? '',
        profession = snapshot['profession'] ?? '',
        phone = snapshot['phone'] ?? '';

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "address": address,
      "email": email,
      "password": password,
      "birthdate": birthdate,
      "profession":profession,
    };
  }
}
