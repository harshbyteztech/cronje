import 'package:flutter/material.dart';

class BondModel {
  double? bondFees;
  double? vatOnFees;
  double? stampDuty;
  double? deepOfficeFee;
  double? sundriesPostage;
  double? total;

  BondModel(
      {this.bondFees,
      this.vatOnFees,
      this.stampDuty,
      this.deepOfficeFee,
      this.sundriesPostage,
      this.total});
}
