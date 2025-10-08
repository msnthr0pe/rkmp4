import 'package:flutter/material.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  const ListViewSeparatedScreen({super.key});

  @override
  State<ListViewSeparatedScreen> createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
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
        title: const Text('ListView.separated'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addItemDialog,
            child: const Text('Добавить продукт'),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: shoppingItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(shoppingItems[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          shoppingItems.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  height: 20,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}