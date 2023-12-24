class UserAddressModel {
  Data data;
  bool status;
  String stateNum;
  String message;

  UserAddressModel({
    required this.data,
    required this.status,
    required this.stateNum,
    required this.message,
  });
}

class Data {
  List<Address> addresses;

  Data({
    required this.addresses,
  });
}

class Address {
  int id;
  String longitude;
  String latitude;
  int distance;
  String name;
  String street;
  String buildingNumber;
  String city;
  int addressDefault;
  int apartmentNum;
  int active;
  int type;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Address({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.distance,
    required this.name,
    required this.street,
    required this.buildingNumber,
    required this.city,
    required this.addressDefault,
    required this.apartmentNum,
    required this.active,
    required this.type,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

}
