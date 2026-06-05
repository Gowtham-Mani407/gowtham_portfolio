import 'package:get_it/get_it.dart';
import 'package:gowtham_portfolio/features/contact/data/repositories/contact_repo_impl.dart';
import 'package:gowtham_portfolio/features/contact/data/repositories/contact_repository.dart';

import 'features/contact/presentation/bloc/contact_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Repository
  sl.registerLazySingleton<ContactRepository>(() => ContactRepository());
  sl.registerLazySingleton<EmailService>(() => EmailService());

  /// Bloc
  sl.registerFactory<ContactBloc>(
    () => ContactBloc(sl<ContactRepository>(), EmailService()),
  );
}
