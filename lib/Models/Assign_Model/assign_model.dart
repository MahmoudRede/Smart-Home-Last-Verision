
class AssignModel{

  int ? userId;
  int ? roomId;
  String ? roomLogo;
  String ? roomName;
  String ? roomNameAr;



  AssignModel({
    this.userId,
    this.roomId,
    this.roomName,
    this.roomLogo,
    this.roomNameAr,

  });

  AssignModel.formJson( Map <String , dynamic> json ){

    userId = json['userId'];
    roomId=json['roomId'];
    roomName=json['roomName'];
    roomLogo=json['roomLogo'];
    roomNameAr=json['roomNameAr'];

  }

  Map <String,dynamic> toMap(){
    return{
      'userId':userId,
      'roomId':roomId,
      'roomName':roomName,
      'roomLogo':roomLogo,
      'roomNameAr':roomNameAr

    };
  }

}


