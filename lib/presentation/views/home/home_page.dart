import 'package:flutter/material.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/presentation/providers/home_provider.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider _controller;
  late Future<List<SpaceEntity>> _getSpaces;

  @override
  void initState() {
    _controller = HomeProvider();
    _getSpaces = _controller.getSpaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    return ChangeNotifierProvider(
      create: (_) => _controller,
      builder: (context, child) => FutureBuilder<List<SpaceEntity>>(
        future: _getSpaces,
        builder: (context, snapshot) {
          if (snapshot.connectionState
              case ConnectionState.done || ConnectionState.active) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final spaces = snapshot.data!;
              return ListView.builder(
                itemCount: spaces.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      spaces[index].location,
                    ),
                    onTap: () {},
                  );
                },
              );
            }

            return Center(
              child: Text(localization.noDataAvailable),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void onPressed() {
    const LoginRoute().go(context);
  }

  Future<void> onPressedSpaces() async {
    await _controller.getSpaces();
  }
}
