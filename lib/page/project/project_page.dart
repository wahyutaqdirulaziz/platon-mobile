part of 'project.dart';

class ProjectPage extends StatelessWidget {
  final bloc = Get.put(ProjectController());
  ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.network(
            "https://platon.co.id/_next/image?url=%2FGlobalLogo.png&w=256&q=75",
            width: 80,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Project",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (bloc.mainloading.isFalse) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        bloc.getProject();
                        return Future<void>.delayed(const Duration(seconds: 3));
                      },
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: bloc.projectResponse.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                                leading: const Icon(Ionicons.document),
                                title: Text(bloc.projectResponse.data?[index]
                                        .projectName ??
                                    ""),
                                subtitle: const Text(
                                    'klik untuk melihat detail task Project'),
                                enabled: true,
                                onTap: () {
                                  Get.toNamed('/task', arguments: {
                                    "id": bloc.projectResponse.data?[index].id
                                  });
                                }),
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
              )
            ],
          ),
        ));
  }
}
