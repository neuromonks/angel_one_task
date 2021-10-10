import 'package:angle_one_task/theme/ThemeColor.dart';
import 'package:angle_one_task/widgets/WidgetAppBar.dart';
import 'package:flutter/material.dart';

class ScreenStockDetails extends StatelessWidget {
  var stockDetails;
  ScreenStockDetails({@required this.stockDetails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(
        title: 'Stock Details',
        showBackIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            widgetDisplayDetailsInRow(
                Row(
                  children: [
                    widgetLabel('Security code : '),
                    Text(
                      '${stockDetails['Security Code']}',
                      style: TextStyle(
                          color: ThemeColor.darkBlue,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    widgetLabel('Security Id : '),
                    Text(
                      '${stockDetails['Security Id']}',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
            widgetDivider(),
            widgetDisplayDetailsInRow(
                Row(
                  children: [
                    widgetLabel('Group : '),
                    Text(
                      '${stockDetails['Group']}',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    widgetLabel('Face Value : '),
                    Text('${stockDetails['Face Value']}'),
                  ],
                )),
            widgetDivider(),
            Row(
              children: [
                widgetLabel('Issuer Name : '),
                Text(
                  '${stockDetails['Issuer Name']}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            widgetDivider(),
            Row(
              children: [
                widgetLabel('Security Name : '),
                Text(
                  '${stockDetails['Security Name']}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black54),
                ),
              ],
            ),
            widgetDivider(),
            Row(
              children: [
                widgetLabel('ISIN No : '),
                Text(
                  '${stockDetails['ISIN No']}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black54),
                ),
              ],
            ),
            widgetDivider(),
            Row(
              children: [
                widgetLabel('Status : '),
                Text(
                  '${stockDetails['Status'].toString().isEmpty ? "NA" : stockDetails['Status']}',
                  style: TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            widgetDivider(),
            Row(
              children: [
                widgetLabel('Industry: '),
                Text(
                  '${stockDetails['Industry']}',
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget widgetLabel(String labelName) {
    return Text(
      '$labelName',
      style: TextStyle(color: ThemeColor.lightGrey),
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
