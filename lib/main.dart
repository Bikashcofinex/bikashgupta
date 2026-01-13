import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/constants.dart';
import 'widgets/navbar.dart';
import 'widgets/footer.dart';
import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/projects.dart';
import 'pages/contact.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.dark);

  void _toggleTheme() {
    _themeNotifier.value = _themeNotifier.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Bikash Gupta - Portfolio',
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.backgroundDark,
            primaryColor: AppColors.primary,
            cardColor: AppColors.surfaceVariantDark, // Mapping surfaceVariant
            textTheme:
                GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
              bodyColor: AppColors.textPrimaryDark,
              displayColor: AppColors.textPrimaryDark,
            ),
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surfaceDark,
              secondary: AppColors.accent,
              onSurface: AppColors.textPrimaryDark,
              // surfaceContainer: AppColors.surfaceVariantDark, // Flutter 3.22+
            ),
          ),
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColors.backgroundLight,
            primaryColor: AppColors.primary,
            cardColor: AppColors.surfaceVariantLight, // Mapping surfaceVariant
            textTheme:
                GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
              bodyColor: AppColors.textPrimaryLight,
              displayColor: AppColors.textPrimaryLight,
            ),
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              surface: AppColors.surfaceLight,
              secondary: AppColors.accent,
              onSurface: AppColors.textPrimaryLight,
            ),
          ),
          home: MainLayout(
            onThemeToggle: _toggleTheme,
            isDarkMode: mode == ThemeMode.dark,
          ),
        );
      },
    );
  }
}

class MainLayout extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const MainLayout({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // GlobalKeys to scroll to specific sections
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  Future<void> scrollToSection(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onNavClick: (String section) {
              if (section == 'Home') scrollToSection(homeKey);
              if (section == 'About') scrollToSection(aboutKey);
              if (section == 'Projects') scrollToSection(projectsKey);
              if (section == 'Contact') scrollToSection(contactKey);
            },
            onThemeToggle: widget.onThemeToggle,
            isDarkMode: widget.isDarkMode,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomePage(key: homeKey),
                  AboutPage(key: aboutKey),
                  ProjectsPage(key: projectsKey),
                  ContactPage(key: contactKey),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
