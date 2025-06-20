import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_dashboard_app/core/enums/bloc_status.dart';
import 'package:onboarding_dashboard_app/features/dashboard/ui/widgets/dashboard_card_item.dart';

import '../../../core/constants/assets_paths.dart';
import '../../../core/widgets/custom_back_button.dart';
import '../../../core/widgets/custom_bottom_sheet.dart';
import '../../../core/widgets/custom_circular_progress_indicator.dart';
import '../data/dashboard_item_model.dart';
import '../logic/cubits/dashboard_cubit.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;
  late final List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  initAnimations({List<DashboardItemModel> cards = const []}) {
    _controllers = List.generate(cards.length, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600 + index * 200),
      );
    });

    _slideAnimations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    }).toList();

    _fadeAnimations = _controllers.map((controller) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeIn),
      );
    }).toList();

    // Trigger animations one after another
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 300), () {
        _controllers[i].forward();
      });
    }
  }




  addCards({required List<DashboardItemModel> cards}) {
    _controllers.addAll( List.generate(cards.length, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600 + index * 200),
      );
    }));
    _slideAnimations .addAll( _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    }).toList());

    _fadeAnimations .addAll( _controllers.map((controller) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeIn),
      );
    }).toList());

    // Trigger animations one after another
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 300), () {
        _controllers[i].forward();
      });
    }
  }
  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return CustomAnimatedBottomSheet(
          title: "Contact Us",
          child: SizedBox(height: 200,),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
        create: (_) => DashboardCubit()..loadDashboardData(),
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Dashboard',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.scaffoldBackgroundColor,
              ),
            ),
        leading: CustomBackButton(),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          children: [
            const SizedBox(height: 16),
            Hero(
              tag: 'app-logo',
              child: Image.asset(
                AssetsPaths.logo,
                width: 70,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome back, Hassan!',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                if (state.status==BlocStatus.loading) {
                  return  Center(child: CustomCircularProgressIndicator());
                } else if (state.status==BlocStatus.success) {
                  // This is a List of data instead of  those that can be fetched from an API
                  final List<DashboardItemModel> cards = [
                    DashboardItemModel(title: 'Orders', icon: Icons.shopping_cart, value: '${state.orders}'),
                    DashboardItemModel(title: 'Sales', icon: Icons.monetization_on, value: '\$${state.sales}'),
                    DashboardItemModel(title: 'Messages', icon: Icons.message, value: '${state.messages}'),
                  ];
                  addCards( cards: cards);
                  return Column(
                      children: List.generate(cards.length, (index) {
                        final card = cards[index];
                        return SlideTransition(
                          position: _slideAnimations[index],
                          child: FadeTransition(
                            opacity: _fadeAnimations[index],
                            child: DashboardCardItem(dashboardItem: card,),
                          ),
                        );
                      }),
                    );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: _showBottomSheet,
        child: const Icon(Icons.call, size: 30, color: Colors.white),
      ),
    ));
  }
}

