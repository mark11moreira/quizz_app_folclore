import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: WelcomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variaveis

  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color.fromARGB(255, 46, 115, 233);
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = const Color.fromARGB(255, 46, 115, 233);
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text("Perguntas ${index + 1}/${questions.length}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 30.0)),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(questions[index].question!,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 25.0)),
                const SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions[index].answers!.entries.toList()[i].value
                              ? isTrue
                              : isWrong
                          : secondColor,
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                              }
                            },
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RestultScreen(score)));
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInExpo);
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                              color: Colors.orange, width: 1.0)),
                      child: Text(
                        index + 1 == questions.length
                            ? "Veja o resultado"
                            : "Proxima Pergunta",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
