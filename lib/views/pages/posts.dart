import 'package:celusentiments/models/result.dart';
import 'package:celusentiments/services/store_service.dart';
import 'package:celusentiments/views/new_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Result> results = List<Result>();

  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  Widget _buider(BuildContext context, int index) {
    return ListTile(
      title: Text(results[index].message),
      subtitle: Text(
          "Score: ${results[index].score.toStringAsFixed(2)} (${results[index].value})"),
      leading: Icon(results[index].getIcon(), color: Colors.amber, size: 32,),
    );
  }

  Future<void> onRefresh() async {
    results = await StoreService.instance.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          child: ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: _buider,
            itemCount: results.length,
          ),
          onRefresh: onRefresh),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewPost()));
          }),
    );
  }
}
