import 'package:angle_one_task/widgets/WidgetAppBar.dart';
import 'package:flutter/material.dart';

class ScreenStockDetails extends StatelessWidget {
  var stockDetails;
  ScreenStockDetails({@required this.stockDetails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(title: 'Stock Details'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            widgetDisplayDetailsInRow(
                Row(
                  children: [
                    Text('Security code : '),
                    Text('${stockDetails['Security Code']}'),
                  ],
                ),
                Row(
                  children: [
                    Text('Security Id : '),
                    Text('${stockDetails['Security Id']}'),
                  ],
                )),
            widgetDivider(),
            widgetDisplayDetailsInRow(
                Row(
                  children: [
                    Text('Group : '),
                    Text('${stockDetails['Group']}'),
                  ],
                ),
                Row(
                  children: [
                    Text('Face Value : '),
                    Text('${stockDetails['Face Value']}'),
                  ],
                )),
            widgetDivider(),
            Row(
              children: [
                Text('Issuer Name : '),
                Text('${stockDetails['Issuer Name']}'),
              ],
            ),
            widgetDivider(),
            Row(
              children: [
                Text('Security Name : '),
                Text('${stockDetails['Security Id']}'),
              ],
            ),
            widgetDivider(),
            Row(
              children: [
                Text('ISIN No : '),
                Text('${stockDetails['ISIN No']}'),
              ],
            ),
            widgetDivider(),
            Row(
              children: [
                Text('Industry: '),
                Text('${stockDetails['Industry']}'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget widgetDivider() {
    return Divider(
      thickness: 0.6,
    );
  }

  Widget widgetDisplayDetailsInRow(
      Widget leftSideLabel, Widget rightSideLabel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Expanded(child: leftSideLabel), rightSideLabel],
    );
  }
}
