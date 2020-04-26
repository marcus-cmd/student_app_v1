import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

/*
class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: <Widget>[
                RaisedButton (onPressed: () {
                  Navigator.pushNamed(context, '/studentlist');
                     },
                    child: Text('Go to Studentlist')),
              ],
            )
        )
    );
  }
}*/


final ThemeData iOSTheme = new ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.grey[400],
  primaryColorBrightness: Brightness.dark,
);

final ThemeData androidTheme = new ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.green,
);

const String defaultUserName =  "John Doe";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      title: "Chat Application",
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? iOSTheme
          : androidTheme,
      home: new Chat(),

    );
  }
}

class Chat extends StatefulWidget {
  static const routeName = '/chat';
  @override
  State createState() => new ChatWindow();

}

class ChatWindow extends State<Chat> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;
/*
  final messageTextController = TextEditingController();
  final _fireStore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String messageText;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser);
      }
    } catch (e) {
      print('hello');
    }
  }

  void messagesStream() async {
    await for (var snapshot in _fireStore.collection('messages').snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }
*/

  Widget build(BuildContext ctx) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    final argsName = args.name;
    print(args.name);
  //  print(args.message);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat Screen"),
        elevation:
        Theme.of(ctx).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: new EdgeInsets.all(6.0),
            )),
        new Divider(height: 1.0),
        new Container(
          child: _buildComposer( args.name ),
          decoration: new BoxDecoration(color: Theme.of(ctx).cardColor),
        ),
      ]),
    );


  }


  Widget _buildComposer(
      String argsName
      ) {

    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,

                  onChanged: (String txt) {
                    setState(() {
                      _isWriting = txt.length > 0;
                    });
                  },

                //  onSubmitted: _submitMsg,
                  decoration:
                  new InputDecoration.collapsed(hintText: "Enter some text to send a message"),

                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                      child: new Text("Submit"),
                      onPressed: _isWriting ? () => _submitMsg(_textController.text, argsName)
                          : null
                  )
                      : new IconButton(
                    icon: new Icon(Icons.message),
                    onPressed: _isWriting
                        ? () => _submitMsg(_textController.text, argsName)
                        : null,

                  )
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border:
              new Border(top: new BorderSide(color: Colors.brown))) :
          null
      ),
    );
  }

  void _submitMsg(String txt, String argsName) {
    _textController.clear();
   print(_messages);
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      txt: txt,
      argsName: argsName,
      animationController: new AnimationController(
          vsync: this,
          duration: new Duration(milliseconds: 800)
      ),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }

}

class Msg extends StatelessWidget {
  Msg({this.txt, this.animationController, this.argsName});
  final String txt;
  final AnimationController animationController;
  final String argsName ;

 // static const routeName = '/chat';
 // final ScreenArguments args = ModalRoute.of(context).settings.arguments;


  @override

  Widget build(BuildContext ctx) {

    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: new CircleAvatar(child: new Text(defaultUserName[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // new Text(defaultUserName, style: Theme.of(ctx).textTheme.subhead),
                   new Text(argsName, style: Theme.of(ctx).textTheme.subhead),

                  new Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: new Text(txt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// to pass from Studentlist to Chat
class ScreenArguments {
  final String name;
  final String message;

  ScreenArguments(this.name, this.message);
}



// Message streaming and bubbles - to be implemented
/*
class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('messages').snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,

          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 20.0,
              ),
              children: messageBubbles,
            )
        );
        // }
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),),
          Material(
            borderRadius: isMe
                ?  BorderRadius.only(
                topLeft:    Radius.circular(30.0) ,
                bottomLeft: Radius.circular (30.0),
                bottomRight: Radius.circular (30.0))
                : BorderRadius.only( bottomLeft: Radius.circular (30.0),
              bottomRight: Radius.circular (30.0),
              topRight: Radius.circular (30.0),
            ),

            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/