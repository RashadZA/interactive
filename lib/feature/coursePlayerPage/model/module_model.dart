class ModuleModel {
  String? courseKey;
  String? courseModuleName;
  String? courseModuleKey;

  ModuleModel({
    this.courseKey,
    this.courseModuleName,
    this.courseModuleKey,
  });

  //receiving data from server
  factory ModuleModel.fromMap(map) {
    return ModuleModel(
      courseKey: map['courseKey'],
      courseModuleName: map['courseModuleName'],
      courseModuleKey: map['courseModuleKey'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'courseKey': courseKey,
      'courseModuleName': courseModuleName,
      'courseModuleKey': courseModuleKey,
    };
  }
}
