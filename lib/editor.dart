import 'package:flutter/material.dart';
import 'blocks/text_block.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  List<Widget> droppedBlocks = [];

  void addBlock(Widget block) {
    setState(() {
      droppedBlocks.add(block);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flatzon Editor')),
      body: Row(
        children: [
          // قائمة البلوكات الجاهزة
          Container(
            width: 150,
            color: Colors.grey[200],
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Blocks', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  onPressed: () => addBlock(const TextBlock()),
                  child: const Text("Text Block"),
                ),
              ],
            ),
          ),
          // ساحة البناء
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: droppedBlocks,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
