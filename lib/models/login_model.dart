
class loginModel{

   String? email;
 String? password;
String? token;
String? isAuthenticated;
loginModel({
  required this.email,
  required this.password,
  required this.token,
  required this.isAuthenticated,

});
loginModel.fromjson(Map<String,dynamic> json){
email=json[email];
password=json[password];
token=json[token];
isAuthenticated=json[isAuthenticated];

}
}

