import 'package:flutter/material.dart';
import 'package:practica1/shared/preferences.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashboardScreen"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey[400],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'Reyes Manuel Martinez Arriaga',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text((Preference.user.isNotEmpty)
                  ? Preference.user
                  : "reyesma550@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/147/147144.png'),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    'https://p4.wallpaperbetter.com/wallpaper/243/559/623/space-circles-graphics-planet-wallpaper-preview.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: const Icon(Icons.document_scanner_sharp),
              title: const Text('Practica 1'),
              onTap: () {},
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: const Icon(Icons.checklist_rtl_outlined),
              title: const Text('Base de datos'),
              onTap: () {},
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesion'),
              onTap: () {
                Preference.password = "";
                Preference.user = "";
                Navigator.pushReplacementNamed(context, '/login');
              },
              trailing: const Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}
