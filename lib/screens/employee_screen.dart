import 'package:demo_get_req_getx/controllers/employee_details.dart';
import 'package:demo_get_req_getx/models/emp_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeScreen extends StatefulWidget {
  EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final EmployeeDetailsController ec = EmployeeDetailsController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: ec.getEmpDetails(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: Image.network('${snapshot.data[0].imageUrl}'),
                  title: Text(snapshot.data[index].firstName),
                  subtitle: Text(snapshot.data[index].lastName),
                  contentPadding: EdgeInsets.only(bottom: 20.0),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
