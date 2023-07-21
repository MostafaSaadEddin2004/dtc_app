import 'package:dropdown_search/dropdown_search.dart';
import 'package:dtc_app/Constents/Colors.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Personal_Information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/data_table.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Label.dart';
import 'Wishes.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});

  static String id = 'ComparisonScreen';

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}
 GlobalKey<FormState> formState = GlobalKey<FormState>();

class _ComparisonScreenState extends State<ComparisonScreen> {
  @override
  String? Certificate;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'طلب الانتساب'),
      body: Form(

        key: formState,
        child: ListView(
          children: [
            Column(children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  labelStyle(text: 'المفاضلة'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: WhiteColor,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: const [
                    BoxShadow(
                      color: GreyColor,
                      blurRadius: 2,
                      offset: Offset(2, 2), // Shadow position
                    ),
                  ],
                ),
                child: DropdownSearch<String>(
                  onChanged: (data) {
                    Certificate = data;
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: PrimaryColor)),
                          hintText: 'اختر شهادتك',
                          label: const Text('الشهادة'),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: GreyColor),
                              borderRadius: BorderRadius.circular(2)))),
                  dropdownButtonProps: const DropdownButtonProps(
                      icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: PrimaryColor,
                  )),
                  items: const [
                    "علمي",
                    "أدبي",
                    "فنون نسوية",
                    "مهني",
                    "صناعة معلوماتية",
                    "صناعة إتصالات",
                    "صناعة إلكترون",
                    "صناعة ميكاترونيكس",
                    "صناعة ميكانيك مركبات"
                  ],
                  popupProps: PopupPropsMultiSelection.menu(
                    fit: FlexFit.loose,
                    menuProps: MenuProps(
                        shape: BeveledRectangleBorder(
                            side: const BorderSide(
                                color: PrimaryColor, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(2))),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  DataTable(
                    headingRowHeight: 60,
                    headingTextStyle: const TextStyle(
                        color: BlackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    dataRowHeight: 50,
                    dataTextStyle:
                        const TextStyle(color: BlackColor, fontSize: 12),
                    border: TableBorder.all(
                        color: GreyColor,
                        width: 1,
                        borderRadius: BorderRadius.circular(10),
                        style: BorderStyle.solid),
                    decoration: BoxDecoration(
                      color: WhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: GreyColor,
                          blurRadius: 2,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    columns: const [
                      DataColumn(
                          label: Text(
                        'الاختصاص',
                        textAlign: TextAlign.start,
                      )),
                      DataColumn(
                          label: Text('العلامة', textAlign: TextAlign.start))
                    ],
                    rows: scientific.entries.map((entry) {
                      return DataRow(
                        cells: [
                          DataCell(Text(
                            entry.key,
                            textAlign: TextAlign.start,
                          )),
                          DataCell(Text(entry.value.toString(),
                              textAlign: TextAlign.start)),
                        ],
                      );
                    }).toList(),
                  ),
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'ملاحظة :',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        """
      يخضع المتقدمون على دورتي التصميم الإعلاني والديكور لامتحان قبول عملي وذلك لتحديد مستوى قدراتهم الفنية.
      يرجى إحضار مايلي:
      1- الهوية الشخصية
      2- قلم رصاص، ممحاة، مسطرة، ألوان خشبية.
      """,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  nextButton(
                      text: 'التالي',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const WishesPage()));
                      }),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

final Map<String, dynamic> scientific = {
  'مساعد صيدلي': 1900,
  'فني مخبر طبي': 1800,
  'الكمبيوتر ونظم المعلومات': 1950,
  'مساعد مهندس مدني': 1700,
  'تكنولوجية الإتصالات': 1700,
  'المحاسبة': 1800,
  'المصارف والتأمين': 1750,
  'ميكاترونيكس': 1700,
  'مساعد مهندس آليات': 1700,
  'فني إلكترون وتكنولوجيا الحاسوب': 1700,
  'إدارة التسويق والأعمال الإلكترونية': 1800,
  'إدارة المشاريع': 1700,
  'مساعد مهندس معماري': 1700,
  'التصميم الإعلاني': 1400,
  'مساعد مهندس ديكور وتصميم داخلي': 1400
};
