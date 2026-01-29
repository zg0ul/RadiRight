import 'package:flutter/material.dart';
import '../../domain/models/answer_option.dart';

class AnswerOptionTile extends StatelessWidget {
  final AnswerOption option;
  final String locale;
  final VoidCallback onTap;

  const AnswerOptionTile({
    super.key,
    required this.option,
    required this.locale,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.getLocalizedText(locale),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    if (option.getLocalizedDescription(locale) != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        option.getLocalizedDescription(locale)!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.7),
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
