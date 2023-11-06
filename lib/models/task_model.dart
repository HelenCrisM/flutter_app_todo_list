// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String task;
  bool isDone;

  TaskModel({
    required this.task,
    required this.isDone,
  });


  TaskModel copyWith({
    String? task,
    bool? isDone,
  }) {
    return TaskModel(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task': task,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      task: map['task'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    task: json["task"],
    isDone: json["isDone"],
  );

  Map<String, dynamic> toJson() => {
    "task": task,
    "isDone": isDone,
  };



  @override
  String toString() => 'TaskModel(task: $task, isDone: $isDone)';

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.task == task &&
      other.isDone == isDone;
  }

  @override
  int get hashCode => task.hashCode ^ isDone.hashCode;
}
