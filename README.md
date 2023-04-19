# rti_assignment

Assignment submission for RTI. Link to app [here]('https://drive.google.com/file/d/1SIzu9bQjrt6IpoXrqFooFb9ycm5Go-HY/view?usp=sharing')

## Summary
### State management
- Stacked [Provider]

### Util Packages
- Flutter ScreenUtil
- Flutter Hooks
- Equatable
- Logger
- UUID

### Top Folder Structure
- app
    - _app.dart
    - app.dart
    - app.locator.dart
    - app.logger.dart
    - app.router.dart
- core
    - _core.dart
    - enums
        - role_type_enum.dart
    - extensions
        - datetime_extension.dart
        - validator_extension.dart
    - models
        - employee_deletion_model.dart
        - employee_model.dart
        - failure_model.dart
- services
    - employee_service
        - employee_service.dart
        - i_employee_service.dart
    - local_storage_service
        - i_local_storage_service.dart
        - local_storage_service.dart
- ui
    - shared
        - bottom_sheets
            - role_list_sheet.dart
        - components
            - _components.dart
            - app_button.dart
            - app_loader.dart
            - app_snackbar.dart
            - app_textfield.dart
        - constants
            - _constants.dart
            - app_assets.dart
            - app_colors.dart
            - app_textstyles.dart
            - app_theme.dart
            - spacing.dart
        - dialogs
            - date_selector_dialog.dart
    - views
        - add_enployee_view
            - add_enployee_view.dart
            - add_enployee_viewmodel.dart
        - employees_list_view
            - employees_list_view.dart
            - employees_list_viewmodel.dart
- main.dart

### Tests File Structure
- employee_service_test.dart
- local_storage_service_test.dart
- mock_helper_test.dart
- mock_helper_test.mocks.dart
- widget_test.dart

### Thank you!!

