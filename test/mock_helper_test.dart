import 'package:mockito/annotations.dart';
import 'package:rti_assignment/app/_app.dart';
import 'package:rti_assignment/services/employee_service/i_employee_service.dart';
import 'package:rti_assignment/services/local_storage_service/i_local_storage_service.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ILocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<IEmployeeService>(onMissingStub: OnMissingStub.returnDefault),
])
void setup() {}
