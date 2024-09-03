import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactBottomSheet extends StatefulWidget {
  const ContactBottomSheet({super.key});

  @override
  State<ContactBottomSheet> createState() => _ContactBottomSheetState();
}

makeCall(String phone) async {
  var url = 'tel:$phone';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

sendMail(String mail) async {
  var url = 'mailto:$mail';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

sendSMS(String phone) async {
  var url = 'sms:$phone';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

hexColor(String colorhexcode) {
  String colornew = '0xff$colorhexcode';
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;
}

class _ContactBottomSheetState extends State<ContactBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        contactCard(
            text: '+233 505 272 375',
            onTap: () {
              makeCall('+233 505 272 375');
            },
            icon: const Icon(Icons.phone)),
        contactCard(
            text: '+233 539 424 541',
            onTap: () {
              sendSMS('+233 539 424 541');
            },
            icon: const Icon(Icons.chat)),
        contactCard(
            text: 'iniunamid@gmail.com',
            onTap: () {
              sendMail('iniunamid@gmail.com');
            },
            icon: const Icon(Icons.mail)),
      ],
    );
  }

  Widget contactCard(
      {required String text, required VoidCallback onTap, required Icon icon}) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Card(
        shadowColor: Colors.black,
        color: Colors.grey.shade200,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: icon,
          iconColor: Colors.black,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Figtree',
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
