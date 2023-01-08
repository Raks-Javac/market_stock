import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/services/api_servises.dart';
import '../core/utils/constants.dart';

class SeachScreen extends StatefulWidget {
  const SeachScreen({super.key});

  @override
  State<SeachScreen> createState() => _SeachScreenState();
}

class _SeachScreenState extends State<SeachScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const CupertinoSearchTextField(
          backgroundColor: Colors.grey,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.only(
                          bottom: 40, top: 20, right: 10, left: 10),
                      child: DateRangeField(
                          enabled: true,
                          initialValue: DateTimeRange(
                              start: DateTime.now(),
                              end: DateTime.now().add(const Duration(days: 5))),
                          decoration: const InputDecoration(
                            labelText: 'Date Range',
                            prefixIcon: Icon(Icons.date_range),
                            hintText: 'Please select a start and end date',
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) {
                            if (val!.start.isBefore(DateTime.now())) {
                              return 'Please enter a later start date';
                            }
                            setState(() {
                              AppConstants.startDate = val.start;
                              AppConstants.endDate = val.end;
                            });
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              AppConstants.startDate = val!.start;
                              AppConstants.endDate = val.end;
                            });
                          },
                          onSaved: (val) {
                            setState(() {
                              AppConstants.startDate = val!.start;
                              AppConstants.endDate = val.end;
                            });
                          }),
                    );
                  });
            },
            icon: const Icon(
              Icons.date_range,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstants.tickerList != null
                ? FutureBuilder(
                    future: ApiService().getEod(
                        "",
                        "${AppConstants.startDate.year}-${AppConstants.startDate.month}-${AppConstants.startDate.day}",
                        "${AppConstants.endDate.year}-${AppConstants.endDate.month}-${AppConstants.endDate.day}"),
                    builder: (context, snaphot) {
                      if (snaphot.hasData) {
                        return Column(
                          children: [
                            for (int index = 0;
                                index < AppConstants.tickerList["data"].length;
                                index++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    child: ExpansionTile(
                                  expandedAlignment: Alignment.bottomLeft,
                                  leading: Text(
                                    AppConstants.tickerList["data"][index]
                                            ["symbol"]
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  title: Text(
                                    AppConstants.tickerList["data"][index]
                                            ["name"]
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Interaday: ${AppConstants.tickerList["data"][index]["has_intraday"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "EOD: ${AppConstants.tickerList["data"][index]["has_eod"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Country: ${AppConstants.tickerList["data"][index]["country"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Interaday: ${AppConstants.tickerList["data"][index]["has_intraday"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "---------Stock Exchange--------",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Exchange Name: ${AppConstants.tickerList["data"][index]["stock_exchange"]["name"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Exchange Mic: ${AppConstants.tickerList["data"][index]["stock_exchange"]["mic"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Exchange Country: ${AppConstants.tickerList["data"][index]["stock_exchange"]["country"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Exchange City: ${AppConstants.tickerList["data"][index]["stock_exchange"]["city"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Exchange Website: ${AppConstants.tickerList["data"][index]["stock_exchange"]["website"]}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    })
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
