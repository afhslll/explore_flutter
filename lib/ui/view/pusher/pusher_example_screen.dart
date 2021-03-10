import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pusher_websocket_flutter/pusher.dart';

class PusherExampleScreen extends StatefulWidget {
  @override
  _PusherExampleScreenState createState() => _PusherExampleScreenState();
}

class _PusherExampleScreenState extends State<PusherExampleScreen> {
  Event lastEvent;
  String lastConnectionState;
  Channel channel;

  final TextEditingController channelController =
      TextEditingController(text: 'my-channel');
  final TextEditingController eventController =
      TextEditingController(text: 'my-event');

  @override
  void initState() {
    super.initState();
    initPusher();
  }

  Future<void> initPusher() async {
    try {
      await Pusher.init('YOUR KEY', PusherOptions(cluster: 'YOUR CLUSTER'),
          enableLogging: true);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Plugin example app'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildInfo(),
                RaisedButton(
                  onPressed: () {
                    Pusher.connect(onConnectionStateChange: (x) async {
                      if (mounted) {
                        setState(() {
                          lastConnectionState = x.currentState;
                        });
                      }
                    }, onError: (x) {
                      debugPrint('Error: ${x.message}');
                    });
                  },
                  child: Text('Connect'),
                ),
                RaisedButton(
                  onPressed: () {
                    Pusher.disconnect();
                  },
                  child: Text('Disconnect'),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: TextField(
                        controller: channelController,
                        decoration: InputDecoration(hintText: 'Channel'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        channel =
                            await Pusher.subscribe(channelController.text);
                        print('${channel.name}');
                      },
                      child: Text('Subscribe'),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: TextField(
                        controller: channelController,
                        decoration: InputDecoration(hintText: 'Channel'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        await Pusher.unsubscribe(channelController.text);
                        channel = null;
                      },
                      child: Text('Unsubscribe'),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: TextField(
                        controller: eventController,
                        decoration: InputDecoration(hintText: 'Event'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        print('bind');
                        await channel.bind(eventController.text, (x) {
                          if (mounted) {
                            setState(() {
                              lastEvent = x;
                            });
                          }
                        });
                      },
                      child: Text('Bind'),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: TextField(
                        controller: eventController,
                        decoration: InputDecoration(hintText: 'Event'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        await channel.unbind(eventController.text);
                      },
                      child: Text('Unbind'),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Connection State: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastConnectionState ?? 'Unknown'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Last Event Channel: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastEvent?.channel ?? ''),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Last Event Name: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastEvent?.event ?? ''),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Last Event Data: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastEvent?.data ?? ''),
          ],
        ),
      ],
    );
  }
}
