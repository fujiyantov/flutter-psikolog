class Users {
  int? id;
  String? name;
  String? nim;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? profile;
  String? fullName;
  String? noTelp;
  String? bop;
  String? bod;
  int? roleId;
  int? facultyId;
  String? facultyName;
  int? studyProgramId;
  String? studyProgramName;
  String? gender;

  Users({
    this.id,
    this.name,
    this.nim,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.profile,
    this.fullName,
    this.noTelp,
    this.bop,
    this.bod,
    this.roleId,
    this.facultyId,
    this.facultyName,
    this.studyProgramId,
    this.studyProgramName,
    this.gender,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nim = json['nim'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    profile = json['profile'];
    fullName = json['full_name'];
    noTelp = json['no_telp'];
    bop = json['bop'];
    bod = json['bod'];
    roleId = json['role_id'];
    facultyId = json['faculty_id'];
    facultyName = json['faculty_name'];
    studyProgramId = json['study_program_id'];
    studyProgramName = json['study_program_name'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nim': nim,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'password': password,
      'profile': profile,
      'full_name': fullName,
      'no_telp': noTelp,
      'bop': bop,
      'bod': bod,
      'role_id': roleId,
      'faculty_id': facultyId,
      'faculty_name': facultyName,
      'study_program_id': studyProgramId,
      'study_program_name': studyProgramName,
      'gender': gender,
    };
  }
}
