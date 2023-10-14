import 'package:fluster_rust/main/app.dart';
import 'package:flutter/material.dart';
import 'package:rust_in_flutter/rust_in_flutter.dart';

void main() async {
  await RustInFlutter.ensureInitialized();
  runApp(const MyApp());
}
