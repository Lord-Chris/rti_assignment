import 'package:stacked/stacked.dart';

import '../../../app/_app.dart';

class AddEmployeeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void onCancelTap() {
    _navigationService.back();
  }

  void onSaveTap() {}
}
