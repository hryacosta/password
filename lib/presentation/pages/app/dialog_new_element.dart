import 'package:flutter/material.dart';
import 'package:password/core/utils/app_localization.dart';

class DialogNewElement extends StatefulWidget {
  const DialogNewElement({super.key});

  @override
  State<DialogNewElement> createState() => _DialogNewElementState();
}

class _DialogNewElementState extends State<DialogNewElement> {
  final List<String> _elements = [
    'Login',
    'Secure Note',
    'Credit Card',
    'Identity',
    'Password',
    'Document',
    'SSH Key',
    'API Credential',
    'Bank Account',
    'Crypto Wallet',
    'Database',
    'Driver License',
    'Email Account',
    'Medical Record',
    'Membership',
    'Outdoor License',
    'Passport',
    'Reward Program',
    'Server',
    'Social Security Number',
    'Software License',
    'Wireless Router',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 600,
        height: 600,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppLocalization.of(context).addNewElement,
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _elements.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_elements[index]),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
