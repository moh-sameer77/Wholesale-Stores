class Result {
  late bool success;
  late dynamic message;

  Result(this.success, this.message);

  factory Result.fromJson(dynamic json) {
    return Result(json['success'], json['message']);
  }
}
