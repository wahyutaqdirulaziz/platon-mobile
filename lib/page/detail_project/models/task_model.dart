// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    int? statusCode;
    List<TaskDetail>? data;

    Task({
        this.statusCode,
        this.data,
    });

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        statusCode: json["statusCode"],
        data: List<TaskDetail>.from(json["data"].map((x) => TaskDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class TaskDetail {
    int? id;
    String? task;
    String? status;
    int? projectId;
    dynamic userId;
    dynamic user;

    TaskDetail({
        this.id,
        this.task,
        this.status,
        this.projectId,
        this.userId,
        this.user,
    });

    factory TaskDetail.fromJson(Map<String, dynamic> json) => TaskDetail(
        id: json["id"],
        task: json["task"],
        status: json["status"],
        projectId: json["projectId"],
        userId: json["userId"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "status": status,
        "projectId": projectId,
        "userId": userId,
        "user": user,
    };
}
