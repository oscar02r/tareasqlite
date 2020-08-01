
class ContactModel {
  int id;
  String name;
  String phone;

  ContactModel({this.id, this.name, this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) => new ContactModel(
      id: json['id'], 
      name: json['name'], 
      phone: json['phone']
      );

  Map<String, dynamic> toJson() => {
    "id"    : id, 
    "name"  : name, 
    "phone" : phone
    };
    
}
