class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
      );

  // Map<String, dynamic> toJson() => {
  //     "street": street,
  //     "suite": suite,
  //     "city": city,
  //     "zipcode": zipcode,
  // };
}
