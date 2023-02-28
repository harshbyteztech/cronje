import 'app_asset.dart';

const String strCalculators = "Calculators";
const String strCalculator = "Calculate";
const String strOurTeam = "Our Team";
const String strDocument = "Documents";
const String strInsights = "Insights";
const String strContacts = "Contact Us";
const String strBondCost = "Bond cost Calculator";
const String strBondCost1 = "Bond cost Calculator";
const String strTransferCost = "Transfer cost calculator";
const String strTransferCost1 = "Transfer cost calculator";
const String strMemberTransfer = "Member Interest Transfer";
const String strLeaseStamp = "Lease Agreement Stamp Duty";
const String mergerfiling = 'Merger Filing Cost Calculator';
const String strContactEmail =
    "helene@cronjelaw.com\nelda@cronjelaw.com\nconvey@cronjelaw.com\nannamart@cronjelaw.com";
const String strAddressPDF1 = "1 Charles Cathral Street, Windhoek, Namibia\nOur Conveyancer : \nHelene Cronjé \n (+264) 81 146 9406";
const String strAddressPDF2 = "Shop No. 5,Benguela Street, Henties Bay \nAnna-Mart Adriaanse\n (+264) 81 331 8936 ";
const String strAddressPDF3 = "P.O.Box 81588, Olympia, Windhoek, Namibia";
const String strPhonePDF = "(+264) 61 247 435/7";
const String strAddress1 =
    "Our Conveyancer : Helene Cronjé \n(+264) 81 146 9406";
const String strAddress2 =
    "  Assisted by :  \n  Elda le Roux\n   (+264) 81 229 7690\n  Marinda Jacobs\n   (+264) 854 6829\n\n";
const String strAddress3 =
    "  Anna-Mart Adriaanse\n   (+264) 81 331 8936 ";
const String strStreet1 = "1 Charles Cathral Street, Windhoek, Namibia\n\n";
const String strStreet2 = "Shop No. 5, Benguela Street, Henties Bay \n\n";
const String strimage1 = "Christiaan Cronjé";
const String strimage2 = "Practice Areas:";
const String strimage3 =
    "Commercial Transactions, Business Structures, Tax Law, and Insolvency";
const String strimage5 = "Agreement of Sale\n(Property)";
const String strimage4 =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magn...";
const String hintBond = "Enter Bond amount (N\$)";
const String hintTransfer = " Enter Transfer amount (N\$)";
const String hintShare = "Enter Share amount (N\$)";
const String hintLease = "Enter Lease amount (N\$)";
const String hintMergerAssets = "Enter Acquirer Assets(N\$)";
const String hintMergerAssetsT = "Enter Target Assets(N\$)";
const String hintPeriod= "Enter Period";
const String hintMergerTurnover= "Enter Acquirer Turnover(N\$)";
const String hintMergerTurnoverT= "Enter Target Turnover(N\$)";
const String strDisclaimer = "Disclaimer";
const String strPriceErrorMessage = "Price cannot be blank";

const String strPeriodErrorMessage = "Period cannot be blank";
const String strDisclaimerAll =
    "All estimations and costs provided are a guideline only and are subject to change. Cronjé Inc and its employees make no claim and give no warranties as regards the accuracy of the calculators and cannot be held liable for any loss or damage arising directly or indirectly from any reliance placed on the estimations and costs provided by the calculators. Any article, information, or document provided on this Application does not constitute legal or professional advice and are made available for information purposes only. Cronjé Inc or its employees will not be liable for any direct or indirect loss that may be suffered as a result of reliance placed on any article, information, or document provided on this Application.  For accurate calculations or legal advice contact Cronje Inc on (+264) 61 247 435.";

List<CalculatorModel> calculatorList = [
  CalculatorModel(
    text: strBondCost,
    icon: AppAssetsImage.iconBond,
  ),
  CalculatorModel(
    text: strTransferCost,
    icon: AppAssetsImage.iconTransfer,
  ),
  CalculatorModel(
    text: strMemberTransfer,
    icon: AppAssetsImage.iconMember,
  ),
  CalculatorModel(
    text: strLeaseStamp,
    icon: AppAssetsImage.iconStamp,
  ),
  CalculatorModel(
    text: mergerfiling,
    icon: AppAssetsImage.iconMember,
  ),
];

class CalculatorModel {
  String? text;
  String? icon;

  CalculatorModel({this.text, this.icon});
}
