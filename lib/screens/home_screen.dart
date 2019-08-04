import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/data/post.dart';
import 'package:flutter_app_bloc/data/repository.dart';
import 'package:flutter_app_bloc/data/user.dart';
import 'package:flutter_app_bloc/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  Repository repository = Repository();

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  User user;
  List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanilla'),
      ),
      body: SafeArea(
        child: isLoading ? buildLoading() : buildBody(),
      ),
    );
  }

  Widget _buildPostList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final item = _posts[index];
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(item.id.toString()),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              _posts.removeAt(index);
            });

            // Then show a snackbar.
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("dismissed")));
          },
          // Show a red background as the item is swiped away.
          background: Container(color: Colors.red),
          child: Column(
            children: <Widget>[
              Padding(
                child: new ListTile(
                  title: Text(_posts[index].title),
                  subtitle: Text(item.body),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Divider(
                height: 5.0,
              )
            ],
          ),
        );
      },
      itemCount: _posts.length,
    );
  }

  Widget buildBody() {
    if (_posts != null && _posts.isNotEmpty) {
      return _buildListWithButton();
    } else {
      return buildInit();
    }
  }

  Widget _buildListWithButton() {
    return Column(children: [
      Expanded(child: _buildPostList()),
      Container(
        margin: EdgeInsets.all(8.0),
        width: double.infinity,
        child: RaisedButton(
            onPressed: nextScreen,
            textColor: Colors.white,
            color: Colors.red,
            child: Text('Next screen')),
      )
    ]);
  }

  void nextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondRoute()),
    );
  }

  Widget buildInit() {
    return Center(
      child: RaisedButton(
          child: Text('Load user data'),
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            widget.repository.getPosts().then((posts) {
              setState(() {
                _posts = posts;
                isLoading = false;
              });
            });
          }),
    );
  }

  Widget buildContent() {
    return Center(child: Text('Hello ${user.name} ${user.surname}'));
  }

  Widget buildLoading() {
    return Center(child: CircularProgressIndicator());
  }
}
