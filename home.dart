import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(minHeight: 700), // Height of a hero section
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.padding, vertical: 50),
      child: Center(
        child: Container(
          constraints:
              const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildTextContent(context)),
                    const SizedBox(width: 50),
                    _buildProfileImage(context),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildProfileImage(context),
                    const SizedBox(height: 50),
                    _buildTextContent(context),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hi There! 👋',
          style: GoogleFonts.inter(
              fontSize: 20,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'BIKASH GUPTA',
          style: GoogleFonts.inter(
              color: AppColors.primary,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              height: 1.1),
        ),
        const SizedBox(height: 32),
        Text(
          'JUNIOR FLUTTER DEVELOPER',
          style: GoogleFonts.inter(
            fontSize: 24,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            fontWeight: FontWeight.w600,
            height: 1.1,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'UI/UX Designer turned Junior Flutter Developer with hands-on experience building and designing fintech and crypto mobile applications.',
          style: GoogleFonts.inter(
              fontSize: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              height: 1.5),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Get In Touch',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 24),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary, width: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              icon: Icon(
                Icons.download_rounded,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              label: Text('Download Resume',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium?.color)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.4),
            blurRadius: 50,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'BG',
          style: GoogleFonts.inter(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
        ),
      ), // Placeholder for actual image
    );
  }
}
