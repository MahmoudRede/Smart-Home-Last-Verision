class UploadDevice{

  int ? roomId;
  int ? deviceId;
  String ? deviceLogo;
  String ? deviceName;

  UploadDevice({
    this.roomId,
    this.deviceId,
    this.deviceName,
    this.deviceLogo,
  });

  UploadDevice.formJson( Map <String , dynamic> json ){

    roomId = json['roomId'];
    deviceId=json['deviceId'];
    deviceName=json['deviceName'];
    deviceLogo=json['deviceLogo'];

  }

  Map <String,dynamic> toMap(){
    return{
      'roomId':roomId,
      'deviceId':deviceId,
      'deviceName':deviceName,
      'deviceLogo':deviceLogo,
    };
  }

}
