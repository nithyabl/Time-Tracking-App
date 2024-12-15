class CompletedTaskResponse {
  String? projectId;
  String? taskId;
  String? name;
  String? dateCompleted;

  CompletedTaskResponse({
    this.projectId,
    this.taskId,
    this.name,
    this.dateCompleted,
  });

  factory CompletedTaskResponse.fromJson(Map<String, dynamic> json) {
    return CompletedTaskResponse(
      projectId: json['projectId'],
      taskId: json['taskId'],
      name: json['name'],
      dateCompleted: json['dateCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'taskId': taskId,
      'name': name,
      'dateCompleted': dateCompleted,
    };
  }
}
