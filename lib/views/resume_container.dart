import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:josh_frank_resume/providers/resume_text_provider.dart';

class ResumeContainer extends ConsumerWidget {
  const ResumeContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String text = ref.watch(resumeTextProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}
