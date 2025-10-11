import 'package:flutter/material.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  const ListViewSeparatedScreen({super.key});

  @override
  State<ListViewSeparatedScreen> createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  List<Map<String, dynamic>> shoppingItems = [
    {'id': '1', 'name': 'Хлеб'},
    {'id': '2', 'name': 'Молоко'},
    {'id': '3', 'name': 'Яблоки'},
    {'id': '4', 'name': 'Банан'},
    {'id': '5', 'name': 'Кофе'},
    {'id': '6', 'name': 'Сахар'},
    {'id': '7', 'name': 'Чай'},
    {'id': '8', 'name': 'Печенье'},
    {'id': '9', 'name': 'Сыр'},
    {'id': '10', 'name': 'Колбаса'},
    {'id': '11', 'name': 'Йогурт'},
    {'id': '12', 'name': 'Сок'},
    {'id': '13', 'name': 'Макароны'},
    {'id': '14', 'name': 'Рис'},
    {'id': '15', 'name': 'Гречка'},
    {'id': '16', 'name': 'Мясо'},
    {'id': '17', 'name': 'Рыба'},
    {'id': '18', 'name': 'Овощи'},
    {'id': '19', 'name': 'Фрукты'},
    {'id': '20', 'name': 'Шоколад'},
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
                if (_textFieldController.text.isNotEmpty) {
                  setState(() {
                    shoppingItems.add({
                      'id': DateTime.now().millisecondsSinceEpoch.toString(),
                      'name': _textFieldController.text
                    });
                  });
                  Navigator.pop(context);
                  _textFieldController.clear();
                }
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
                final item = shoppingItems[index];
                return Card(
                  key: Key(item['id']),
                  child: ListTile(
                    title: Text(item['name']),
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