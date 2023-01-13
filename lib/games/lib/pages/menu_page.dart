// import 'package:domvs_bros/widgets/selection_person_area.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_carousel_slider/carousel_slider.dart';
//
// class MenuPage extends StatefulWidget {
//   MenuPage({super.key});
//
//   @override
//   State<MenuPage> createState() => _MenuPageState();
// }
//
// class _MenuPageState extends State<MenuPage> {
//   List<SelectionPersonArea> personagens = [
//     SelectionPersonArea(person: Person.lucas),
//     SelectionPersonArea(person: Person.ninja),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: [
//             SizedBox(height: 50),
//             Text(
//               'Escolha seu personagem',
//               style: TextStyle(
//                 fontSize: 32,
//                 height: 1.2,
//                 //line height 150% of actual height
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 shadows: [
//                   Shadow(
//                     offset: Offset(2.0, 2.0), //position of shadow
//                     blurRadius: 6.0, //blur intensity of shadow
//                     color: Colors.black
//                         .withOpacity(0.8), //color of shadow with opacity
//                   ),
//
//                   //add more shadow with different position offset here
//                 ],
//               ),
//             ),
//             SizedBox(height: 60),
//             Expanded(
//               child: CarouselSlider.builder(
//                 unlimitedMode: true,
//                 slideBuilder: (index) {
//                   return Container(child: personagens[index]);
//                 },
//                 // slideTransform: BackgroundToForegroundTransform(),
//                 slideIndicator: CircularSlideIndicator(
//                   currentIndicatorColor: Colors.blueAccent,
//                   padding: EdgeInsets.only(bottom: 32),
//                   indicatorBorderColor: Colors.white,
//                 ),
//                 itemCount: personagens.length,
//                 initialPage: 0,
//                 enableAutoSlider: true,
//               ),
//             ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //   crossAxisAlignment: CrossAxisAlignment.center,
//             //   children: [
//             //     SelectionPersonArea(),
//             //     SelectionPersonArea(),
//             //     SelectionPersonArea(),
//             //     SelectionPersonArea(),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
