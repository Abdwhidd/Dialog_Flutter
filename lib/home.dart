import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = 'Belum ada Input';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          data,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Telah Di Klik');
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirm'),
                content: Text('Are you sure to delete this Item?'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      print('Klik No');
                      Navigator.of(context).pop(false);
                      setState(() {
                        data = 'False';
                      });
                    },
                    child: Text('No'),
                  ),
                  FlatButton(
                    onPressed: () {
                      print('Klik Yes');
                      Navigator.of(context).pop(true);
                      setState(() {
                        data = 'True';
                      });
                    },
                    child: Text('Yes'),
                  ),
                ],
              );
            },
          ).then((value) => (value));
        },
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
