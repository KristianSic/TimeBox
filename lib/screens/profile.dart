import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timebox/providers/theme_provider.dart';
import '../providers/user_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const User(),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a name',
              ),
            ),
            Text(
              'theme: ',
              style: textTheme.headlineLarge,
            ),
            Switch(
                value: context.read<ThemeState>().themeMode == ThemeMode.dark,
                onChanged: (newVal) {
                  setState(() {
                    // ui doesnt auto update ... maybe beacuse "==" ?
                    context.read<ThemeState>().toggleTheme(newVal);
                  });
                }),
            ElevatedButton(
                onPressed: () => saveInput(context), child: const Text('Save')),
          ],
        ),
      ),
    );
  }

  void saveInput(BuildContext context) {
    String name =
        usernameController.text.isEmpty ? 'Kristian' : usernameController.text;
    context.read<ProfileState>().setName(name);
    usernameController.text = '';
  }
}

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(context.watch<ProfileState>().name,
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headlineMedium);
  }
}
