import "package:flutter/material.dart";

class BioBox extends StatelessWidget {
  final String text;
  final void Function()? onEdit;

  const BioBox({
    super.key,
    required this.text,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text.isNotEmpty ? text : "Add a bio to introduce yourself",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: text.isNotEmpty
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onSurface.withOpacity(0.6),
              fontStyle: text.isNotEmpty ? FontStyle.normal : FontStyle.normal,
            ),
          ),
          if (onEdit != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onEdit,
                icon: Icon(
                  Icons.edit,
                  color: theme.colorScheme.primary,
                  size: 16,
                ),
                label: Text(
                  "Edit",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
