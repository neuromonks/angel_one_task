import 'package:angle_one_task/helper/HelperFunction.dart';
import 'package:angle_one_task/modules/stocks/ScreenStockDetails.dart';
import 'package:angle_one_task/theme/ThemeColor.dart';
import 'package:angle_one_task/theme/ThemeProgressIndicator.dart';
import 'package:angle_one_task/widgets/WidgetAppBar.dart';
import 'package:angle_one_task/widgets/WidgetError.dart';
import 'package:angle_one_task/widgets/WidgetNoDataFound.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:page_transition/page_transition.dart';

class ScreenDisplayAllStocks extends StatefulWidget {
  @override
  _ScreenDisplayAllStocksState createState() => _ScreenDisplayAllStocksState();
}

class _ScreenDisplayAllStocksState extends State<ScreenDisplayAllStocks> {
  static const _pageSize = 10;
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      getAllSupportTickets(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(title: 'Stocks'),
      body: Column(
        children: [
          Expanded(
            child: PagedListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              builderDelegate: PagedChildBuilderDelegate(
                  firstPageProgressIndicatorBuilder: (context) => Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      child: Center(child: ThemeProgressIndicator.spinKit)),
                  newPageProgressIndicatorBuilder: (context) => Container(
                        child: Center(
                          child: ThemeProgressIndicator.spinKit,
                        ),
                      ),
                  firstPageErrorIndicatorBuilder: (context) => Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 2.7),
                      child: WidgetError()),
                  newPageErrorIndicatorBuilder: (context) =>
                      Center(child: WidgetError()),
                  noItemsFoundIndicatorBuilder: (context) => Container(
                          child: WidgetNoDataFound(
                        title: 'No support tickets found',
                      )),
                  itemBuilder: (context, item, index) {
                    return widgetDisplayTicketDetails(item);
                  }),
              pagingController: _pagingController,
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetDisplayTicketDetails(var item) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: ScreenStockDetails(stockDetails: item),
                type: HelperFunction.pageTransitionType()));
      },
      child: Card(
        margin: EdgeInsets.only(top: 10),
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: widgetDisplayDetailsInRow(
                    Row(
                      children: [
                        Text(
                          'Security code : ',
                          style: TextStyle(color: ThemeColor.lightGrey),
                        ),
                        Text('${item['Security Code']}'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text(
                            'Security Id : ',
                            style: TextStyle(color: ThemeColor.lightGrey),
                          ),
                          Text('${item['Security Id']}'),
                        ],
                      ),
                    )),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ThemeColor.greyIcon,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetDisplayDetailsInRow(
      Widget leftSideLabel, Widget rightSideLabel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [leftSideLabel, rightSideLabel],
    );
  }

  getAllSupportTickets(int pageKey) async {
    try {
      final String responseData =
          await rootBundle.loadString('assets/stocks-list.json');
      var response = await json.decode(responseData);
      List newItems = [];
      newItems = response;
      if (response != null) {
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      } else {
        _pagingController.error = "null";
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
