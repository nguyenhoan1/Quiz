import 'package:flutter/material.dart';
import 'createItemPage.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Table',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Quiz',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm...',
                      prefixIcon: Icon(Icons.search, color: Colors.black54),
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      // Implement filter logic here
                    },
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreateItemPage()),
                      );
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TableWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final List<Map<String, String>> _items = [
    {"id": "1", "title": "Test trầm cảm", "description": "Mô tả 1"},
    {"id": "2", "title": "Test rối loạn lo âu", "description": "Mô tả 2"},
    {"id": "3", "title": "Test rối loạn tâm thần", "description": "Mô tả 3"},
    {"id": "4", "title": "Test rối loạn ăn uống", "description": "Mô tả 4"},
    {"id": "5", "title": "Test rối loạn lưỡng cực", "description": "Mô tả 5"},
    {"id": "6", "title": "Test stress", "description": "Mô tả 6"},
  ];

  List<Map<String, String>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterItems(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredItems = _items;
      } else {
        _filteredItems = _items
            .where((item) =>
                item["title"]!.toLowerCase().contains(searchText.toLowerCase()) ||
                item["id"]!.toLowerCase().contains(searchText.toLowerCase()) ||
                item["description"]!.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  void _updateItem(int index) {
    // Implement your update logic here
    print('Update item at index $index');
  }

  void _deleteItem(int index) {
    setState(() {
      _filteredItems.removeAt(index);
    });
    print('Delete item at index $index');
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
          label: Text('ID', style: TextStyle(color: Colors.black)),
        ),
        DataColumn(
          label: Text('Title', style: TextStyle(color: Colors.black)),
        ),
        DataColumn(
          label: Text('Description', style: TextStyle(color: Colors.black)),
        ),
        DataColumn(
          label: Text('Actions', style: TextStyle(color: Colors.black)),
        ),
      ],
      rows: _filteredItems.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, String> item = entry.value;
        return DataRow(cells: [
          DataCell(
            Text(
              item["id"]!,
              style: TextStyle(color: Colors.black),
            ),
          ),
          DataCell(Text(item["title"]!, style: TextStyle(color: Colors.black))),
          DataCell(Text(item["description"]!, style: TextStyle(color: Colors.black))),
          DataCell(
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    _updateItem(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteItem(index);
                  },
                ),
              ],
            ),
          ),
        ]);
      }).toList(),
    );
  }
}
