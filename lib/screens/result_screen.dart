import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class RestultScreen extends StatefulWidget {
  final int score;
  const RestultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _RestultScreenState createState() => _RestultScreenState();
}

class _RestultScreenState extends State<RestultScreen> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color.fromARGB(255, 46, 115, 233);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Parabéns!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              "sua pontuação é :",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.0),
            Text("${widget.score}",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 55.0,
                )),
            SizedBox(height: 60.0),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              elevation: 0.0,
              color: Colors.orange,
              child: Text(
                "Repetir Jogo",
              ),
            )
          ],
        ),
      ),
    );
  }
}
