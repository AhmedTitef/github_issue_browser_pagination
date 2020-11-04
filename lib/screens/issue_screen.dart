import 'package:flutter/material.dart';
import 'package:githubissuebrowser/services/issues.dart';

class IssueScreen extends StatefulWidget {

  static const id = "issue_screen";
  var snapshot;

  IssueScreen({
    this.snapshot
});
  @override
  _IssueScreenState createState() => _IssueScreenState(
    snapshot : snapshot
);
}

class _IssueScreenState extends State<IssueScreen> {
  _IssueScreenState({
    this.snapshot,
});

  Issues snapshot; // snapshot contains issue information at specific index
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Issue#: " + snapshot.id.toString()),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title: " + snapshot.title),
                  Divider(),
                  Text("ID number: " + snapshot.id.toString()),
                  Divider(),
                  Text("State:" +snapshot.state),
                  Divider(),
                  Text("Body: " + snapshot.body),
                  Divider(),
                  Text("URL: " + snapshot.url),
                  Divider(),
                  Text("Comments number: " +snapshot.comments.toString()),
                  Divider(),
                  Text(snapshot.user.id.toString()),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
