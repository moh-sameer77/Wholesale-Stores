import 'dart:convert';

EnrolledStudent enrolledStudentFromJson(String str) => EnrolledStudent.fromJson(json.decode(str));

String enrolledStudentToJson(EnrolledStudent data) => json.encode(data.toJson());

class EnrolledStudent {
  
    late String? academicPlan;
    late double? academicYear;

    EnrolledStudent(academicPlan, academicYear);
    EnrolledStudent.init();


    factory EnrolledStudent.fromJson(Map<String, dynamic> json) => EnrolledStudent(
         json["academicPlan"],
         json["academicYear"],
    );

    Map<String, dynamic> toJson() => {
        "academicPlan": academicPlan,
        "academicYear": academicYear,
    };
}

