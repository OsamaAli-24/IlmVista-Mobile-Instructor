class ChangePasswordBody {
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  ChangePasswordBody({this.oldPassword, this.newPassword, this.confirmPassword,});

  ChangePasswordBody.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    newPassword = json['password'];
    confirmPassword = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old_password'] = oldPassword;
    data['password'] = newPassword;
    data['password_confirmation'] = confirmPassword;

    return data;
  }
}
