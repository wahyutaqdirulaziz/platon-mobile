// To parse this JSON data, do
//
//     final taskDetail = taskDetailFromJson(jsonString);

import 'dart:convert';

TaskDetailResponse taskDetailFromJson(String str) => TaskDetailResponse.fromJson(json.decode(str));

String taskDetailToJson(TaskDetailResponse data) => json.encode(data.toJson());

class TaskDetailResponse {
    int? statusCode;
    Data? data;

    TaskDetailResponse({
        this.statusCode,
        this.data,
    });

    factory TaskDetailResponse.fromJson(Map<String, dynamic> json) => TaskDetailResponse(
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data!.toJson(),
    };
}

class Data {
    int? id;
    String? task;
    String? status;
    int? projectId;
    dynamic userId;

    Data({
        this.id,
        this.task,
        this.status,
        this.projectId,
        this.userId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        task: json["task"],
        status: json["status"],
        projectId: json["projectId"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "status": status,
        "projectId": projectId,
        "userId": userId,
    };
}
