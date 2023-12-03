// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:kotobekia/shared/components/components.dart';
// import 'package:kotobekia/shared/styles/colors.dart';

// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   @override
//   Widget build(BuildContext context) {
//     var text = '';
//     final _formKey = GlobalKey<FormState>();
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 100),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   LanguageColum(containerText: 'ض', languageText: 'العربية'),
//                   LanguageColum(containerText: 'Aa', languageText: 'English'),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       DefaultTextField(
//                         aboveFieldText: 'Full Name',
//                         onSaved: (newValue) {
//                           if (newValue != null) {
//                             print(newValue);
//                           }
//                         },
//                         inputType: TextInputType.name,
//                         hintText: 'name',
//                         onValidate: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'please enter a valid ';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       DefaultTextField(
//                         aboveFieldText: 'Email Address',
//                         onSaved: (newValue) {},
//                         inputType: TextInputType.name,
//                         hintText: 'email',
//                         onValidate: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'please enter a valid ';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       DefaultTextField(
//                         aboveFieldText: 'Password',
//                         onSaved: (newValue) {},
//                         inputType: TextInputType.visiblePassword,
//                         hintText: 'password',
//                         isObscured: true,
//                         onValidate: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'please enter a valid ';
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   )),
//               const SizedBox(
//                 height: 10,
//               ),
//               DefaultButton(
//                 elevation: 4,
//                 onTap: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     print(text);
//                   }
//                 },
//                 text: 'Register',
//                 color: primaryColor,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               IconTextButton(
//                 elevation: 2,
//                 onTap: () {},
//                 text: 'Register with Google Account',
//                 icon: FontAwesomeIcons.google,
//                 iconColor: iconColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
