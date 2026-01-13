import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: 80, horizontal: AppConstants.padding),
      child: Center(
        child: Container(
          constraints:
              const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Projects',
                style: GoogleFonts.inter(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(width: 60, height: 4, color: AppColors.primary),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  // Simple responsive grid logic
                  int crossAxisCount = constraints.maxWidth > 900
                      ? 3
                      : constraints.maxWidth > 600
                          ? 2
                          : 1;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.8, // Taller cards
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: 6, // Dummy count
                    itemBuilder: (context, index) {
                      return const ProjectCard(
                        title: 'Portfolio Website',
                        description:
                            'A modern, responsive portfolio website built with Flutter Web.',
                        techStack: ['Flutter', 'Dart', 'Web'],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translate(0.0, _isHovering ? -10.0 : 0.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: _isHovering
              ? Border.all(color: AppColors.primary, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          boxShadow: _isHovering
              ? [
                  BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10)),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(14)),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).cardColor
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Center(
                  child: Icon(Icons.code,
                      size: 64, color: AppColors.primary.withOpacity(0.5)),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: GoogleFonts.inter(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          fontSize: 14,
                          height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.techStack.map((tech) {
                        return Text(
                          '#$tech',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: AppColors.primary),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
