class UploadDevice{

  int ? roomId;
  int ? deviceId;
  String ? deviceLogo;
  String ? deviceName;
  String ? deviceNameAr;

  UploadDevice({
    this.roomId,
    this.deviceId,
    this.deviceName,
    this.deviceLogo,
    this.deviceNameAr,

  });

  UploadDevice.formJson( Map <String , dynamic> json ){

    roomId = json['roomId'];
    deviceId=json['deviceId'];
    deviceName=json['deviceName'];
    deviceLogo=json['deviceLogo'];
    deviceNameAr=json['deviceNameAr'];

  }

  Map <String,dynamic> toMap(){
    return{
      'roomId':roomId,
      'deviceId':deviceId,
      'deviceName':deviceName,
      'deviceLogo':deviceLogo,
      'deviceNameAr':deviceNameAr
    };
  }

}
