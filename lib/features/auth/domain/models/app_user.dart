class AppUser{
  final String userid;
  final String email;
  AppUser({required this.userid,required this.email});
  //to covert app user to json
Map<String,dynamic> toJson(){
  return{
    "userid":userid,
    "Email":email,
  };
}
factory AppUser.fromJson(Map<String,dynamic>json){
  return AppUser(userid: json["userid"],email: json["Email"]);
}
}