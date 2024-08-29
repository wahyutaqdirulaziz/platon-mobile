part of 'detail_project.dart';

class DetailProjectPage extends StatelessWidget {
  final bloc = Get.put(TaskController());
  DetailProjectPage({super.key});

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
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TabBar(
                padding: const EdgeInsets.all(4),
                dividerColor:
                    Colors.transparent, // Menghilangkan garis pembatas
                tabs: const [
                  Tab(
                    text: "Open",
                  ),
                  Tab(
                    text: "NEEDREVIEW",
                  ),
                  Tab(
                    text: "Done",
                  ),
                ],

                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.orange, // Warna indikator
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Task Open",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Obx(() {
                            if (bloc.mainloading.isFalse) {
                              return RefreshIndicator(
                                onRefresh: () async {
                                  bloc.getTask();
                                  return Future<void>.delayed(
                                      const Duration(seconds: 3));
                                },
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: bloc.taskResponse.data
                                      ?.where((task) => task.status == "OPEN")
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var openTasks = bloc.taskResponse.data
                                        ?.where((task) => task.status == "OPEN")
                                        .toList();
                                    return SwipeTo(
                                      iconOnRightSwipe: Icons.check,
                                      onRightSwipe: (details) async {
                                        bloc.updateTask(
                                            status: "NEEDREVIEW",
                                            taskId: openTasks?[index].id);
                                        return Future<void>.delayed(
                                            const Duration(seconds: 3));
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        child: ListTile(
                                            leading:
                                                const Icon(Ionicons.document),
                                            title: Text(
                                                openTasks?[index].task ?? ""),
                                            subtitle: Text(
                                              openTasks?[index].status ?? "",
                                              style: const TextStyle(
                                                  color: Colors.greenAccent),
                                            ),
                                            enabled: true,
                                            onTap: () {
                                              // bloc.updateTask(
                                              //     status: "NEEDREVIEW",
                                              //     taskId: openTasks?[index].id);
                                              // bloc.getTask();
                                            }),
                                      ),
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Task Need Review",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Obx(() {
                            if (bloc.mainloading.isFalse) {
                              return RefreshIndicator(
                                onRefresh: () async {
                                  bloc.getTask();
                                  return Future<void>.delayed(
                                      const Duration(seconds: 3));
                                },
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: bloc.taskResponse.data
                                      ?.where(
                                          (task) => task.status == "NEEDREVIEW")
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var openTasks = bloc.taskResponse.data
                                        ?.where((task) =>
                                            task.status == "NEEDREVIEW")
                                        .toList();
                                    return SwipeTo(
                                      iconOnRightSwipe: Icons.check,
                                      onRightSwipe: (details) async {
                                        bloc.updateTask(
                                            status: "DONE",
                                            taskId: openTasks?[index].id);
                                        return Future<void>.delayed(
                                            const Duration(seconds: 3));
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        child: ListTile(
                                            leading:
                                                const Icon(Ionicons.document),
                                            title: Text(
                                                openTasks?[index].task ?? ""),
                                            subtitle: Text(
                                              openTasks?[index].status ?? "",
                                              style: const TextStyle(
                                                  color: Colors.greenAccent),
                                            ),
                                            enabled: true,
                                            onTap: () {}),
                                      ),
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Task Done",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Obx(() {
                            if (bloc.mainloading.isFalse) {
                              return RefreshIndicator(
                                onRefresh: () async {
                                  bloc.getTask();
                                  return Future<void>.delayed(
                                      const Duration(seconds: 3));
                                },
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: bloc.taskResponse.data
                                      ?.where((task) => task.status == "DONE")
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var openTasks = bloc.taskResponse.data
                                        ?.where((task) => task.status == "DONE")
                                        .toList();
                                    return Card(
                                      color: Colors.white,
                                      child: ListTile(
                                          leading:
                                              const Icon(Ionicons.document),
                                          title: Text(
                                              openTasks?[index].task ?? ""),
                                          subtitle: Text(
                                            openTasks?[index].status ?? "",
                                            style: const TextStyle(
                                                color: Colors.greenAccent),
                                          ),
                                          enabled: true,
                                          onTap: () {}),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
