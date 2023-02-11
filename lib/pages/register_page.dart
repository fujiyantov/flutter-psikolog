import 'package:flutter/material.dart';
import 'package:psikolog/models/faculties.dart';
import 'package:psikolog/models/study_programs.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/services/master_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late List<Faculties> faculties;
  late List<StudyPrograms> studyPrograms;
  late bool _obsecureText = true;
  bool isLoading = false;
  static const List<String> list = <String>['Laki-laki', 'Perempuan'];

  // form filed
  TextEditingController dateinput = TextEditingController();
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController nimController = TextEditingController(text: '');
  TextEditingController noTelpController = TextEditingController(text: '');

  int? facultyId;
  int? studyProgramId;
  String? gender;
  String? mtoken = '';

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
    faculties = [];
    studyPrograms = [];
    getAllFaculty();
    // getAllStudyProgram();
    getToken();
  }

  getAllFaculty() async {
    var resFaculties = await MasterService().getAllFaculty();
    setState(() {
      print(resFaculties);
      faculties = resFaculties;
    });
  }

  /* getAllStudyProgram() async {
    var resStudyPrograms = await MasterService().getAllStudyProgram();
    setState(() {
      studyPrograms = resStudyPrograms;
      print(studyPrograms.length);
    });
  } */

  studyProgramByFacultyId(id) async {
    var resStudyPrograms = await MasterService().studyProgramByFacultyId(id);
    setState(() {
      // print(resStudyPrograms);
      // studyProgramId = 1;
      // studyPrograms.clear();
      // print(studyPrograms.length);
      studyPrograms = resStudyPrograms;
      // print(studyPrograms.length);
    });
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print("MY TOKEN REGIS $mtoken");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // function
    handleRegister() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        noTelp: noTelpController.text,
        bod: dateinput.text,
        facultyId: facultyId,
        studyProgramId: studyProgramId,
        gender: gender,
        fcmToken: mtoken,
        nim: nimController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Register Failed",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Lengkap',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: nimController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'NIM',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    hint: const Text('Pilih Fakultas'),
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: faculties.map((e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(e.title.toString()),
                      );
                    }).toList(),
                    value: facultyId,
                    onChanged: (newValue) {
                      setState(() {
                        studyProgramByFacultyId(newValue);
                        facultyId = newValue;
                        studyProgramId = null;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    hint: const Text('Pilih Program Studi'),
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: studyPrograms.map((e) {
                    // items: studyProgramByFacultyId(facultyId).map((e) {
                      // print(e);
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(e.title.toString()),
                      );
                    }).toList(),
                    value: studyProgramId,
                    onChanged: (e) {
                      setState(() {
                        studyProgramId = e;
                        // studyPrograms.clear();
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: _obsecureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                      },
                      child: Icon(
                        _obsecureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: noTelpController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No. Telp',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    hint: const Text('Pilih Jenis Kelamin'),
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: gender,
                    onChanged: (e) {
                      setState(() {
                        gender = e;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                /* TextField(
                  readOnly: true,
                  controller: dateinput,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                        pickedDate,
                      ); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                        formattedDate,
                      ); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tanggal Lahir',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ), */
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(55),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: handleRegister,
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // side: const BorderSide(
                    //   width: 1,
                    //   color: Colors.black54,
                    // ),
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(55),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text(
                    'Kembali Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
