import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../action/user/model/user.dart';
import '../../../action/user/user_action.dart';
import '../../../styles/colors.dart';
import '../../../widgets/input/primary_input.dart';
import '../../orders_screen.dart';
import '../login/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController gender = TextEditingController();
  DateTime dateOfBirth = DateTime.now();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  String? dateValue;

  final genderList = ["Male", "Female"];
  String genderValue = "Male";

  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7195E1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Expanded(
              //   flex: 2,
              //   child: Image.asset(
              //     "assets/untitled.png",
              //     width: double.infinity,
              //   ),
              // ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 2: Register",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff7195E1))),
                          ),
                          Text(
                            "For students who are already \n enrolled in an institution.",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff7195E1))),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          PrimaryInput(
                              textEditingController: email,
                              inputType: TextInputType.emailAddress,
                              id: "email",
                              hintText: "name@example.com"),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryInput(
                                    textEditingController: firstName,
                                    id: "firstName",
                                    hintText: "First name"),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: PrimaryInput(
                                    textEditingController: lastName,
                                    id: "lastName",
                                    hintText: "Last name"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: dropDown(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(child: datePicker()),
                            ],
                          ),
                          const SizedBox(height: 15),
                          PrimaryInput(
                              textEditingController: password,
                              inputType: TextInputType.visiblePassword,
                              id: "password",
                              hintText: "Password"),
                          const SizedBox(height: 15),
                          PrimaryInput(
                              textEditingController: confirmPassword,
                              inputType: TextInputType.visiblePassword,
                              id: "confirmPassword",
                              hintText: "Confirm Password"),
                          const SizedBox(height: 15),
                          button(),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 65,
                              ),
                              Text(
                                " Already have account? ",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff7195E1))),
                              ),
                              login(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell login() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      },
      child: SizedBox(
        child: Text(
          "Login",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7195E1))),
        ),
      ),
    );
  }

  Container dropDown() {

    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 2.5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          alignment: Alignment.center,
          dropdownColor: const Color(0xffffffff),
          value: genderValue,
          // icon: const Image(
          //   height: 10,
          //   width: 3,
          //   image: AssetImage(
          //     "assets/images/down-arrow.png",
          //   ),
          // ),
          elevation: 16,
          style: const TextStyle(color: Color(0xff000000)),
          onChanged: (String? newValue) {
            setState(() {
              genderValue = newValue!;
            });
          },
          items: genderList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container datePicker() {
    return Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor, width: 2.5),
        ),
        child: TextField(
          textAlign: TextAlign.start,
          style: const TextStyle(color: Color(0xff000000)),
          controller: dateOfBirthController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: " Date of birth",
            hintStyle: TextStyle(color: Color(0xff000000)),
          ),
          readOnly: true,
          //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);

              //formatted date output using intl package =>  2021-03-16
              setState(() {
                dateOfBirthController.text = formattedDate;
                dateOfBirth = pickedDate; //set output date to TextField value.
              });
            } else {}
          },
        ));
  }

  InkWell button() {
    () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
    };
    User user = User.init();
    user.email = email.text.trim();
    user.firstName = firstName.text.trim();
    user.lastName = lastName.text.trim();
    user.gender = Gender.values.firstWhere(
        (element) => element.name.contains(genderValue.toLowerCase()));
    user.studentType = StudentType.enrolled;
    user.password = password.text;
    user.confirmPassword = confirmPassword.text;
    user.dateOfBirth = dateOfBirth;
    return InkWell(
      onTap: () async {
        await context.read<UserAction>().register(context, user);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: const BoxDecoration(
            color: Color(0xff7195E1),
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            "Register",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff))),
          ),
        ),
      ),
    );
  }
}
