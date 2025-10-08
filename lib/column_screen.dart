import 'package:flutter/material.dart';

class ColumnScreen extends StatefulWidget {
  const ColumnScreen({super.key});

  @override
  State<ColumnScreen> createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  List<String> shoppingItems = [
    'Хлеб',
    'Молоко',
    'Яблоки',
    'Банан',
    'Кофе',
    'Сахар',
    'Чай',
    'Печенье',
    'Сыр',
    'Колбаса',
    'Йогурт',
    'Сок',
    'Макароны',
    'Рис',
    'Гречка',
    'Мясо',
    'Рыба',
    'Овощи',
    'Фрукты',
    'Шоколад'
  ];
  final TextEditingController _textFieldController = TextEditingController();

  void _addItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить продукт'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Введите название..."),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ОТМЕНА'),
              onPressed: () {
                Navigator.pop(context);
                _textFieldController.clear();
              },
            ),
            TextButton(
              child: const Text('ДОБАВИТЬ'),
              onPressed: () {
                setState(() {
                  shoppingItems.add(_textFieldController.text);
                });
                Navigator.pop(context);
                _textFieldController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addItemDialog,
              child: const Text('Добавить продукт'),
            ),
            ...shoppingItems.map((String item) {
              return Card(
                child: ListTile(
                  title: Text(item),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        shoppingItems.remove(item);
                      });
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}