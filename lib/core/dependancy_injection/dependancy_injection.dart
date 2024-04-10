import 'package:get_it/get_it.dart';

import '../../module/presentation/cubit/notes_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // home
  getIt.registerLazySingleton<NotesCubit>(() => NotesCubit());
}
