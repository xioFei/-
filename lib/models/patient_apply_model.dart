class PatientVisitListModel {
  String createTime;
  String diseaseLevel;
  String diseaseName;
  int doctorId;
  int id;
  int isAccept;
  int patientAge;
  int patientId;
  String patientMsg;
  String patientName;
  int patientSex;

  PatientVisitListModel(
      {this.createTime,
      this.diseaseLevel,
      this.diseaseName,
      this.doctorId,
      this.id,
      this.isAccept,
      this.patientAge,
      this.patientId,
      this.patientMsg,
      this.patientName,
      this.patientSex});

  PatientVisitListModel.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    diseaseLevel = json['diseaseLevel'];
    diseaseName = json['diseaseName'];
    doctorId = json['doctorId'];
    id = json['id'];
    isAccept = json['isAccept'];
    patientAge = json['patientAge'];
    patientId = json['patientId'];
    patientMsg = json['patientMsg'];
    patientName = json['patientName'];
    patientSex = json['patientSex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['diseaseLevel'] = this.diseaseLevel;
    data['diseaseName'] = this.diseaseName;
    data['doctorId'] = this.doctorId;
    data['id'] = this.id;
    data['isAccept'] = this.isAccept;
    data['patientAge'] = this.patientAge;
    data['patientId'] = this.patientId;
    data['patientMsg'] = this.patientMsg;
    data['patientName'] = this.patientName;
    data['patientSex'] = this.patientSex;
    return data;
  }
}
