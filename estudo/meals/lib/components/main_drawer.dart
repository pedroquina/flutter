import 'package:flutter/material.dart';
import 'package:meals/utils/app-routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, VoidCallback onTap1) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomRight,
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Theme.of(context).highlightColor,
          child: Text('Vamos cozinhar?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor)),
        ),
        const SizedBox(
          height: 20,
        ),
        _createItem(
          Icons.restaurant,
          'Refeições',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
        ),
        _createItem(
          Icons.settings,
          'Configurações',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
        ),
      ],
    ));
  }
}
