import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:slee_fi/presentation/screens/home/home_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, navState) {
        final navBloc = context.read<BottomNavigationBloc>();

        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedFontSize: 0.0,
                selectedFontSize: 0.0,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon:  Icon(Icons.storage, color: Colors.green,),
                    activeIcon: Icon(Icons.storage, color: AppColors.primary,),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  Icon(Icons.star, color: Colors.green,),
                    activeIcon: Icon(Icons.star, color: AppColors.primary,),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  Icon(Icons.subject, color: Colors.green,),
                    activeIcon: Icon(Icons.subject, color: AppColors.primary,),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  Icon(Icons.error, color: Colors.green,),
                    activeIcon: Icon(Icons.error, color: AppColors.primary,),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  Icon(Icons.notifications, color: Colors.green,),
                    activeIcon: Icon(Icons.notifications, color: AppColors.primary,),
                    label: '',
                  ),
                ],
                currentIndex: navState.tabIndex,
                selectedItemColor: Colors.amber[800],
                onTap: (i) {
                    navBloc.add(SelectTab(i));
                },
          ),
          body: IndexedStack(
            index: navState.tabIndex,
            children: const [
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
            ],
          ),
        );
      },
    );
  }
}
