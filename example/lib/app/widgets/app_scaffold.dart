import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final String nav;
  final List<Widget> actions;
  final FloatingActionButton floatingActionButton;

  const AppScaffold({
    Key key,
    this.body,
    this.title = '14th Generation',
    this.actions,
    this.nav,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: actions,
        backgroundColor: Colors.pink,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      // bottomNavigationBar: CustomBottomNavBar,
    );
  }
}
