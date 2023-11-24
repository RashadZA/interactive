class CourseListModel {
  String? courseName;
  String? courseDescription;
  String? courseEnrolled;

  CourseListModel({
    this.courseName,
    this.courseDescription,
    this.courseEnrolled,
  });

  //receiving data from server
  factory CourseListModel.fromMap(map) {
    return CourseListModel(
      courseName: map['courseName'],
      courseDescription: map['courseDescription'],
      courseEnrolled: map['courseEnrolled'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'courseName': courseName,
      'courseDescription': courseDescription,
      'courseEnrolled': courseEnrolled,
    };
  }
}
