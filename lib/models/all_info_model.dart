class AllInfoModel {
  String? entity;
  String? currency;
  String? alphabeticCode;
  int? numericCode;
  int? minorUnit;
  String? withdrawalDate;

  AllInfoModel(
      {this.entity,
      this.currency,
      this.alphabeticCode,
      this.numericCode,
      this.minorUnit,
      this.withdrawalDate});

  AllInfoModel.fromJson(Map<String, dynamic> json) {
    entity = json['Entity'];
    currency = json['Currency'];
    alphabeticCode = json['AlphabeticCode'];
    // if jsonNumericCode is string, convert to int
    numericCode = num.tryParse(json['NumericCode'].toString())?.toInt();
    minorUnit = num.tryParse(json['NumericCode'].toString())?.toInt();
    withdrawalDate = json['WithdrawalDate'];
  }
}
