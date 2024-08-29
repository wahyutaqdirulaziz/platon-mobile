part of "../project.dart";

class ProjectController extends GetxController {
  var mainloading = false.obs;
  var repostory = Repository();
  var projectResponse = Project();
  @override
  void onReady() {
    super.onReady();
    getProject();
    debugPrint("Hello111");
  }

  Future<void> getProject() async {
    mainloading(true);
    try {
      var response = await repostory.getProject();
      if (response.data != null) {
        mainloading(false);
        projectResponse = Project.fromJson(response.toJson());
      }
    } catch (e) {
      mainloading(false);
      Get.snackbar("Error", e.toString());
    }
  }
}
