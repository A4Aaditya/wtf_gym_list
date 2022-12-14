import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/location_setting_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/widget/chanage_location_sheet.dart';
import 'package:wtf_gym_list/presentation/dashboard/widget/gym_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: const Icon(
          Icons.map,
          color: Colors.black,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () => _changeLocation(context),
          child: BlocBuilder<LocationSettingBloc, LocationSettingState>(
            builder: (context, state) {
              if (state is UserLocationSetting) {
                return Text(
                  state.friendlyText,
                  style: const TextStyle(color: Colors.black),
                );
              } else {
                return const Text(
                  'Select Location',
                  style: TextStyle(color: Colors.black),
                );
              }
            },
          ),
        ),
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardLoaded) {
            return DisplayGymList(gyms: state.gyms);
          } else if (state is DashboardError) {
            return Center(child: Text(state.message));
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () => _changeLocation(context),
                child: const Text('Please Select a location'),
              ),
            );
          }
        },
      ),
    );
  }

  void _changeLocation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return const ChangeLocationSheet();
      },
    );
  }
}
