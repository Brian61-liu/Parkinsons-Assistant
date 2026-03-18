import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../utils/gentle_page_route.dart';
import '../main.dart';

class LoadingScreen extends StatefulWidget {
  final Function(Locale) onLanguageChange;

  const LoadingScreen({super.key, required this.onLanguageChange});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _boot();
  }

  Future<void> _boot() async {
    try {
      await Future.wait<void>([
        Firebase.initializeApp().then((_) => null),
        Future<void>.delayed(const Duration(seconds: 3)),
      ]);
    } catch (e, s) {
      debugPrint('=== Firebase initialize FAILED: $e ===');
      debugPrint('$s');
      await Future<void>.delayed(const Duration(seconds: 3));
    }

    if (!mounted || _navigated) return;
    _navigated = true;

    Navigator.of(context).pushReplacement(
      GentlePageRoute(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AuthGate(onLanguageChange: widget.onLanguageChange),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const background = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFF4FBFF),
          Color(0xFFEAF7FF),
        ],
      ),
    );

    return const Scaffold(
      body: DecoratedBox(
        decoration: background,
        child: SafeArea(
          child: Center(
            child: _BrandLockup(),
          ),
        ),
      ),
    );
  }
}

class _BrandLockup extends StatelessWidget {
  const _BrandLockup();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _LogoPlaceholder(),
          SizedBox(height: 18),
          Text(
            'Amplio',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              color: Color(0xFF0F2942),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(
              strokeWidth: 2.6,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF14B8A6)),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoPlaceholder extends StatelessWidget {
  const _LogoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 92,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0EA5E9),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
        border: Border.all(color: const Color(0x3322C3EE), width: 1),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/icon/app_icon.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
        ),
      ),
    );
  }
}

