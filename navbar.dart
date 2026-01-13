import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavClick;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const NavBar({
    super.key,
    required this.onNavClick,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context)
          .scaffoldBackgroundColor
          .withOpacity(0.9), // Glassmorphism-ish
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bikash Gupta',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          if (MediaQuery.of(context).size.width > 800)
            _DesktopNav(
              onNavClick: onNavClick,
              onThemeToggle: onThemeToggle,
              isDarkMode: isDarkMode,
            )
          else
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  onPressed: onThemeToggle,
                ),
                IconButton(
                  icon: Icon(Icons.menu,
                      color: Theme.of(context).textTheme.bodyMedium?.color),
                  onPressed: () {
                    // TODO: Open Drawer or Show Menu
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _DesktopNav extends StatelessWidget {
  final Function(String) onNavClick;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const _DesktopNav({
    required this.onNavClick,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavItem(title: 'Home', onTap: () => onNavClick('Home')),
        _NavItem(title: 'About', onTap: () => onNavClick('About')),
        _NavItem(title: 'Projects', onTap: () => onNavClick('Projects')),
        _NavItem(title: 'Contact', onTap: () => onNavClick('Contact')),
        const SizedBox(width: 16),
        IconButton(
          onPressed: onThemeToggle,
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.title,
            style: GoogleFonts.inter(
              color: _isHovering
                  ? AppColors.primary
                  : Theme.of(context).textTheme.bodyMedium?.color,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
