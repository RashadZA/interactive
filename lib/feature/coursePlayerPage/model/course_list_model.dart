class CourseModel {
  String? courseName;
  String? courseDescription;
  String? courseEnrolled;

  CourseModel({
    this.courseName,
    this.courseDescription,
    this.courseEnrolled,
  });

  //receiving data from server
  factory CourseModel.fromMap(map) {
    return CourseModel(
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
