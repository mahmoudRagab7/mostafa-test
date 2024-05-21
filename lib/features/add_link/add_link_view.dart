// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:nfc_card/core/services/navigation_services.dart';
// import 'package:nfc_card/core/shared_widget/button_builder.dart';
// import 'package:nfc_card/core/shared_widget/text_form_field_builder.dart';
// import 'package:nfc_card/core/statics.dart';
// import 'package:nfc_card/features/layout/bottom_tab_bar.dart';
// import 'package:nfc_card/generated/l10n.dart';

// class AddLinkView extends StatefulWidget {
//   const AddLinkView({super.key});

//   @override
//   State<AddLinkView> createState() => _AddLinkViewState();
// }

// class _AddLinkViewState extends State<AddLinkView> {
//   int _selectedIndex = 0;
//   String _indexName = 'الكل';
//   List<String> items = [
//     'الكل',
//     'الاعمال',
//     'التواصل الاجتماعى',
//     'الدفع',
//     'الفن والتصميم'
//   ];
//   Map<String, dynamic> product = {
//     'الاعمال': [
//       {'name': 'google play', 'image': '', 'url': "http://www.google.com"},
//       {'name': 'apple app', 'image': '', 'url': "http://apple.com"},
//     ],
//     'التواصل الاجتماعى': [
//       {'name': 'instagram', 'image': '', 'url': "http://instagram.com"},
//       {'name': 'linkedin', 'image': '', 'url': "http://www.linked.com"},
//       {'name': 'whatsapp', 'image': '', 'url': "http://whatsapp.com"},
//       {'name': 'facebook', 'image': '', 'url': "http://www.facebook.com"},
//     ],
//     'الدفع': [
//       {'name': 'paypal', 'image': '', 'url': "http://www.paypal.com"},
//     ],
//     'الفن والتصميم': [
//       {'name': 'figma', 'image': '', 'url': "http://www.figma.com"},
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchController = TextEditingController();
//     var language = S.of(context);
//     List<String> keys = product.keys.toList();
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: customAppBar(context, language, searchController),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Container(
//               decoration: const BoxDecoration(color: AppStyles.primaryW2),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 52,
//                       width: MediaQuery.of(context).size.width,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) =>
//                             filterContainer(items[index], index),
//                         itemCount: items.length,
//                       ),
//                     ),
//                     _indexName == 'الكل'
//                         ? SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.746,
//                             width: MediaQuery.of(context).size.width,
//                             child: ListView.builder(
//                               padding: EdgeInsets.zero,
//                               itemCount: keys.length,
//                               itemBuilder: (context, index) {
//                                 String key = keys[index];
//                                 List<Map<String, String>> items =
//                                     List<Map<String, String>>.from(
//                                         product[key]);

//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     // Header for the key
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         key,
//                                         style: AppStyles.customTextStyleBl6,
//                                       ),
//                                     ),
//                                     // List of items under the current key
//                                     ListView.builder(
//                                       shrinkWrap: true,
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       itemCount: items.length,
//                                       itemBuilder: (context, itemIndex) {
//                                         return Column(
//                                           children: [
//                                             linksContainer(
//                                               items[itemIndex]['name']!,
//                                               () {
//                                                 urlDetailsDialogForAll(
//                                                     context,
//                                                     language,
//                                                     itemIndex,
//                                                     items[itemIndex]);
//                                               },
//                                               language,
//                                             ),
//                                             const SizedBox(
//                                               height: 8,
//                                             )
//                                           ],
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ))
//                         : Column(
//                             children: [
//                               const SizedBox(
//                                 height: 24,
//                               ),
//                               SizedBox(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.719,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   // scrollDirection: Axis.horizontal,
//                                   itemBuilder: (context, indexn) {
//                                     return Column(
//                                       children: [
//                                         linksContainer(
//                                           product[_indexName][indexn]['name'],
//                                           () {
//                                             urlDetailsDialog(
//                                                 context, language, indexn);
//                                           },
//                                           language,
//                                         ),
//                                         const SizedBox(
//                                           height: 8,
//                                         )
//                                       ],
//                                     );
//                                   },
//                                   itemCount: (product[_indexName] != null)
//                                       ? product[_indexName].length
//                                       : 0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future urlDetailsDialog(BuildContext context, S language, index) {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.57,
//           width: 390,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: 72,
//                       height: 72,
//                       padding: const EdgeInsets.all(16),
//                       decoration: ShapeDecoration(
//                         color: Colors.grey,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       product[_indexName][index]['name'],
//                       style: AppStyles.customTextStyleBl5,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 28,
//                   ),
//                   Text(
//                     language.urlApp,
//                     style: AppStyles.customTextStyleBl4,
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   TextFormFieldBuilder(
//                       label: product[_indexName][index]['name'],
//                       controller: TextEditingController(),
//                       type: TextInputType.name,
//                       isPAdding: false),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     '${product[_indexName][index]['name']} URL',
//                     style: AppStyles.customTextStyleBl4,
//                   ),
//                   TextFormFieldBuilder(
//                       label: product[_indexName][index]['url'],
//                       controller: TextEditingController(),
//                       type: TextInputType.url,
//                       isPAdding: false),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ButtonBuilder(
//                           width: MediaQuery.of(context).size.width * 0.42,
//                           text: language.add,
//                           ontap: () {
//                             navigatePop(context: context);
//                           }),
//                       ButtonBuilder(
//                           width: MediaQuery.of(context).size.width * 0.42,
//                           text: language.cancel,
//                           color: AppStyles.primaryW3,
//                           textColor: AppStyles.primaryBl3,
//                           ontap: () {
//                             navigatePop(context: context);
//                           }),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future urlDetailsDialogForAll(
//       BuildContext context, S language, index, Map<String, String> items) {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.57,
//           width: 390,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: 72,
//                       height: 72,
//                       padding: const EdgeInsets.all(16),
//                       decoration: ShapeDecoration(
//                         color: Colors.grey,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       items['name']!,
//                       style: AppStyles.customTextStyleBl5,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 28,
//                   ),
//                   Text(
//                     language.urlApp,
//                     style: AppStyles.customTextStyleBl4,
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   TextFormFieldBuilder(
//                       label: items['name']!,
//                       controller: TextEditingController(),
//                       type: TextInputType.name,
//                       isPAdding: false),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     '${items['name']!} URL',
//                     style: AppStyles.customTextStyleBl4,
//                   ),
//                   TextFormFieldBuilder(
//                       label: items['url']!,
//                       controller: TextEditingController(),
//                       type: TextInputType.url,
//                       isPAdding: false),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ButtonBuilder(
//                           width: MediaQuery.of(context).size.width * 0.42,
//                           text: language.add,
//                           ontap: () {
//                             navigatePop(context: context);
//                           }),
//                       ButtonBuilder(
//                           width: MediaQuery.of(context).size.width * 0.42,
//                           text: language.cancel,
//                           color: AppStyles.primaryW3,
//                           textColor: AppStyles.primaryBl3,
//                           ontap: () {
//                             navigatePop(context: context);
//                           }),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   GestureDetector linksContainer(
//       String name, void Function() onTap, S language) {
//     return GestureDetector(
//       // onTap: onTap,
//       child: Container(
//         height: 70,
//         decoration: BoxDecoration(
//             color: AppStyles.primaryW, borderRadius: BorderRadius.circular(16)),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 padding: const EdgeInsets.all(16),
//                 decoration: ShapeDecoration(
//                   color: AppStyles.primaryG4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 8,
//               ),
//               Text(
//                 name,
//                 style: AppStyles.customTextStyleB3,
//               ),
//               const Spacer(),
//               ButtonBuilderWithIcon(
//                   color: const Color(0xFFE8F3FD),
//                   borderColor: const Color(0xFFE8F3FD),
//                   textColor: AppStyles.primaryB2,
//                   width: 100,
//                   text: language.add,
//                   ontap: onTap,
//                   widget: Iconsax.add)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   GestureDetector filterContainer(String name, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//           _indexName = name;
//         });
//       },
//       child: _selectedIndex == index
//           ? Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Container(
//                 height: 52,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: AppStyles.primaryB3,
//                     border: Border.all(color: AppStyles.primaryG5)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     name,
//                     textAlign: TextAlign.center,
//                     style: AppStyles.customTextStyleBl6
//                         .copyWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Container(
//                 height: 52,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: AppStyles.primaryG5)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     name,
//                     textAlign: TextAlign.center,
//                     style: AppStyles.customTextStyleBl6,
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   Container customAppBar(BuildContext context, S language,
//       TextEditingController searchController) {
//     return Container(
//       color: AppStyles.primaryW,
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               navigateAndReplace(
//                   context: context, screen: const BottomTabBar());
//             },
//             child: Container(
//               width: 50,
//               height: 50,
//               decoration: ShapeDecoration(
//                 color: AppStyles.primaryG5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.only(right: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.arrow_back_ios,
//                       color: AppStyles.primaryBl3,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           SizedBox(
//             height: 50,
//             child: TextFormFieldBuilder(
//               width: MediaQuery.of(context).size.width * 0.78,
//               label: language.searchForLink,
//               controller: searchController,
//               type: TextInputType.text,
//               isPAdding: true,
//               prefix: const Icon(
//                 Iconsax.search_normal_1,
//                 color: AppStyles.primaryG,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/text_form_field_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/layout/bottom_tab_bar.dart';
import 'package:nfc_card/generated/l10n.dart';

class AddLinkView extends StatefulWidget {
  const AddLinkView({super.key});

  @override
  State<AddLinkView> createState() => _AddLinkViewState();
}

class _AddLinkViewState extends State<AddLinkView> {
  int _selectedIndex = 0;
  String _indexName = 'الكل';
  List<String> items = [
    'الكل',
    'الاعمال',
    'التواصل الاجتماعى',
    'الدفع',
    'الفن والتصميم'
  ];
  Map<String, dynamic> product = {
    'الاعمال': [
      {
        'name': 'google play',
        'image': 'assets/googleplay_link.png',
        'url': "http://www.google.com"
      },
      {
        'name': 'apple app',
        'image': 'assets/apple_link.png',
        'url': "http://apple.com"
      },
    ],
    'التواصل الاجتماعى': [
      {
        'name': 'instagram',
        'image': 'assets/instagram_link.png',
        'url': "http://instagram.com"
      },
      {
        'name': 'linkedin',
        'image': 'assets/linkedin_link.png',
        'url': "http://www.linked.com"
      },
      {
        'name': 'whatsapp',
        'image': 'assets/whatsapp_link.png',
        'url': "http://whatsapp.com"
      },
      {
        'name': 'facebook',
        'image': 'assets/facbook_link.png',
        'url': "http://www.facebook.com"
      },
    ],
    'الدفع': [
      {
        'name': 'paypal',
        'image': 'assets/paypal_link.png',
        'url': "http://www.paypal.com"
      },
    ],
    'الفن والتصميم': [
      {
        'name': 'figma',
        'image': 'assets/figma_link.png',
        'url': "http://www.figma.com"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var language = S.of(context);
    List<String> keys = product.keys.toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: customAppBar(context, language, searchController),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: AppStyles.primaryW2),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 52,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              filterContainer(items[index], index),
                          itemCount: items.length,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: _indexName == 'الكل'
                            ? ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: keys.length,
                                itemBuilder: (context, index) {
                                  String key = keys[index];
                                  List<Map<String, String>> items =
                                      List<Map<String, String>>.from(
                                          product[key]);

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Header for the key
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          key,
                                          style: AppStyles.customTextStyleBl6,
                                        ),
                                      ),
                                      // List of items under the current key
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: items.length,
                                        itemBuilder: (context, itemIndex) {
                                          return Column(
                                            children: [
                                              linksContainer(
                                                  items[itemIndex]['name']!,
                                                  () {
                                                urlDetailsDialogForAll(
                                                    context,
                                                    language,
                                                    itemIndex,
                                                    items[itemIndex]);
                                              }, language,
                                                  items[itemIndex]['image']!),
                                              const SizedBox(
                                                height: 8,
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              )
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (context, indexn) {
                                        return Column(
                                          children: [
                                            linksContainer(
                                                product[_indexName][indexn]
                                                    ['name'], () {
                                              urlDetailsDialog(
                                                  context, language, indexn);
                                            },
                                                language,
                                                product[_indexName][indexn]
                                                    ['image']),
                                            const SizedBox(
                                              height: 8,
                                            )
                                          ],
                                        );
                                      },
                                      itemCount: (product[_indexName] != null)
                                          ? product[_indexName].length
                                          : 0,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future urlDetailsDialog(BuildContext context, S language, index) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.57,
          width: 390,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 32,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 72,
                      height: 72,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage(
                                  product[_indexName][index]['image']),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      product[_indexName][index]['name'],
                      style: AppStyles.customTextStyleBl5,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    language.urlApp,
                    style: AppStyles.customTextStyleBl4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormFieldBuilder(
                      label: product[_indexName][index]['name'],
                      controller: TextEditingController(),
                      type: TextInputType.name,
                      isPAdding: false),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${product[_indexName][index]['name']} URL',
                    style: AppStyles.customTextStyleBl4,
                  ),
                  TextFormFieldBuilder(
                      label: product[_indexName][index]['url'],
                      controller: TextEditingController(),
                      type: TextInputType.url,
                      isPAdding: false),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonBuilder(
                          width: MediaQuery.of(context).size.width * 0.42,
                          text: language.add,
                          ontap: () {
                            navigatePop(context: context);
                          }),
                      ButtonBuilder(
                          width: MediaQuery.of(context).size.width * 0.42,
                          text: language.cancel,
                          color: AppStyles.primaryW3,
                          textColor: AppStyles.primaryBl3,
                          ontap: () {
                            navigatePop(context: context);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future urlDetailsDialogForAll(
      BuildContext context, S language, index, Map<String, String> items) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.57,
          width: 390,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 32,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 72,
                      height: 72,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage(items['image']!),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      items['name']!,
                      style: AppStyles.customTextStyleBl5,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    language.urlApp,
                    style: AppStyles.customTextStyleBl4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormFieldBuilder(
                      label: items['name']!,
                      controller: TextEditingController(),
                      type: TextInputType.name,
                      isPAdding: false),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${items['name']!} URL',
                    style: AppStyles.customTextStyleBl4,
                  ),
                  TextFormFieldBuilder(
                      label: items['url']!,
                      controller: TextEditingController(),
                      type: TextInputType.url,
                      isPAdding: false),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonBuilder(
                          width: MediaQuery.of(context).size.width * 0.42,
                          text: language.add,
                          ontap: () {
                            navigatePop(context: context);
                          }),
                      ButtonBuilder(
                          width: MediaQuery.of(context).size.width * 0.42,
                          text: language.cancel,
                          color: AppStyles.primaryW3,
                          textColor: AppStyles.primaryBl3,
                          ontap: () {
                            navigatePop(context: context);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector linksContainer(
      String name, void Function() onTap, S language, String image) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: AppStyles.primaryW, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppStyles.primaryG4,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: AppStyles.customTextStyleB3,
              ),
              const Spacer(),
              ButtonBuilderWithIcon(
                  color: const Color(0xFFE8F3FD),
                  borderColor: const Color(0xFFE8F3FD),
                  textColor: AppStyles.primaryB2,
                  width: 100,
                  text: language.add,
                  ontap: onTap,
                  widget: Iconsax.add)
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector filterContainer(String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _indexName = name;
        });
      },
      child: _selectedIndex == index
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppStyles.primaryB3,
                    border: Border.all(color: AppStyles.primaryG5)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: AppStyles.customTextStyleBl6
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppStyles.primaryG5)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: AppStyles.customTextStyleBl6,
                  ),
                ),
              ),
            ),
    );
  }

  Container customAppBar(BuildContext context, S language,
      TextEditingController searchController) {
    return Container(
      color: AppStyles.primaryW,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              navigateAndReplace(
                  context: context, screen: const BottomTabBar());
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                color: AppStyles.primaryG5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppStyles.primaryBl3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextFormFieldBuilder(
                label: language.searchForLink,
                controller: searchController,
                type: TextInputType.text,
                isPAdding: true,
                prefix: const Icon(
                  Iconsax.search_normal_1,
                  color: AppStyles.primaryG,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
