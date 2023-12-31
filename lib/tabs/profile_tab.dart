import 'package:bots_n_bids/data/profile.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import '../database.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.memberType,
  });

  final MemberType memberType;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Profile profile = Globals().currentProfile;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: kColorButton,
        image: DecorationImage(
          image: AssetImage('assets/images/judge-profile.jpg'),
          fit: BoxFit.contain,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40.0,
          right: 40.0,
          bottom: 40.0,
          top: 200.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                (profile.memberType == MemberType.Spectator)
                    ? 'Welcome Viewer!'
                    : 'Welcome Judge!',
                style: kTextHeader),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text('USERNAME:', style: kTextBody),
                const SizedBox(width: 5.0),
                Text(profile.name, style: kTextBody),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text('EMAIL:', style: kTextBody),
                const SizedBox(width: 5.0),
                Text(profile.email, style: kTextBody),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Visibility(
              visible: (widget.memberType == MemberType.Spectator),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/points.png',
                    width: 50.0,
                    height: 50.0,
                  ), // Replace with your desired icon
                  const SizedBox(
                      width:
                          8.0), // Adjust the spacing between the icon and the text
                  Text(
                    '${profile.coins}', // Convert the int variable to a String using string interpolation
                    style: kTextBody,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  title: 'Edit details',
                  onPressed: () {},
                  color: kColorButton,
                ),
                RoundedButton(
                  title: 'Sign out',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  color: kColorButton,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
