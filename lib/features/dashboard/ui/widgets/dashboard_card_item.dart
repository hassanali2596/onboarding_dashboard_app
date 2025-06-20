
import 'package:flutter/material.dart';

import '../../data/dashboard_item_model.dart';


class DashboardCardItem extends StatelessWidget {
  final DashboardItemModel dashboardItem;
  const DashboardCardItem({super.key, required this.dashboardItem});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          // Handle card tap
        },
        child: ListTile(
          leading: Icon(dashboardItem.icon, color: theme.primaryColor, size: 32),
          title: Text(dashboardItem.title, style: theme.textTheme.titleMedium),
          trailing: Text(dashboardItem.value, style: theme.textTheme.headlineSmall),
        ),
      ),
    );
  }

}