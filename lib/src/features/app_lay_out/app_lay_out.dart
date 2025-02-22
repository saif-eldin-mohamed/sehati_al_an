import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import '../../core/resourses/lanuages_strings.dart';
import '../../core/resourses/theming/images.dart';
import '../appointments/presentation/pages/appointments_screen.dart';
import '../appointments/presentation/pages/empty_appointments_screen.dart';
import '../home/presentation/screens/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animations/animations.dart';

import '../notification/presentation/pages/empty_notification_screen.dart';
import '../notification/presentation/pages/notification_screen.dart';
import '../search/presentation/pages/search_screen.dart';

class AppLayOut extends StatefulWidget {
  const AppLayOut({super.key});

  @override
  _AppLayOutState createState() => _AppLayOutState();
}

class _AppLayOutState extends State<AppLayOut> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AppointmentsScreen(),
    const SearchScreen(),
    const NotificationScreen(),
    const EmptyAppointmentsScreen()
  ];

  Future<void> _handleProfileNavigation() async {
    setState(() {
      _currentIndex = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 8.0,
        iconSize: 28.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        selectedItemColor: ColorsManager.primary,
        unselectedItemColor: ColorsManager.primary.withOpacity(0.3),
        currentIndex: _currentIndex,
        onTap: (index) async {
          if (index == 4) {
            await _handleProfileNavigation();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          _buildNavItem(
            label: AppStrings.home.tr(),
            icon: SvgsManager.homeSvg,
            isActive: _currentIndex == 0,
          ),
          _buildNavItem(
            label: AppStrings.appointments.tr(),
            icon: SvgsManager.appoimentSvg,
            isActive: _currentIndex == 1,
          ),
          _buildNavItem(
            label: AppStrings.search.tr(),
            icon: SvgsManager.searchSvg,
            isActive: _currentIndex == 2,
          ),
          _buildNavItem(
            label: AppStrings.notifications.tr(),
            icon: SvgsManager.notificationSvg,
            isActive: _currentIndex == 3,
          ),
          _buildNavItem(
            label: AppStrings.profile.tr(),
            icon: SvgsManager.profileSvg,
            isActive: _currentIndex == 4,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String label,
    required String icon,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 70.0.w,
        height: 50.0.h,
        padding: EdgeInsets.all(12.0.h),
        decoration: isActive
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.70, 0.71),
                  end: const Alignment(-0.7, -0.71),
                  colors: [
                    const Color(0xFF636363).withOpacity(0.12),
                    const Color(0xFFB2B2B2).withOpacity(0.12),
                    const Color(0xFFE1E1E1).withOpacity(0.12),
                  ],
                ),
                borderRadius: BorderRadius.circular(50.0.r),
              )
            : null,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          icon,
          colorFilter: isActive
              ? const ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn)
              : null,
        ),
      ),
      label: label,
    );
  }
}
