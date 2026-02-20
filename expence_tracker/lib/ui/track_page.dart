import 'package:expence_tracker/theme/app_colors.dart';
import 'package:expence_tracker/widgets/expence.dart';
import 'package:expence_tracker/widgets/income.dart';
import 'package:flutter/material.dart';

class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.text,
                  indicator: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: [
                    Tab(text: 'Income'),
                    Tab(text: 'Expence'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [IncomeList(), ExpenceList()]),
            ),
          ],
        ),
      ),
    );
  }
}
