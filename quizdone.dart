import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsoft?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      "answerIndex": 2,
      "imageUrl":
          "https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2023/12/microsoft-1704026713.jpg",
    },
    {
      "question": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 0,
      "imageUrl":
          "https://akm-img-a-in.tosshub.com/indiatoday/apple_647_040116105516.jpg?.xccL1E_SxXCNt9K1Jjgg.vKCdo0Mf0u",
    },
    {
      "question": "Who is the founder of Amazon?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 1,
      "imageUrl":
          "https://st.adda247.com/https://wpassets.adda247.com/wp-content/uploads/multisite/sites/5/2022/11/16140212/L2aCmYvS-amazon1-1200x675-1.jpg",
    },
    {
      "question": "Who is the founder of Tesla?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 3,
      "imageUrl":
          "https://techmonitor.ai/wp-content/uploads/sites/4/2017/03/shutterstock_1140629366.webp",
    },
    {
      "question": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Lary Page", "Bill Gates", "ElonMusk"],
      "answerIndex": 1,
      "imageUrl": "https://etimg.etb2bimg.com/photo/98518615.cms",
    },
  ];
  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int noOfCorrectAnswers = 0;
  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(
            Color.fromARGB(255, 117, 214, 120));
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 219, 95, 86));
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validateCurrentPage() {
    if (selectedAnswerIndex == -1) {
      return;
    }
    if (selectedAnswerIndex == allQuestions[questionIndex]["answerIndex"]) {
      noOfCorrectAnswers += 1;
    }
    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 220, 198, 242),
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 220, 198, 242),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 53, 3, 115),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Questions : ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 39, 3, 70),
                ),
              ),
              Text(
                "${questionIndex + 1}/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 39, 3, 70),
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 370,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    allQuestions[questionIndex]["imageUrl"],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //color: Colors.black,

            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                allQuestions[questionIndex]["question"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 58, 4, 97),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 0;
                  });
                }
              },
              child: Text(
                "A.${allQuestions[questionIndex]["options"][0]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 1;
                  });
                }
              },
              child: Text(
                "B.${allQuestions[questionIndex]["options"][1]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 2;
                  });
                }
              },
              child: Text(
                "C.${allQuestions[questionIndex]["options"][2]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 3;
                  });
                }
              },
              child: Text(
                "D.${allQuestions[questionIndex]["options"][3]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validateCurrentPage();
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              "https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
              height: 500,
              width: double.infinity,
            ),
            const Text(
              "Congratulations!!!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You have completed the Quiz",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text("$noOfCorrectAnswers/${allQuestions.length}"),
            ElevatedButton(
                onPressed: () {
                  questionIndex = 0;
                  questionScreen = true;
                  noOfCorrectAnswers = 0;
                  selectedAnswerIndex = -1;
                  setState(() {});
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.orange,
                  ),
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
