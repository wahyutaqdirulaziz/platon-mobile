import 'package:dio/dio.dart';
import 'package:platon_mobile/page/detail_project/models/task_detail_response.dart';
import 'package:platon_mobile/page/detail_project/models/task_model.dart';
import 'package:platon_mobile/page/project/models/project_model.dart';
import 'package:platon_mobile/shared/app_url.dart';
import 'package:platon_mobile/shared/dio_config.dart';

class Repository {
  Future<Project> getProject() async {
    try {
      Response response = await dio.get(AppUrl.project);

      if (response.statusCode == 200) {
        return Project.fromJson(response.data);
      } else {
        // Handle unexpected status codes or throw an appropriate exception
        throw Exception("Failed to get Questioner: ${response.statusCode}");
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw Exception("Failed to get Questioner: ${e.message}");
    }
  }

  Future<Task> getTask({int? taskId}) async {
    try {
      Response response = await dio.get('${AppUrl.task}/${taskId}');

      if (response.statusCode == 200) {
        return Task.fromJson(response.data);
      } else {
        // Handle unexpected status codes or throw an appropriate exception
        throw Exception("Failed to get Questioner: ${response.statusCode}");
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw Exception("Failed to get Questioner: ${e.message}");
    }
  }

  Future<TaskDetailResponse> updateStatusTask({int? taskId, String? status}) async {
    try {
      Response response = await dio.patch(
        '${AppUrl.task}/$taskId/status',
        data: {
          'status':
              status, // Gantilah 'new_status' dengan status yang ingin dikirim
        },
      );

      if (response.statusCode == 200) {
        return TaskDetailResponse.fromJson(response.data);
      } else {
        // Handle unexpected status codes or throw an appropriate exception
        throw Exception("Failed to get Questioner: ${response.statusCode}");
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw Exception("Failed to get Questioner: ${e.message}");
    }
  }
}
