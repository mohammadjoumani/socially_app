import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socially_app/core/network/api_service.dart';
import 'package:socially_app/core/network/dio_factory.dart';
import 'package:socially_app/core/services/app_prefs.dart';
import 'package:socially_app/core/services/device_info.dart';
import 'package:socially_app/core/services/network_info.dart';
import 'package:socially_app/core/utils/resource/color/dark_color.dart';
import 'package:socially_app/core/utils/resource/color/light_color.dart';
import 'package:socially_app/core/utils/resource/color/main_color.dart';
import 'package:socially_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:socially_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:socially_app/features/auth/domain/repository/auth_repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // Device Info
  instance.registerLazySingleton<DeviceInfo>(() => DeviceInfoImpl(DeviceInfoPlugin()));

  // SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // AppPreferences instance
  // final appPreferences = AppPreferences(instance());
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  final dio1 = await instance<DioFactory>().getDio();
  final dio2 = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<ApiService>(() => ApiService(dio1, dio2, instance(), instance()));

  // Color
  instance.registerLazySingleton<MainColorInterface>(() => LightColor(), instanceName: 'lightColor');
  instance.registerLazySingleton<MainColorInterface>(() => DarkColor(), instanceName: 'darkColor');
  List<MainColorInterface> colors = [
    instance(instanceName: 'lightColor'),
    instance(instanceName: 'darkColor'),
  ];
  instance.registerLazySingleton<AppColor>(() => AppColor(colors, instance()));

  // //Generic RemoteDataSource instance
  // instance.registerLazySingleton<GenericRemoteDataSource>(() => GenericRemoteDataSourceImpl(instance()));
  //
  // //Generic Repository instance
  // instance.registerLazySingleton<GenericRepository>(() => GenericRepositoryImpl(instance()));
  //
  //Auth RemoteDataSource instance
  instance.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(instance()));

  //Auth Repository instance
  instance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(instance(), instance()));
  //
  // //Networks RemoteDataSource instance
  // instance.registerLazySingleton<NetworksRemoteDataSource>(() => NetworksRemoteDataSourceImpl(instance()));
  //
  // //Auth Repository instance
  // instance.registerLazySingleton<NetworksRepository>(() => NetworksRepositoryImpl(instance(), instance()));
  //
  // //Approval RemoteDataSource instance
  // instance.registerLazySingleton<ApprovalRemoteDataSource>(() => ApprovalRemoteDataSourceImpl(instance()));
  //
  // //Approval Repository instance
  // instance.registerLazySingleton<ApprovalRepository>(() => ApprovalRepositoryImpl(instance()));
  //
  // //Policy RemoteDataSource instance
  // instance.registerLazySingleton<PolicyRemoteDataSource>(() => PolicyRemoteDataSourceImpl(instance()));
  //
  // //Policy Repository instance
  // instance.registerLazySingleton<PolicyRepository>(() => PolicyRepositoryImpl(instance()));
  //
  // //Claim RemoteDataSource instance
  // instance.registerLazySingleton<ClaimRemoteDataSource>(() => ClaimRemoteDataSourceImpl(instance()));
  //
  // //Claim Repository instance
  // instance.registerLazySingleton<ClaimRepository>(() => ClaimRepositoryImpl(instance()));
  //
  // //Reimbursement RemoteDataSource instance
  // instance.registerLazySingleton<ReimbursementRemoteDataSource>(() => ReimbursementRemoteDataSourceImpl(instance()));
  //
  // //Reimbursement Repository instance
  // instance.registerLazySingleton<ReimbursementRepository>(() => ReimbursementRepositoryImpl(instance()));
  //
  // //DrugAlarm LocalDataSource instance
  // instance.registerLazySingleton<DrugAlarmLocalDataSource>(() => DrugAlarmLocalDataSourceImpl());
  //
  // //DrugAlarm Repository instance
  // instance.registerLazySingleton<DrugAlarmRepository>(() => DrugAlarmRepositoryImpl(instance()));
  //
  // //Bank RemoteDataSource instance
  // instance.registerLazySingleton<BankRemoteDataSource>(() => BankRemoteDataSourceImpl(instance()));
  //
  // //Bank Repository instance
  // instance.registerLazySingleton<BankRepository>(() => BankRepositoryImpl(instance()));
}
