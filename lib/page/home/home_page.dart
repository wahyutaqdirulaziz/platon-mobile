part of 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.network(
          "https://platon.co.id/_next/image?url=%2FGlobalLogo.png&w=256&q=75",
          width: 80,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => Get.to(ProjectPage()),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius:
                        BorderRadius.circular(12), // Radius sudut bulat
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width /
                      2.5, // Menyesuaikan lebar untuk spasi
                  child: const Center(
                    child: Text(
                      "Clients",
                      style: TextStyle(
                        color: Colors.white, // Warna teks putih
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(ProjectPage()),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.circular(12), // Radius sudut bulat
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width /
                      2.5, // Menyesuaikan lebar untuk spasi
                  child: const Center(
                    child: Text(
                      "Talents",
                      style: TextStyle(
                        color: Colors.white, // Warna teks putih
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
