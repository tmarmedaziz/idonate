// ignore_for_file: unused_import

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Booking state
final currentStep = StateProvider((ref) => 1);
final selectedCity = StateProvider((ref) => '');



