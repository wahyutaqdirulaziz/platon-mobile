part of '../detail_project.dart';

class TaskController extends GetxController {
  var mainloading = false.obs;
  var repostory = Repository();
  var taskResponse = Task();
  final argument = Get.arguments;

  @override
  void onReady() {
    super.onReady();
    getTask();
    debugPrint("Hello111${argument["id"]}");
  }

  Future<void> getTask() async {
    mainloading(true);
    try {
      var response = await repostory.getTask(taskId: argument["id"]);
      if (response.data != null) {
        mainloading(false);
        taskResponse = Task.fromJson(response.toJson());
      }
    } catch (e) {
      mainloading(false);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateTask({int? taskId, String? status}) async {
    mainloading(true);
    try {
      var response =
          await repostory.updateStatusTask(taskId: taskId, status: status);
      if (response.data != null) {
        mainloading(false);
        getTask();
        Get.snackbar("Success", "Status berhasil di Update ke ${status}");
      }
    } catch (e) {
      mainloading(false);
      Get.snackbar("Error", e.toString());
    }
  }
}
