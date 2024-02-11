import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password/presentation/features/home/home_page.dart';
import 'package:password/presentation/features/settings/settings_page.dart';

class TabletPage extends StatefulWidget {
  const TabletPage({super.key});

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  int _selectedIndex = 0;

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
        return CupertinoAlertDialog(
          title: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                controller: controller,
                hintText: 'Search',
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
                // trailing: <Widget>[
                //   Tooltip(
                //     message: 'Change brightness mode',
                //     child: IconButton(
                //       isSelected: isDark,
                //       onPressed: () {
                //         setState(() {
                //           isDark = !isDark;
                //         });
                //       },
                //       icon: const Icon(Icons.wb_sunny_outlined),
                //       selectedIcon: const Icon(Icons.brightness_2_outlined),
                //     ),
                //   ),
                // ],
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
          content: const Text('You are in the football universe!'),
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
