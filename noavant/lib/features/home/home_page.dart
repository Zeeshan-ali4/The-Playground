import "package:flutter/material.dart";
import "package:noavant/design_elements/components/my_drawer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          "Home Page",
          style: theme.textTheme.displayMedium?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),

      // Drawer
      drawer: const MyDrawer(),

      // Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Placeholder for Features or Sections
              Expanded(
                child: Center(
                  child: Text(
                    "Your features will appear here.",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
