import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    bool hasAvatarImage = context.watch<ProfileState>().hasAvatar;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              radius: 100, // adjust the radius as needed
              backgroundImage:
                  hasAvatarImage ? const AssetImage('path/to/image.png') : null,
              child: hasAvatarImage
                  ? null
                  : const Icon(
                      Icons.person,
                      size: 100,
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.watch<ProfileState>().username,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),

            /*
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
              */
          ],
        ),
      ),
    );
  }

  void saveInput(BuildContext context) {
    String username =
        usernameController.text.isEmpty ? '' : usernameController.text;
    context.read<ProfileState>().setUsername(username);
    usernameController.text = '';
  }
}

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(context.watch<ProfileState>().username,
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headlineMedium);
  }
}
