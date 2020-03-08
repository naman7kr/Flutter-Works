import 'package:expense_planner/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';
class Chart extends StatelessWidget {
  final List<TransactionModel> recentTransactions;
  Chart({@required this.recentTransactions});

  List<Map<String,Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0; 
      for(var i=0;i< recentTransactions.length;i++){
        if(recentTransactions[i].date.day == weekDay.day &&
         recentTransactions[i].date.month == weekDay.month &&
         recentTransactions[i].date.year == weekDay.year){
          totalSum += recentTransactions[i].amount;
        }
      }
      // print(DateFormat.E().format(weekDay).toString());
      // print(totalSum);
      return {'day': DateFormat.E().format(weekDay).substring(0,1), 'amount': totalSum};
    });
  }
  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previusValue, element) => previusValue+element['amount']);
  }
  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(children: 
        groupedTransactionValues.map((data) { 
          return ChartBar(data['day'], data['amount'], totalSpending == 0.0 ? 0.0: (data['amount'] as double) / totalSpending);
          }
        ).toList(),
      ),
    );
  }
}