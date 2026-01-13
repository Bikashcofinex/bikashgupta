import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'Built with Flutter Web',
            style: GoogleFonts.inter(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© 2026 Bikash Gupta. All rights reserved.',
            style: GoogleFonts.inter(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
