import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'musicpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Flutter',
      initialRoute: '/',
      routes: {
        '/':(context) => const MyHomePage(),
        '/main': (context) => const  musichomepage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool passwordobscured = true;

  var username = '';
  var password = '';

  bool pass = true;

  List User = [
    {"username": "oniichan", "password": "oniichan"}
  ];

  var items = ['Admin', 'User', 'Guest'];
  var dropdwonValue = 1;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text(
          "Login",
          style: GoogleFonts.aladin(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome to this Website!",
                    style: GoogleFonts.baumans(letterSpacing: .5, fontSize: 20),
                  ),
                  DropdownButton(
                      value: dropdwonValue,
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text(
                            "Admin",
                            style: GoogleFonts.aladin(),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(
                            "User",
                            style: GoogleFonts.aladin(),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text(
                            "Guest",
                            style: GoogleFonts.aladin(),
                          ),
                        )
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          dropdwonValue = int.parse(newValue.toString());
                        });
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    labelText: "Username",
                    hintText: "Enter your username",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: passwordController,
                  obscuringCharacter: "*",
                  obscureText: pass,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.grey),
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          pass = !pass;
                        });
                      },
                      icon: pass
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (usernameController.text == User[0]['username'] &&
                              passwordController.text == User[0]['password']) {
                            Navigator.pushNamed(context, '/main');
                          } else {
                            var mysnackBar = const SnackBar(
                              content:
                                  Text("Invalid Username or Wrong Password"),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(mysnackBar);
                          }
                        });
                      },
                      child: Text(
                        "LogIn",
                        style: GoogleFonts.aladin(),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
