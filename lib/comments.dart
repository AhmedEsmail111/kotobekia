//  Wrap(
                      
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width / 2.5,
//                           child: RadioListTile(
//                             contentPadding: const EdgeInsets.all(0),
//                             dense: true,
//                             title: Container(
//                               height: 40.h,
//                               width: MediaQuery.of(context).size.width / 2,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   color: whiteColor,
//                                   borderRadius: BorderRadius.circular(14)),
//                               child: Text(
//                                 homeCubit.termDropDownItems[0],
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .displayMedium!
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ),
//                             value: homeCubit.termDropDownItems[0],
//                             groupValue: homeCubit.selectedTem,
//                             onChanged: (term) {
//                               if (term == null) {
//                                 return;
//                               }
//                               homeCubit.changeTerm(term);
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width / 2.5,
//                           child: RadioListTile(
//                             contentPadding: const EdgeInsets.all(0),
//                             dense: true,
//                             title: Container(
//                               height: 40.h,
//                               width: MediaQuery.of(context).size.width / 2,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   color: whiteColor,
//                                   borderRadius: BorderRadius.circular(14)),
//                               child: Text(
//                                 homeCubit.termDropDownItems[1],
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .displayMedium!
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ),
//                             value: homeCubit.termDropDownItems[1],
//                             groupValue: homeCubit.selectedTem,
//                             onChanged: (term) {
//                               if (term == null) {
//                                 return;
//                               }
//                               homeCubit.changeTerm(term);
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width / 2.5,
//                           child: RadioListTile(
//                             contentPadding: const EdgeInsets.all(0),
//                             dense: true,
//                             title: Container(
//                               width: MediaQuery.of(context).size.width / 2,
//                               height: 40.h,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 color: whiteColor,
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                               child: Text(
//                                 homeCubit.termDropDownItems[2],
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .displayMedium!
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ),
//                             value: homeCubit.termDropDownItems[2],
//                             groupValue: homeCubit.selectedTem,
//                             onChanged: (term) {
//                               if (term == null) {
//                                 return;
//                               }
//                               homeCubit.changeTerm(term);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),