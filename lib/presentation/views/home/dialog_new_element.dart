import 'package:flutter/material.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/presentation/views/home/option_icon.dart';

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
    final localization = AppLocalization.of(context);

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
                        hintText: localization.addNewElement,
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: pop,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  bottom: 24,
                  right: 24,
                  top: 8,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(2),
                  childAspectRatio: 4,
                  children: _elements
                      .map<Widget>(
                        (String element) => OptionIcon(title: element),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pop() {
    Navigator.of(context).pop();
  }

  void onTap() {
    // final localization = AppLocalization.of(context);
    pop();
    // showDialog<void>(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return Dialog(
    //       child: SizedBox(
    //         width: 600,
    //         height: 600,
    //         child: Scaffold(
    //           appBar: AppBar(
    //             title: const Text('New Element'),
    //             leading: IconButton(
    //               icon: const Icon(Icons.arrow_back),
    //               onPressed: addNewElement,
    //             ),
    //             actions: [
    //               IconButton(
    //                 icon: const Icon(Icons.close),
    //                 onPressed: pop,
    //               ),
    //             ],
    //           ),
    //           body: Center(
    //             child: Text(localization.newElement),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  void addNewElement() {
    pop();
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogNewElement();
      },
    );
  }
}
