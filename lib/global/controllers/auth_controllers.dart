import 'package:flutter/foundation.dart';
import '../models/staff_model.dart';

class AuthControllers extends ChangeNotifier {
  StaffModel? _staffModel;
  StaffModel? get staffModel => _staffModel;
}
