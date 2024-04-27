import 'package:flutter/material.dart';
import 'package:to_do_list/src/models/new_elivated_button.dart';
import 'package:to_do_list/src/screen/home_screen.dart';

class GetStated extends StatefulWidget {
  const GetStated({super.key});

  @override
  State<GetStated> createState() => _GetStatedState();
}

class _GetStatedState extends State<GetStated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Hero(
                  tag: 'Clipboard',
                  child: Image.asset(('assets/icon-512.jpg')),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Reminders made simple",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple.shade700),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "make your to-do neat and simple",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: MyElevatedButton(
                  onPressed: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ))
                  },
                  width: 300,
                  height: 50,
                  borderRadius: BorderRadius.circular(50),
                  child: const Text(
                    'Get started',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
