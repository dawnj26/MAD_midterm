import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> item = [];
  List<bool> checked = [];
  var input = TextEditingController();

  void update() {
    setState(() {
      item.add(input.text);
      checked.add(false);
      input.clear();
    });
  }

  void clear() {
    setState(() {
      while (checked.contains(true)) {
        for (int i = 0; i < item.length; i++) {
          if (checked[i]) {
            item.removeAt(i);
            checked.removeAt(i);
            break;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shop_rounded),
        title: const Text('Shopping Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: clear,
              child: const Icon(
                Icons.delete_sweep_rounded,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddWidget(input, update),
            Expanded(
              child: item.isEmpty
                  ? const Center(
                      child: Text(
                        'No items',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (_, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item[index],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: checked[index]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                Checkbox(
                                  value: checked[index],
                                  onChanged: (check) {
                                    setState(() {
                                      checked[index] = check!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: item.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddWidget extends StatelessWidget {
  const AddWidget(
    this.i,
    this.v, {
    super.key,
  });

  final TextEditingController i;
  final VoidCallback v;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: i,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Add items'),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: 48.0,
          child: ElevatedButton(
            onPressed: v,
            child: const Text('Add'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: const Text(
            'Cart',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
          ),
        ),
      ],
    );
  }
}
