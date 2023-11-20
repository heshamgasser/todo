class OneTaskModel {
  String id;
  String title;
  String details;
  String date;
  String time;
  bool status;

  OneTaskModel(
      {this.id = '',
      required this.title,
      required this.details,
      required this.date,
      required this.time,
      required this.status});

  OneTaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          details: json['details'],
          date: json['date'],
          time: json['time'],
          status: json['status'],
        );

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'details': details,
      'date': date,
      'time': time,
      'status': status,
    };
  }

}
