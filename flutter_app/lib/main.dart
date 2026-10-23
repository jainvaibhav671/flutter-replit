import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterStarterApp());
}

class FlutterStarterApp extends StatefulWidget {
  const FlutterStarterApp({super.key});

  @override
  State<FlutterStarterApp> createState() => _FlutterStarterAppState();
}

class _FlutterStarterAppState extends State<FlutterStarterApp> {
  var _isDark = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF5265E8),
      brightness: _isDark ? Brightness.dark : Brightness.light,
    );

    return MaterialApp(
      title: 'Flutter Starter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
        ),
      ),
      home: StarterHomePage(
        isDark: _isDark,
        onThemeChanged: (value) => setState(() => _isDark = value),
      ),
    );
  }
}

class StarterHomePage extends StatefulWidget {
  const StarterHomePage({
    required this.isDark,
    required this.onThemeChanged,
    super.key,
  });

  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  @override
  State<StarterHomePage> createState() => _StarterHomePageState();
}

class _StarterHomePageState extends State<StarterHomePage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 760;

            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 48 : 22,
                  vertical: 24,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1040),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TopBar(
                        isDark: widget.isDark,
                        onThemeChanged: widget.onThemeChanged,
                      ),
                      const SizedBox(height: 48),
                      _IntroSection(isWide: isWide),
                      const SizedBox(height: 30),
                      _CounterCard(
                        count: _count,
                        onIncrement: () => setState(() => _count += 1),
                        onDecrement: () {
                          if (_count > 0) setState(() => _count -= 1);
                        },
                        onReset: () => setState(() => _count = 0),
                      ),
                      const SizedBox(height: 34),
                      Text(
                        'A good place to begin',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.4,
                            ),
                      ),
                      const SizedBox(height: 14),
                      _StarterSteps(isWide: isWide, colors: colors),
                      const SizedBox(height: 32),
                      Center(
                        child: Text(
                          'Made with Flutter',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.isDark,
    required this.onThemeChanged,
  });

  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(Icons.flutter_dash, color: colors.onPrimary, size: 25),
        ),
        const SizedBox(width: 12),
        Text(
          'Flutter Starter',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const Spacer(),
        IconButton(
          tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
          onPressed: () => onThemeChanged(!isDark),
          icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
        ),
      ],
    );
  }
}

class _IntroSection extends StatelessWidget {
  const _IntroSection({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            'YOUR NEXT IDEA STARTS HERE',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.onPrimaryContainer,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.05,
                ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Start with a\nstrong foundation.',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.05,
                letterSpacing: -1.5,
              ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 490),
          child: Text(
            'Your Flutter app is ready to shape. Explore the live counter below, '
            'then make this space your own.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.55,
                ),
          ),
        ),
      ],
    );

    final illustration = Container(
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.primary,
            Color.lerp(colors.primary, const Color(0xFF9A6BEE), 0.58)!,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            top: -40,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 22,
            child: Icon(
              Icons.flutter_dash,
              size: 130,
              color: Colors.white.withValues(alpha: 0.94),
            ),
          ),
          Positioned(
            right: 22,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'BUILT FOR\nWHAT’S NEXT',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        height: 1.15,
                        letterSpacing: 0.5,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'One codebase. Your idea.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.82),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (!isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          copy,
          const SizedBox(height: 26),
          illustration,
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: copy),
        const SizedBox(width: 42),
        Expanded(child: illustration),
      ],
    );
  }
}

class _CounterCard extends StatelessWidget {
  const _CounterCard({
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
  });

  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: colors.outlineVariant.withValues(alpha: 0.55)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.secondaryContainer,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(Icons.touch_app_outlined, color: colors.onSecondaryContainer),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Live counter',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        'A small example of interactive app state',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Reset counter',
                  onPressed: onReset,
                  icon: const Icon(Icons.restart_alt),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 180),
                        transitionBuilder: (child, animation) => ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                        child: Text(
                          '$count',
                          key: ValueKey(count),
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -1.5,
                                color: colors.primary,
                              ),
                        ),
                      ),
                      Text(
                        count == 1 ? 'tap recorded' : 'taps recorded',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton.filledTonal(
                  tooltip: 'Subtract one',
                  onPressed: count == 0 ? null : onDecrement,
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                FilledButton.icon(
                  onPressed: onIncrement,
                  icon: const Icon(Icons.add),
                  label: const Text('Add one'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StarterSteps extends StatelessWidget {
  const _StarterSteps({required this.isWide, required this.colors});

  final bool isWide;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.palette_outlined, 'Make it yours', 'Adjust the theme and app name.'),
      (Icons.dashboard_customize_outlined, 'Add a screen', 'Build your first feature.'),
      (Icons.devices_outlined, 'Run anywhere', 'Continue on web, Android, or iOS.'),
    ];

    final cards = items.map((item) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.outlineVariant.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(item.$1, color: colors.primary),
              const SizedBox(height: 13),
              Text(
                item.$2,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                item.$3,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.4,
                    ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    if (isWide) {
      return Row(
        children: [
          cards[0],
          const SizedBox(width: 12),
          cards[1],
          const SizedBox(width: 12),
          cards[2],
        ],
      );
    }

    return Column(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          _StepCard(item: items[i], colors: colors),
          if (i != items.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.item, required this.colors});

  final (IconData, String, String) item;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Icon(item.$1, color: colors.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.$2,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.$3,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_rounded, size: 18, color: colors.onSurfaceVariant),
        ],
      ),
    );
  }
}
