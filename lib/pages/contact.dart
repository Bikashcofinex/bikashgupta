import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(
          vertical: 80, horizontal: AppConstants.padding),
      child: Center(
        child: Container(
          constraints:
              const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              Text('Get In Touch',
                  style: GoogleFonts.inter(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(
                'Have a project in mind or just want to say hi? I\'d love to hear from you.',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo(context)),
                        const SizedBox(width: 60),
                        Expanded(child: _buildContactForm(context)),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildContactInfo(context),
                        const SizedBox(height: 60),
                        _buildContactForm(context),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoItem(context, Icons.email, 'Email', 'bikashgupta849@gmail.com'),
        const SizedBox(height: 32),
        _infoItem(context, Icons.phone, 'Phone', '+91 8274916364'),
        const SizedBox(height: 32),
        _infoItem(context, Icons.location_on, 'Location', 'India'),
        const SizedBox(height: 32),
        _infoItem(context, Icons.link, 'LinkedIn',
            'linkedin.com/in/bikash-gupta-a21899186/'),
      ],
    );
  }

  Widget _infoItem(
      BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                )),
            const SizedBox(height: 4),
            Text(value,
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _textField(context, 'Name'),
          const SizedBox(height: 24),
          _textField(context, 'Email'),
          const SizedBox(height: 24),
          _textField(context, 'Message', maxLines: 4),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Send Message',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(BuildContext context, String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
        ),
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
