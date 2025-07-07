class SettingsModel {
  int? settingsId;
  String? settingsTitel;
  String? settingsBody;
  int? settingsDeliverytime;

  SettingsModel(
      {this.settingsId,
        this.settingsTitel,
        this.settingsBody,
        this.settingsDeliverytime});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsTitel = json['settings_titel'];
    settingsBody = json['settings_body'];
    settingsDeliverytime = json['settings_deliverytime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['settings_id'] = this.settingsId;
    data['settings_titel'] = this.settingsTitel;
    data['settings_body'] = this.settingsBody;
    data['settings_deliverytime'] = this.settingsDeliverytime;
    return data;
  }
}