import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.settings, this.onSettingsChange, {super.key});

  final Function(Settings) onSettingsChange;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChange,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subTitle),
        value: value,
        onChanged: (value) {
          onChange(value);
          widget.onSettingsChange(settings);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _createSwitch(
                'Sem Glúten',
                'Só exibe refeições sem glúten',
                settings.isGlutenFree,
                (value) => setState(() {
                  settings.isGlutenFree = value;
                }),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose',
                settings.isLactoseFree,
                (value) => setState(() {
                  settings.isLactoseFree = value;
                }),
              ),
              _createSwitch(
                'Vegana',
                'Só exibe refeições sem veganas',
                settings.isVegan,
                (value) => setState(() {
                  settings.isVegan = value;
                }),
              ),
              _createSwitch(
                'Vegetariana',
                'Só exibe refeições sem vegetarianas',
                settings.isVegetarian,
                (value) => setState(() {
                  settings.isVegetarian = value;
                }),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
