import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_praktiki/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_praktiki/screens/textfield_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseAuth auth;
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    auth.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'E-mail'),
              onSubmitted: (typedEmail) {
                if (typedEmail.isEmpty) {
                  print('type e mail');
                } else {
                  email = typedEmail;
                  print(email.toString());
                }
              },
            ),
            const SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Password'),
              onSubmitted: (typedPassword) {
                if (typedPassword.isEmpty) {
                  print('type password');
                } else {
                  password = typedPassword;
                  print(password.toString());
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  addUserEmailandPassword();
                },
                child: const Text('Register')),
            ElevatedButton(
                onPressed: () {
                  LoginEmailandPassword();
                },
                child: const Text('Login')),
            ElevatedButton(
                onPressed: () {
                  signOutUser();
                },
                child: const Text('Sing out')),
          ],
        ),
      ),
    );
  }

  void addUserEmailandPassword() async {
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(userCredential);
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: non_constant_identifier_names
  void LoginEmailandPassword() async {
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyScreen()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void signOutUser() async {
    await auth.signOut();
  }
}
