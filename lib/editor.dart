import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'blocks/text_block.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  List<Widget> droppedBlocks = [];
  List<Map<String, dynamic>> blockData = [];

  void addBlock(String type) {
    setState(() {
      if (type == "text") {
        droppedBlocks.add(const TextBlock());
        blockData.add({"type": "text", "text": "Hello from Block!"});
      }
    });
  }

  void saveDesign() async {
    final jsonString = jsonEncode(blockData);
    final file = File("design.json");
    await file.writeAsString(jsonString);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("✅ Design saved to design.json")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flatzon Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveDesign,
          ),
        ],
      ),
      body: Row(
        children: [
          // القائمة الجانبية
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
                  onPressed: () => addBlock("text"),
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
