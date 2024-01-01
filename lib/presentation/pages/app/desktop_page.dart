import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password/presentation/pages/home/home_page.dart';
import 'package:password/presentation/pages/settings/settings_page.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  int _selectedIndex = 0;
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
    return Row(
      children: [
        NavigationRail(
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          labelType: NavigationRailLabelType.selected,
          useIndicator: true,
          leading: const Profile(),
          elevation: 4,
        ),
        // const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.info_sharp),
                  onPressed: () {},
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: addElement,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, size: 16, color: Colors.white),
                        const SizedBox(width: 2),
                        Text(
                          'Nuevo elemento',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: Builder(
              builder: (context) {
                switch (_selectedIndex) {
                  case 0:
                    return const HomePage();
                  case 1:
                    return const SettingsPage();
                  default:
                    return const HomePage();
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addElement() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 600,
            height: 600,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                const Text('Add new element'),
                const Divider(),
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
      },
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 22,
          child: Icon(Icons.person),
        ),
        SizedBox(height: 8),
        Text('John Doe'),
      ],
    );
  }
}
