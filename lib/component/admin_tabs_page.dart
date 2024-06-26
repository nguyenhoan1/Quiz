import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/manage_qna.dart';
import 'package:flutter_application_1/admin/manage_tests.dart';
import 'package:flutter_application_1/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

class AdminTabsPage extends StatefulWidget {
  @override
  _AdminTabsPageState createState() => _AdminTabsPageState();
}

class _AdminTabsPageState extends State<AdminTabsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuizProvider>(context, listen: false).fetchQuizData();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Content'),
        backgroundColor: Colors.cyan,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 4.0,
          tabs: [
            Tab(text: 'Manage Tests'),
            Tab(text: 'Manage Q&A'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ManageTestsPage(),
          ManageQnAPage(),
        ],
      ),
    );
  }
}
