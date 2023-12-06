import 'package:flutter/material.dart';
import 'package:tudin/pages/main_page.dart';
import 'package:tudin/repository/task_repository.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.repository});

  final TaskRepository repository;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 225, 83, 130),
      Colors.amber,
      Colors.blue
    ],
  ).createShader(const Rect.fromLTWH(130.0, 130.0, 140.0, 20.0));

  final TextEditingController userController = TextEditingController();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/list-pink.png'),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Tu-Din",
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: "Agbalumo",
                  foreground: Paint()..shader = linearGradient),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: userController,
                decoration: const InputDecoration(hintText: "Usuário"),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                obscureText: isObscureText,
                decoration: InputDecoration(hintText: "Senha", suffixIcon: InkWell(
                  onTap: (){
                    setState((){
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility, color: const Color.fromARGB(255, 234, 194, 65),),
                )),
              ),
            ),

            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {},
                style: const ButtonStyle(alignment: Alignment.bottomRight),
                child: const Text(
                  "Esqueceu a senha?",
                  style: TextStyle(color: Color.fromARGB(255, 79, 160, 225), fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: const Color.fromARGB(255, 225, 83, 130),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainPage(username: userController.text, repository: widget.repository,)));
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    foregroundColor: const Color.fromARGB(255, 79, 160, 225),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: const Text(
                  'Criar conta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
