import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:zeldesk/app/Modules/CustomerPortal/controller/customer_controller.dart';
import 'package:zeldesk/app/data/Models/complaint_model.dart';

import '../../../data/Services/firebase/fireStore_service.dart';

class CustomerDataGridSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;
  late List<ComplaintModel> complaintList;
  CustomerDataGridSource({
    required this.complaintList,
  }) {
    buildDataGridRow();
  }
  @override
  List<DataGridRow> get rows => dataGridRows;

  buildDataGridRow() {
    dataGridRows = complaintList.map<DataGridRow>((dataGrirdRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: "ID", value: dataGrirdRow.emp_id![1]),
        DataGridCell(columnName: "SUBJECT", value: dataGrirdRow.subject),
        DataGridCell(
            columnName: "DESCRIPTION", value: dataGrirdRow.description),
        DataGridCell(
            columnName: "DEPARTMENT",
            value: dataGrirdRow.department ?? "Not assigned"),
        DataGridCell(columnName: "CREATED AT", value: dataGrirdRow.created_at),
        DataGridCell(columnName: "STATUS", value: dataGrirdRow.status),
      ]);
    }).toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    throw DataGridRowAdapter(cells: [
      Container(
        child: Text(
          row.getCells()[0].toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[1].toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[2].toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[3].toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[4].toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[5].toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
    ]);
  }
}
