// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
    int? statusCode;
    List<DataProject>? data;

    Project({
        this.statusCode,
        this.data,
    });

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        statusCode: json["statusCode"],
        data: List<DataProject>.from(json["data"].map((x) => DataProject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DataProject {
    int? id;
    String? projectName;

    DataProject({
        this.id,
        this.projectName,
    });

    factory DataProject.fromJson(Map<String, dynamic> json) => DataProject(
        id: json["id"],
        projectName: json["project_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "project_name": projectName,
    };
}
