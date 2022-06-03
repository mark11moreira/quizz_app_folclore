import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  get color => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      "lib/assets/images/selva.jpeg",
                      fit: BoxFit.cover,
                    ))),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                      width: 140,
                      height: 140,
                      color: const Color.fromARGB(255, 39, 145, 17),
                      child: const Icon(Icons.question_mark,
                          color: Colors.white, size: 80)),
                ),
                const SizedBox(height: 20.0),
                const Text("Bem Vindo ao Quiz",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.normal)),
                const SizedBox(height: 60.0),
                const Text(
                  "Teste seu conhecimento \nSobre o Folclore Brasileiro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(height: 90.0),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    //  shape: RoundedRectangleBorder(
                    //      borderRadius: BorderRadius.circular(30)),
                    //  color: const Color.fromARGB(255, 39, 145, 17),
                    //   padding: const EdgeInsets.all(15),
                    child: const Text("Jogar Agora",
                        style: TextStyle(color: Colors.white, fontSize: 18.0)))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
