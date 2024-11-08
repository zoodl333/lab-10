import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  Preview({super.key, required this.fontSize, required this.text});
  final _textController = TextEditingController();

  final fontSize;
  final text;

  _alertDialog(context, text) {
    return AlertDialog(

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Image.network(
              'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
              width: 50,
              height: 50,
            ),
            SizedBox(height: 15),
            Text(
              text,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 30),
            Align(alignment: Alignment.centerRight, child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Закриває AlertDialog
              },
              child: const Text('OK'),
            ),)
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Preview'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _alertDialog(context, "Don't know what to say");
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.center, child: Text(
                text,
                style: TextStyle(fontSize: fontSize)
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 32.0)),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _alertDialog(context, 'Cool!');
                        },
                      );
                    },
                    child: const Text('OK', style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(width: 30),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onPrimary,
                        side: BorderSide(width: 1.0, color: Colors.grey)
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _alertDialog(context, 'Let’s try something else');
                          },
                        );
                    },
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
