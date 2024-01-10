class Player {
  String? name;
  String? position;
  String? club;
  String? country;
  int? age;

  Player({this.name, this.position, this.club, this.country, this.age});

  Player.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    position = json['position'];
    club = json['club'];
    country = json['country'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['position'] = this.position;
    data['club'] = this.club;
    data['country'] = this.country;
    data['age'] = this.age;
    return data;
  }
}
