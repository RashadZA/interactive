class CourseListModel {
  String? courseName;
  String? courseModulesLength;
  String? courseDescription;
  String? courseKey;
  List? courseModules;

  CourseListModel({
    this.courseName,
    this.courseModulesLength,
    this.courseDescription,
    this.courseKey,
    this.courseModules,
  });

  //receiving data from server
  factory CourseListModel.fromMap(map) {
    return CourseListModel(
      courseName: map['courseName'],
      courseModulesLength: map['courseModulesLength'],
      courseDescription: map['courseDescription'],
      courseKey: map['courseKey'],
      courseModules: map['courseModules'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'courseName': courseName,
      'courseModulesLength': courseModulesLength,
      'courseDescription': courseDescription,
      'courseKey': courseKey,
      'courseModules': courseModules,
    };
  }
}
