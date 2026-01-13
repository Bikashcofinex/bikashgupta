import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('About Me'),
              const SizedBox(height: 40),
              Text(
                'UI/UX Designer turned Junior Flutter Developer with hands-on experience building and designing fintech and crypto mobile applications. Adept at translating UX designs into high-performance, secure, and scalable mobile experiences in fast-paced startup environments.',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    height: 1.6),
              ),
              const SizedBox(height: 60),
              _buildSectionTitle('Skills'),
              const SizedBox(height: 30),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildSkillChip(context, 'Flutter'),
                  _buildSkillChip(context, 'Dart'),
                  _buildSkillChip(context, 'Dio'),
                  _buildSkillChip(context, 'REST API'),
                  _buildSkillChip(context, 'GraphQL'),
                  _buildSkillChip(context, 'Firebase'),
                  _buildSkillChip(context, 'Keycloak'),
                  _buildSkillChip(context, 'Postman'),
                  _buildSkillChip(context, 'State Management'),
                  _buildSkillChip(context, 'UI/UX Design'),
                ],
              ),
              const SizedBox(height: 60),
              _buildSectionTitle('Experience'),
              const SizedBox(height: 30),
              _buildExperienceCard(
                context,
                'Junior Flutter Developer',
                'Fintech/Crypto Startup',
                'Experience',
                'Designed and developed complex modules including trading screens, asset wallets, AI trading bot interfaces, crypto baskets, and co-pay card features.',
              ),
              const SizedBox(height: 20),
              _buildExperienceCard(
                context,
                'B.Tech in CSE (Honors)',
                'University',
                'Graduation',
                'GPA: 8.6/10.0. Ranked in the top 10% of the class. Strong background in Computer Science fundamentals.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(width: 60, height: 4, color: AppColors.primary),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, String role, String company,
      String date, String desc) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle),
            child: const Icon(Icons.work, color: AppColors.primary),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(role,
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('$company • $date',
                    style: GoogleFonts.inter(
                        color: AppColors.primary, fontSize: 14)),
                const SizedBox(height: 12),
                Text(desc,
                    style: GoogleFonts.inter(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                        height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
