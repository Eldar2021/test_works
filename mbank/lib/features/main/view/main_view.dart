import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank/features/characters/characters.dart';
import 'package:mbank/features/episods/episods.dart';
import 'package:mbank/features/main/main.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with AutomaticKeepAliveClientMixin {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: context.read<MainCubit>().change,
        children: const [CharactersView(), EpisodsPage()],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (val) async {
          context.read<MainCubit>().change(val);
          await toPage(val);
        },
        selectedIndex: context.watch<MainCubit>().state,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.house), label: 'Characters'),
          NavigationDestination(icon: Icon(Icons.abc), label: 'Episods'),
        ],
      ),
    );
  }

  Future<void> toPage(int val) async {
    await controller.animateToPage(
      val,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
