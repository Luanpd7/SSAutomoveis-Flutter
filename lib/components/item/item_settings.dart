import 'package:flutter/material.dart';

///[ItemSettings] é o filho da classe settings que
///contém os itens da ['SettingsScreen'].

class ItemSettings extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Icon? icon;
  final String? subtitle2;
  final String? label2;
  final Function()? onTap;
  final Function()? onTap2;
  final Function()? onTap3;
  final String? label;
  final bool isText;

  ItemSettings({
    required this.title,
    this.subtitle,
    this.icon,
    this.subtitle2,
    this.label,
    this.label2,
    this.onTap,
    this.onTap2,
    this.onTap3,
    this.isText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  isText
                      ? Text(
                          subtitle!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : Row(
                          children: [
                            icon!,
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              subtitle!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (label != null)
                    Text(
                      label!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
              if (label2 != null)
                GestureDetector(
                  onTap: onTap2,
                  child: Row(
                    children: [
                      Text(
                        subtitle2!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        label2!,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
