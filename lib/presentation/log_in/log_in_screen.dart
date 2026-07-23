import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('English (US)'),
              Expanded(child: Placeholder()),
              Placeholder(fallbackHeight: 56.h),
              12.verticalSpace,
              Text('Meta'),
            ],
          ),
        ),
      ),
    );
  }
}
