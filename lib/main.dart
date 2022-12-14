import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/data/network/i_city_repository.dart';
import 'package:wtf_gym_list/data/network/i_gym_repository.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/city_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/location_setting_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/dashboard_screen.dart';
import 'package:wtf_gym_list/presentation/utils/bloc_observor.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationSettingBloc(),
        ),
        BlocProvider(
          create: (context) => DashboardBloc(repository: IGymRepository()),
        ),
        BlocProvider(
          create: (context) => CityBloc(
            repository: ICityRepository(),
          )..add(FetchCity()),
        ),
      ],
      child: MaterialApp(
        title: 'WTF Gym List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
