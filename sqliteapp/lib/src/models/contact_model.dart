class ContactModel {
  int id;
  String name;
  String lastName;
  String phone;

  ContactModel({this.id, this.name, this.lastName,this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) => new ContactModel(
       id       : json['id'],
       name     : json['name'],
       lastName : json['lastName'],
       phone    : json['phone'],
      );

  Map<String, dynamic> toJson() => {
     "id": id, 
     "name": name, 
     "lastName":lastName,
     "phone": phone
  };
}
