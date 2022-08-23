// import 'package:flutter/material.dart';
import 'package:flutter_appwire/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthState());
