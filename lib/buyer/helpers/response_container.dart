class ResponseContainer{
  bool hasError;
  dynamic response;
  String failureMassage;
  int code;

  ResponseContainer({this.response, this.failureMassage="Failed to execute action", this.code=404,this.hasError:false,});

}
