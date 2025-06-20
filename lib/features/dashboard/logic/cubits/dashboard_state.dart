part of 'dashboard_cubit.dart';

class DashboardState {
  final int orders;
  final double sales;
  final int messages;
  final BlocStatus status;


  DashboardState({
    this.orders= 0,
    this.sales= 0.0,
    this.messages= 0,
    this.status = BlocStatus.initial,
  });
  DashboardState copyWith({
    int? orders,
    double? sales,
    int? messages,
    BlocStatus? status,
  }) {
    return DashboardState(
      orders: orders ?? this.orders,
      sales: sales ?? this.sales,
      messages: messages ?? this.messages,
      status: status ?? this.status,
    );
  }
}
