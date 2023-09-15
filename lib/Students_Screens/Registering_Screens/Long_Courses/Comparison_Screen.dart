import 'package:dtc_app/Components/showDialogList.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/api/models/certificate_type_model.dart';
import 'package:dtc_app/api/models/comparison_model.dart';
import 'package:flutter/material.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Dialogs.dart';
import '../../../Components/Label.dart';
import '../../../Components/loading.dart';
import '../../../Constants/Controller.dart';
import '../../../api/services/certificate_type_service.dart';
import '../../../api/services/comparison_service.dart';
import 'Wishes.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});

  static String id = 'ComparisonScreen';

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

GlobalKey<FormState> formState = GlobalKey<FormState>();

class _ComparisonScreenState extends State<ComparisonScreen> {
  int selectedCertificateId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'طلب الانتساب'),
        body: Form(
            key: formState,
            child: FutureBuilder<List<CertificateTypeModel>>(
              future: CertificateTypeService.getCertificateType(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                final certificateData = snapshot.data!;
                return ListView(children: [
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
                    ShowDialogList(
                      value: certification == ''
                          ? 'اضغط للإختيار...'
                          : certification,
                      child: ListView.builder(
                        itemCount: certificateData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              certification = certificateData[index].name;
                              selectedCertificateId = certificateData[index].id;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Text(certificateData[index].name)],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FutureBuilder<List<ComparisonModel>>(
                      future: ComparisonService.getComparison(
                          certificateType_id: selectedCertificateId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || !mounted) return Loading();
                        final comparisonData = snapshot.data;
                        Map<String, dynamic> scientific = {};
                        for (var comparison in comparisonData!) {
                          Map<String, dynamic> comp = {
                            comparison.name: comparison.mark
                          };
                          scientific = comp;
                        }
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(children: [
                            DataTable(
                              headingRowHeight: 60,
                              headingTextStyle: const TextStyle(
                                  color: BlackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              dataRowHeight: 50,
                              dataTextStyle: const TextStyle(
                                  color: BlackColor, fontSize: 12),
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
                                    label: Text('العلامة',
                                        textAlign: TextAlign.start))
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
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        labelStyle(text: 'ملاحظة'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        """
يخضع المتقدمون على دورتي التصميم الإعلاني والديكور لامتحان قبول عملي وذلك لتحديد مستوى قدراتهم الفنية وسيتم إرسال رسالة لكم بموعد الإمتحان.
يرجى إحضار مايلي:
1- الهوية الشخصية
2- قلم رصاص، ممحاة، مسطرة، ألوان خشبية.
                                        """,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        nextButton(
                            text: 'التالي',
                            onTap: () {
                              if (certification != '') {
                                Navigator.of(context).pushNamed(WishesPage.id,
                                    arguments: selectedCertificateId);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => warningDialog(
                                      title: 'إنتباه',
                                      message: 'يجب إختيار نوع الشهادة',
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                );
                              }
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
                ]);
              },
            )));
  }
}
