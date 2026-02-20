import 'package:expence_tracker/theme/app_colors.dart';
import 'package:expence_tracker/widgets/balance_container.dart';
import 'package:flutter/material.dart';

class IncomeList extends StatefulWidget {
  const IncomeList({super.key});

  @override
  State<IncomeList> createState() => _IncomeListState();
}

class _IncomeListState extends State<IncomeList> {
  bool selectedIndex = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: BalanceContainer(color: AppColors.primary,)),
             Expanded(child: BalanceContainer(color: AppColors.pink,)),
          ],
        ),
       
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        selectedIndex = true;
                      });
                    },
                    selected: selectedIndex,
                    selectedColor: AppColors.pink,
                    textColor: Colors.white,
                    title: Text('sample'),
                    subtitle: Text('add income'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Container(height: double.infinity,
                    width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.text,
                        
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
