import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:gcetjmfee_webappv2/title.dart';
import './style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:GenerateBill(),
  ));
}
class GenerateBill extends StatefulWidget {
  @override
  _GenerateBill createState() => _GenerateBill();
}

bool rollNumCheck = false;

class _GenerateBill extends State<GenerateBill> {
  String monthValue;
  String yearValue;
  String branchValue;
  String batchValue;
  String rollNum;
  final rollNumController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final monthDrop = DropdownButton<String>(
      hint: Text(
        'Select Month',
        textAlign: TextAlign.center,
      ),
      value: monthValue,
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery
            .of(context)
            .size
            .width / 130,
        fontWeight: FontWeight.bold,
      ),
      items: <DropdownMenuItem<String>>[

        getDropDownMenuItem('JAN', 'JAN'),
        getDropDownMenuItem('FEB', 'FEB'),
        getDropDownMenuItem('MAR', 'MAR'),
        getDropDownMenuItem('APR', 'APR'),
        getDropDownMenuItem('MAY', 'MAY'),
        getDropDownMenuItem('JUNE', 'JUNE'),
        getDropDownMenuItem('JULY', 'JULY'),
        getDropDownMenuItem('AUG', 'AUG'),
        getDropDownMenuItem('SEP', 'SEP'),
        getDropDownMenuItem('OCT', 'OCT'),
        getDropDownMenuItem('NOV', 'NOV'),
        getDropDownMenuItem('DEC', 'DEC'),
      ],
      onChanged: (String value) {
        setState(() {
          monthValue = value;
        });
      },
    );

    final yearDrop = DropdownButton<String>(
      hint: Text(
        'Select Year',
        textAlign: TextAlign.center,
      ),
      value: yearValue,
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery
            .of(context)
            .size
            .width / 130,
        fontWeight: FontWeight.bold,
      ),
      items: <DropdownMenuItem<String>>[
        getDropDownMenuItem('2017', '2017'),
        getDropDownMenuItem('2018', '2018'),
        getDropDownMenuItem('2019', '2019'),
        getDropDownMenuItem('2020', '2020'),
        getDropDownMenuItem('2021', '2021'),
      ],
      onChanged: (String value) {
        setState(() {
          yearValue = value;
        });
      },
    );

    final branchDrop = DropdownButton<String>(
      hint: Text(
        'Select Branch',
        textAlign: TextAlign.center,
      ),
      value: branchValue,
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery
            .of(context)
            .size
            .width / 130,
        fontWeight: FontWeight.bold,
      ),
      items: <DropdownMenuItem<String>>[
        getDropDownMenuItem('ALL', 'ALL'),
        getDropDownMenuItem('CSE', 'CSE'),
        getDropDownMenuItem('ECE', 'ECE'),
        getDropDownMenuItem('EEE', 'EEE'),
        getDropDownMenuItem('CIVIL', 'CIVIL'),
        getDropDownMenuItem('MECH', 'MECH'),
      ],
      onChanged: (String value) {
        setState(() {
          branchValue = value;
        });
      },
    );

    final batchDrop = DropdownButton<String>(
      hint: Text(
        'Select Batch',
        textAlign: TextAlign.center,
      ),
      value: batchValue,
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery
            .of(context)
            .size
            .width / 130,
        fontWeight: FontWeight.bold,
      ),
      items: <DropdownMenuItem<String>>[
        getDropDownMenuItem('ALL', 'ALL'),
        getDropDownMenuItem('2016 - 2020', '2016 - 2020'),
        getDropDownMenuItem('2017 - 2021', '2017 - 2021'),
        getDropDownMenuItem('2018 - 2022', '2018 - 2022'),
        getDropDownMenuItem('2019 - 2023', '2019 - 2023'),

      ],
      onChanged: (String value) {
        setState(() {
          batchValue = value;
        });
      },
    );

    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //title(size, 'Pending Dues', context),
              Container(
                width: size.width,
                height: size.height - size.height / 10,
                padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width / 130,
                                vertical: 0),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 7.5,
                            height: MediaQuery
                                .of(context)
                                .size
                                .width / 40,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                                border:
                                Border.all(color: Colors.black87, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                branchDrop,
                                SizedBox(
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width / 200),
                                Text(branchValue == null ? '* Select' : '',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18)),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width / 130,
                                vertical: 0),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 7.5,
                            height: MediaQuery
                                .of(context)
                                .size
                                .width / 40,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                                border:
                                Border.all(color: Colors.black87, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                batchDrop,
                                SizedBox(
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width / 200),
                                Text(batchValue == null ? '* Select' : '',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18)),
                              ],
                            ),
                          ),


                        ]
                    ),
                    SizedBox(

                      height: size.width / 200,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width / 130),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 7.5,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width / 40,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4.0)),
                              border:
                              Border.all(color: Colors.black87, width: 2)),
                          child:yearDrop,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width / 130),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 7.5,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width / 40,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4.0)),
                              border:
                              Border.all(color: Colors.black87, width: 2)),
                          child: monthDrop,
                        ),

                      ],
                    ),
                    Container(
                      height: size.height / 1.25,
                      width: size.width,
                      child: tabledetails(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  //datatable

  SingleChildScrollView tabledetails() {
    getDataColumn(String label) {
      return DataColumn(
        label: Text(
          label,
          style: Style.columnStyle,
        ),
      );
    }
    chooseStream() {
      if (batchValue == null || branchValue == null) {
        print("1");
        return null;
      } else if (batchValue == 'ALL' || branchValue == 'ALL') {
        print('2');
        return Firestore.instance
            .collectionGroup('Profile')
            .snapshots();
      }
      else if(batchValue == 'ALL' &&  branchValue !=null){
        return Firestore.instance
            .collectionGroup('Profile')
            .where('branch',isEqualTo: branchValue)
            .snapshots();
      }
      else if(branchValue == 'ALL' && batchValue != null){
        return Firestore.instance
            .collectionGroup('Profile')
            .where('batch',isEqualTo: batchValue)
            .snapshots();
      }

      else {
        return Firestore.instance
            .collectionGroup('Profile')
            .where("batch", isEqualTo: batchValue)
            .where("branch", isEqualTo: branchValue)
            .snapshots();
      }
    }

    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: chooseStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Text(
                    'Data not Found',
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ));
          }
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new PaginatedDataTable(
                header: Text('Generate Bill', style: Style.headStyle),
                columns: [
                  getDataColumn('Sl.No.'),
                  getDataColumn('Roll Number'),
                  getDataColumn('Name'),
                  getDataColumn('Number of Days Stay in Hostel'),
                  getDataColumn('Amount Per Day'),
                  getDataColumn('Amount'),
                  getDataColumn('Due Date'),
                ],
                source: DTSStuRec(snapshot.data.documents),
                rowsPerPage: 5,
              );
          }
        },
      ),
    );
    //scrollDirection: Axis.horizonta)l,
  }

  Widget getDropDownMenuItem(String text, String value) {
    return DropdownMenuItem(
      child: new Text(text),
      value: value,
    );
  }

}

class DTSStuRec extends DataTableSource{
  final List<DocumentSnapshot> d;
  String noofHSTL;
  int amount;
  String amount1;
  final controllernoofHSTL = TextEditingController();
  final controlleramount = TextEditingController();

  DTSStuRec(this.d);

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${index + 1}', style: Style.cellStyle)),
        DataCell(
          d[index]['rollNum'] == null
              ? Text('No Data')
              : Text(d[index]['rollNum'], style: Style.cellStyle),
        ),
        DataCell(
          d[index]['sName'] == null
              ? Text('No Data')
              : Text(d[index]['sName'], style: Style.cellStyle),
        ),
        DataCell(
         TextFormField(
           controller: controllernoofHSTL,
           decoration: InputDecoration(
           enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(color:Colors.black87),
             borderRadius: BorderRadius.circular(10.0)
           ),

         ),autovalidate: false,
             keyboardType: TextInputType.number,
             style: Style.cellStyle,
         onChanged: (int){

              amount1= controllernoofHSTL.text;
              print(amount1);

         },
         validator: (input){
            noofHSTL = input;
            print(input);
           return noofHSTL  == null ? "enter no of hostel" : input;

         },),
        ),
        DataCell(
          TextFormField(
            controller: controlleramount,
            decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.black87),
                borderRadius: BorderRadius.circular(10.0)
            ),

          ),autovalidate: false,
            keyboardType: TextInputType.number,
            style: Style.cellStyle,
            validator: (input){


              return amount == null ? "amount per day" : null;
            },),
        ),
        DataCell(
          Text("${noofHSTL}"),

        ),


        DataCell(
         Text("", style: Style.cellStyle),
        ),

      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => d.length;

  @override
  int get selectedRowCount => 0;
}


