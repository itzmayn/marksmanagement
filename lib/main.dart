
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic index=0;

  @override
  void initState() {
    // TODO: implement initState
    if(theback["studentClasses"]==null){
      theback["studentClasses"] ={
        "class 1":[
          {'name': 'Liam', 'grade': 90.0},
          {'name': 'Emma', 'grade': 85.5},
          {'name': 'Noah', 'grade': 88.0},
          {'name': 'Olivia', 'grade': 85.5},
          {'name': 'Aiden', 'grade': 86.5},
          {'name': 'Ava', 'grade': 92.0},
          {'name': 'Ethan', 'grade': 87.0},
          {'name': 'Sophia', 'grade': 84.0},
        ],

      };
      theback["studentClasses"]=json.decode(json.encode(theback["studentClasses"]));
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Positioned(
              top: 0.0,bottom: 0.0,left: 0.0,right: 0.0,
              child: Image.network('https://images.pexels.com/photos/256417/pexels-photo-256417.jpeg',fit: BoxFit.cover)
          ),
          Positioned(
              top: 0.0,bottom: 0.0,left: 0.0,right: 0.0,
              child: Container(color: Colors.black.withOpacity(0.7),)
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                'Evaluate Grades for Students',

                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 48, 0, 151),
                  fontFamily: 'Roboto',
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 34, 216, 140),
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],

                ),
              ),

              backgroundColor: Colors.blueGrey,
              centerTitle: true,
              elevation: 8,
              toolbarHeight: 80,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        index = 2;
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("Home"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        index = 0;
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("Login"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        index = 1;
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("Register"),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        index = 0;
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("Exit"),
                    ),
                  ),
                ),
              ],

            ),
            body: IndexedStack(
              index: index,
              children: [
                LoginPage(),
                ReisterPage(),
                const StudentInputForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudentInputForm extends StatefulWidget {
  const StudentInputForm({super.key});

  @override
  StudentInputFormState createState() => StudentInputFormState();
}

class StudentInputFormState extends State<StudentInputForm> {
  Map allStudentsLists=theback['studentClasses'];
  dynamic allStudents;


  dynamic selectedStudents = [];
  dynamic studentGradeStudents = [];







  bool isChecked=false;
  dynamic currentClass="";
  void toggleSelectAll(bool? checked) {

    setState(() {

      isChecked=checked!;
      if (isChecked) {
        selectedStudents = allStudents!.map((student) => student['name']).toList();
      } else {
        selectedStudents.clear();
      }


    });

  }

  theDia(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Row(
          children: [
            Builder(
                builder: (context) {
                  return Card(
                    color: Colors.white.withOpacity(0.8),
                    child: SizedBox(
                      width: 400.0,
                      height: 150.0,
                      child: Row(
                        children: [

                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: const Text(
                                    'Grade:',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),

                                Expanded(
                                  child: Text(
                                    studentGrade==null
                                        ? 'Not Selected'
                                        : '${studentGrade.toString()}%',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),


                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Students:',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),

                                Expanded(
                                  child: ListView.builder(
                                    itemCount: studentGradeStudents.length,
                                    itemBuilder: (context, index) {

                                      return ListTile(
                                        title: Center(child: Text(studentGradeStudents[index])),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      );
    });
  }
  void findHighestGradeStudents() {
    dynamic grade() {
      List<Map<String, dynamic>> sortedStudents =
      List<Map<String, dynamic>>.from(allStudents)
        ..sort((a, b) => a['grade'].compareTo(b['grade']));

      double? _grade;

      for (int i = sortedStudents.length - 1; i >= 0; i--) {
        if (selectedStudents.contains(sortedStudents[i]['name'])) {
          _grade = sortedStudents[i]["grade"];
          break;
        }
      }

      return _grade;


    }
    dynamic _gradeStudents(dynamic selectedStudents) {
      studentGrade = grade();

      dynamic studentGradeStudents = [];
      for (var student in allStudents!) {
        if (student['grade'] == studentGrade && selectedStudents.contains(student['name'])) {
          studentGradeStudents.add(student['name']);
        }
      }

      return studentGradeStudents;
    }
    dynamic result = _gradeStudents(selectedStudents);
    setState(() {
      studentGradeStudents = result;
    });
    theDia();
  }

  void findLowestGradeStudents() {
    dynamic gradeGrade(){
      List<Map<String, dynamic>> sortedStudents =
      List<Map<String, dynamic>>.from(allStudents)
        ..sort((a, b) => a['grade'].compareTo(b['grade']));

      double? _grade;

      for (int i = 0; i < sortedStudents.length; i++) {
        if (selectedStudents.contains(sortedStudents[i]['name'])) {
          _grade = sortedStudents[i]["grade"];
          break;
        }
      }

      return _grade;
    }

    dynamic _gradeStudents(dynamic selectedStudents) {
      studentGrade = gradeGrade();

      dynamic studentGradeStudents = [];
      for (var student in allStudents!) {
        if (student['grade'] == studentGrade && selectedStudents.contains(student['name'])) {
          studentGradeStudents.add(student['name']);
        }
      }

      return studentGradeStudents;
    }
    dynamic result = _gradeStudents(selectedStudents);
    setState(() {
      studentGradeStudents = result;
    });
    theDia();
  }

  void averageGradeStudents() {
    double? averageGrade() {
      List<Map<String, dynamic>> sortedStudents =
      List<Map<String, dynamic>>.from(allStudents)
        ..sort((a, b) => a['grade'].compareTo(b['grade']));

      dynamic totalGrade = 0;
      int selectedCount = 0;

      for (int i = 0; i < sortedStudents.length; i++) {
        if (selectedStudents.contains(sortedStudents[i]['name'])) {
          totalGrade += sortedStudents[i]['grade'];
          selectedCount++;
        }
      }

      if (selectedCount > 0) {
        double average = totalGrade! / selectedCount;
        return average;
      } else {
        return null; // Return null if no selected students were found
      }
    }


    dynamic _gradeStudents(dynamic selectedStudents) {
      studentGrade = averageGrade();

      dynamic studentGradeStudents = [];
      for (var student in allStudents!) {
        if (student['grade'] == studentGrade && selectedStudents.contains(student['name'])) {
          studentGradeStudents.add(student['name']);
        }
      }

      return studentGradeStudents;
    }
    dynamic result = _gradeStudents(selectedStudents);
    setState(() {
      studentGradeStudents = result;
    });
    theDia();
  }


  void medianeGradeStudents() {
    double? medianGrade() {
      List<Map<String, dynamic>> sortedStudents =
      List<Map<String, dynamic>>.from(allStudents)
        ..sort((a, b) => a['grade'].compareTo(b['grade']));

      List<double> selectedGrades = [];

      for (int i = 0; i < sortedStudents.length; i++) {
        if (selectedStudents.contains(sortedStudents[i]['name'])) {
          selectedGrades.add(sortedStudents[i]['grade']);
        }
      }

      selectedGrades.sort();

      int count = selectedGrades.length;
      if (count == 0) {
        return null; // Return null if no selected students were found
      }

      if (count % 2 != 0) {
        // For odd number of elements, median is the middle element
        return selectedGrades[count ~/ 2];
      } else {
        // For even number of elements, median is the average of two middle elements
        double firstMiddle = selectedGrades[(count ~/ 2) - 1];
        double secondMiddle = selectedGrades[count ~/ 2];
        return (firstMiddle + secondMiddle) / 2;
      }
    }


    dynamic _gradeStudents(dynamic selectedStudents) {
      studentGrade = medianGrade();

      dynamic studentGradeStudents = [];
      for (var student in allStudents!) {
        if (student['grade'] == studentGrade && selectedStudents.contains(student['name'])) {
          studentGradeStudents.add(student['name']);
        }
      }

      return studentGradeStudents;
    }
    dynamic result = _gradeStudents(selectedStudents);
    setState(() {
      studentGradeStudents = result;
    });
    theDia();
  }

  double? studentGrade;

  bool reseting=false;
  @override
  void initState() {
    // TODO: implement initState
    if(allStudents==null) {
      currentClass="class 1";
      allStudents = allStudentsLists[currentClass];

    }

    valGlobal["setState"]=setState;
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds:5 ), () {
      if(reseting){
        setState(() {
          reseting=false;
        });
      }
    });

    if(reseting){
      return Center(
        child: Card(
          child: Container(
            height: 100.0,
            width:100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularProgressIndicator(),
                Text("Loading...")
              ],
            ),
          ),
        ),
      );
    }

    return Builder(
        builder: (context) {
          return Column(
            children: [

              const SizedBox(height: 16),
              Row(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: Checkbox(
                              value: isChecked,
                              onChanged: toggleSelectAll,
                              fillColor:MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0))
                          ),
                        ),
                        const Text(
                          'All',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 76, 0, 255))),
                            onPressed: findHighestGradeStudents,
                            child:  Text('Find Highest',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 76, 0, 255))),
                            onPressed:findLowestGradeStudents,
                            child:  Text('Find Lowest',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 76, 0, 255))),
                            onPressed:averageGradeStudents,
                            child:  Text('Find Average',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 76, 0, 255))),
                            onPressed:medianeGradeStudents,
                            child:  Text('Find Median',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Expanded(child: addClass()),
                  Card(
                    child: IconButton(icon:Icon(Icons.refresh),onPressed: (){
                      setState(() {
                        reseting=true;
                      });
                    },),
                  ),
                ],
              ),
              SizedBox(
                height: 66.0,
                width: MediaQuery.of(context).size.width*1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListView.builder(
                      itemCount: allStudentsLists.keys.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: ElevatedButton(onPressed: (){

                          }, child: Row(
                            children: [
                              Builder(
                                  builder: (context) {

                                    dynamic ch=false;
                                    if(currentClass==allStudentsLists.keys.toList()[index]){
                                      ch=true;
                                    }
                                    return Checkbox(
                                      value:ch ,
                                      onChanged: (isChecked) {
                                        setState(() {
                                          toggleSelectAll(false);
                                          currentClass=allStudentsLists.keys.toList()[index];
                                          print(allStudentsLists.keys.toList()[index]);
                                          // print(allStudentsLists.toString());
                                          allStudents = allStudentsLists[currentClass];
                                        });

                                      },
                                    );
                                  }
                              ),
                              Text("${allStudentsLists.keys.toList()[index]}"),
                            ],
                          )),
                        );
                      }
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: allStudents!.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: Future.delayed(Duration(milliseconds: index * 100), () => allStudents![index]),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                                return Container(); // Return empty container while waiting for data
                              }

                              dynamic student = snapshot.data;

                              return Card(
                                elevation: 2,
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                color: Color.fromARGB(221, 0, 0, 0),
                                child: ListTile(
                                  leading: Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.white,
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    child: Checkbox(
                                      value: selectedStudents.contains(student['name']),
                                      onChanged: (isChecked) {
                                        setState(() {
                                          if (isChecked != null) {
                                            if (isChecked) {
                                              selectedStudents.add(student['name']);
                                            } else {
                                              selectedStudents.remove(student['name']);
                                            }
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        student['name'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${student['grade'].toString()}%",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 0, 255, 242),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(child: Graphs(selectedStudents,allStudentsLists,currentClass))
                  ],
                ),
              ),

              const SizedBox(height: 10),


            ],
          );
        }
    );
  }
}

dynamic theback={};
addClass(){

  List currentSet=[];
  dynamic className="";
  return StatefulBuilder(
      builder: (context,states) {
        return ElevatedButton( onPressed: () {
          showDialog(context:context, builder:(BuildContext context){
            return  StatefulBuilder(
                builder: (context,state) {
                  return AlertDialog(

                    content:  Container(
                      height: 600.0,width: 600.0,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 60.0,
                                child: Row(children: [
                                  const Text("Clase Name"),
                                  Expanded(
                                    child: TextFormField(controller:
                                    TextEditingController(text:className, ),
                                      onChanged: (t){
                                        className=t;

                                      },),
                                  )
                                ],),
                              ),
                              Container(
                                height: 60.0,
                                child: Row(
                                  children: [

                                    const Text("Adding values"),
                                    ElevatedButton( onPressed: () {

                                      dynamic newCheck=currentSet.where((element) => element['name'].length==0&&element['grade'].length==0);
                                      if(newCheck.length==0){

                                        currentSet.add({"name":"","grade":""});

                                      }else{
                                        SnackBar(content: Text("First update your newest entry"));
                                      }

                                      state((){});
                                    },
                                        child: Text("Add students")),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  for(var item in currentSet)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          height: 55.0,
                                          child: const Row(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('Name',), Text('Grade',)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 66.0,
                                          child: Row(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: TextFormField(controller:
                                                TextEditingController(text:item['name'], ),
                                                  onChanged: (t){
                                                    item['name']=t;

                                                  },),
                                              ),
                                              Expanded(
                                                child: TextFormField(controller:
                                                TextEditingController(text:item['grade'] ),
                                                  onChanged: (g){
                                                    try{
                                                      int.parse(g);
                                                      item['grade']=g;
                                                    } catch(error){

                                                    }


                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton( onPressed: () {
                        dynamic newCheck=currentSet.where((element) => element['name'].length==0&&element['grade'].length==0);
                        if(newCheck.length==0) {
                          dynamic newEntry = [];
                          for (var item in currentSet) {
                            dynamic grade = int.parse(item['grade']);
                            dynamic name = item['name'];
                            newEntry.add({"name": name, "grade": grade});
                          }
                          if (className.length != 0) {
                            if (!theback['studentClasses'].keys.contains(className)) {
                              theback['studentClasses'][className] = newEntry;
                              valGlobal["setState"](() {});
                            } else {

                            }
                          }
                        }
                      },
                          child: Text("Create Class Data")),
                    ],

                  );
                }
            );
          } );
        },
            child: const Text("New Class"));
      }
  );

}



Graphs(selectedStudents,allStudentsLists,currentClass){

  dynamic studentData =  json.decode(json.encode(allStudentsLists[currentClass]));

  dynamic filteredDataData = [];
  allStudentsLists[currentClass].forEach((element) {

    if(selectedStudents.contains(element["name"])){
      filteredDataData.add(element);
    }

  });

  studentData=filteredDataData;
  // Function to build the bar chart
  Widget buildBarChart() {
    List<charts.Series<dynamic, String>> series = [
      charts.Series<dynamic, String>(
        id: 'Grades',
        data: studentData,
        domainFn: (dynamic grade, _) => grade['name'],
        measureFn: (dynamic grade, _) => grade['grade'],
        labelAccessorFn: (dynamic grade, _) => '${grade['grade']}',
      )
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.MaterialPalette.black,
          ),
        ),
      ),
    );
  }


  return Scaffold(
    appBar: AppBar(
      title: Text('Graph Area'),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(height: 10),
                  Container(
                    height: 300,
                    child: buildBarChart(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );



}

dynamic valGlobal={};

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 400.0,
          width: 400.0,
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade200, Colors.blue.shade400],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        print('Email: $email');
                        print('Password: $password');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 400.0,
          width: 400.0,
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade200, Colors.blue.shade400],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        print('Email: $email');
                        print('Password: $password');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}