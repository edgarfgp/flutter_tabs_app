import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

/*
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layouts"),
        ),
        body: TheGridView().build(),
      ));
  }

}
*/

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class SimpleWidget extends StatefulWidget {
  @override
  SimpleWidgetState createState() => SimpleWidgetState();

}


class SimpleWidgetState extends State<SimpleWidget> {

  int stepCounter = 0;
  List<Step> steps = [
    Step(
      title: Text("Step one"),
      content: Text("This is the first step"),
      isActive: true,
    ), //Step
    Step(
      title: Text("Step two"),
      content: Text("This is the second step"),
      state: StepState.editing,
      isActive: true,
    ),
    Step(
      title: Text("Step three"),
      content: Text("This is the third step"),
      isActive: true,
    ),
    Step(
      title: Text("Step four"),
      content: Text("This is the Fourth step"),
      isActive: true,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        currentStep: this.stepCounter,
        steps: steps,
        type: StepperType.vertical,
        onStepTapped: (step) {
          setState(() {
            stepCounter = step;
          });
        },
        onStepCancel: () {
          setState(() {
            stepCounter > 0 ?
            stepCounter -= 1 : stepCounter = 0;
          });
        },
        onStepContinue: () {
          setState(() {
            stepCounter < steps.length - 1 ?
            stepCounter += 1 : stepCounter = 0;
          });
        },
      ),
    );
  }
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layouts"),
          backgroundColor: Colors.red,
          bottom: makeTab(),
        ),
        body: makeTabBarView(<Widget>[
          TheGridView().build(),
          SimpleWidget()
        ]),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  TabBar makeTab() {
    return TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.settings_power),
        ),
      ],
      controller: tabController,
    );
  }

  TabBarView makeTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }
}


class TheGridView {
  Card makeGridCell(String name, IconData icon) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(child: Icon(icon)),
          Center(child: Text(name)),
        ],
      ),
    );
  }

  GridView build() {
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        makeGridCell("Home", Icons.home),
        makeGridCell("Email", Icons.email),
        makeGridCell("Chat", Icons.chat),
        makeGridCell("New", Icons.new_releases),
        makeGridCell("Networks", Icons.network_wifi),
        makeGridCell("Options", Icons.settings)
      ],
    );
  }
}


