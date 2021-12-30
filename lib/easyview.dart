import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  static const String routeName = '/reports';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        centerTitle: true,
	import 'dart:math';

import 'package:flutter/material.dart';
import 'package:password_generator/theme.dart';
import 'package:clipboard/clipboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isCheckedSpecial = true;
  var isCheckedNumbers = true;
  var isCheckedUppercase = true;
  var passwordLength = 16;
  var password = '';
  TextEditingController passwordLengthForm = TextEditingController();
  void generatePassword() {
    var chars = 'abcdefghijklmnopqrstuvwxyz';
    passwordLength = int.parse(passwordLengthForm.text);
    if (isCheckedSpecial) {
      chars += '!@#%^&*()';
    }
    if (isCheckedNumbers) {
      chars += '01234567890123456789';
    }
    if (isCheckedUppercase) {
      chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    var r = Random();
    password =
        List.generate(passwordLength, (index) => chars[r.nextInt(chars.length)])
            .join();
    setState(() {});
  }

  void copyPassword() {
    var passwordString = password.toString();
    FlutterClipboard.copy(passwordString);
    print(passwordString);
  }

  @override
  void initState() {
    passwordLengthForm.text = '16';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Password',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                ' Generator',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          )),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  password,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            const Spacer(),
            Column(
              children: [
                const Text('Password length'),
                Container(
                  width: 40,
                  child: TextField(
                    controller: passwordLengthForm,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    cursorColor: Color(0xFFFF40B3),
                    textAlign: TextAlign.center,
                    autofocus: false,
                    decoration: const InputDecoration(
                      counterText: "",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFF40B3)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text('Special characters'),
                Checkbox(
                  value: isCheckedSpecial,
                  onChanged: (value) {
                    setState(() {
                      isCheckedSpecial = value!;
                    });
                  },
                  fillColor: checkboxColor,
                ),
                const Text('Uppercase letters'),
                Checkbox(
                  value: isCheckedUppercase,
                  onChanged: (value) {
                    setState(() {
                      isCheckedUppercase = value!;
                    });
                  },
                  fillColor: checkboxColor,
                ),
                const Text('Numbers'),
                Checkbox(
                  value: isCheckedNumbers,
                  onChanged: (value) {
                    setState(() {
                      isCheckedNumbers = value!;
                    });
                  },
                  fillColor: checkboxColor,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                TextButton(
                  onPressed: generatePassword,
                  style: secondaryButtonStyle,
                  child: Text(
                    'Generate password',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: copyPassword,
                  style: primaryButtonStyle,
                  child: Text(
                    '    Copy password    ',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
      ),
    ));
  }
}
