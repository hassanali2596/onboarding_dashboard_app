import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/bloc_status.dart';
part 'dashboard_state.dart';


class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void loadDashboardData() async {
    emit(state.copyWith(status: BlocStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      status: BlocStatus.success,
      orders: 120,
      sales: 1560,
      messages: 32,
    ));
  }
}
