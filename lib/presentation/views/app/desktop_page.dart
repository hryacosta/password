import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/presentation/components/message.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:password/presentation/views/home/dialog_new_element.dart';
import 'package:password/presentation/views/home/home_page.dart';
import 'package:password/presentation/views/settings/settings_page.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    return Row(
      children: [
        NavigationRail(
          destinations: [
            NavigationRailDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: Text(localization.home),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: Text(localization.settings),
            ),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          labelType: NavigationRailLabelType.selected,
          useIndicator: true,
          leading: const Profile(),
          trailing: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          ),
          elevation: 4,
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: getTitle(),
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
                          AppLocalization.of(context).newElement,
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

  Widget getTitle() {
    final localization = AppLocalization.of(context);

    switch (_selectedIndex) {
      case 0:
        return Text(localization.home);
      case 1:
        return Text(localization.settings);
      default:
        return Text(localization.home);
    }
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addElement() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogNewElement();
      },
    );
  }

  void logout() {
    const LoginRoute().go(context);
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
