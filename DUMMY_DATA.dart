// // card data can be replace the category or the school level
// const CARD_DATA = [
//   {
//     id: 1,
//     title: "مجموعة كتب الامتحان",
//     image: "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
//     price: 0,
//     grade: "secondary",
//     educationLevel: 1,
//     location: "المنصورة",
//     destination:
//       "يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى أن ",

//     createdAt: "2023-10-23T20:38:28.401Z",
//     updatedAt: "2023-10-23T20:38:28.401Z",
//   },
//   {
//     id: 2,
//     title: "مجموعة كتب الامتحان",
//     image: "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
//     price: 0,
//     grade: "secondary",
//     educationLevel: 1,
//     location: "المنصورة",
//     destination:
//       "يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى أن ",

//     createdAt: "2023-10-23T20:38:28.401Z",
//     updatedAt: "2023-10-23T20:38:28.401Z",
//   },
//   {
//     id: 3,
//     title: "مجموعة كتب الامتحان",
//     image: "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
//     price: 0,
//     grade: "secondary",
//     educationLevel: 1,
//     location: "المنصورة",
//     destination:
//       "يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى أن ",

//     createdAt: "2023-10-23T20:38:28.401Z",
//     updatedAt: "2023-10-23T20:38:28.401Z",
//   },
//   {
//     id: 4,
//     title: "مجموعة كتب الامتحان",
//     image: "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
//     price: 0,
//     grade: "secondary",
//     educationLevel: 1,
//     location: "المنصورة",
//     destination:
//       "يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى أن ",

//     createdAt: "2023-10-23T20:38:28.401Z",
//     updatedAt: "2023-10-23T20:38:28.401Z",
//   },
//   {
//     id: 5,
//     title: "مجموعة كتب الامتحان",
//     image: "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
//     price: 50,
//     grade: "secondary",
//     educationLevel: 1,
//     location: "المنصورة",
//     destination:
//       "يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى أن ",

//     createdAt: "2023-10-23T20:38:28.401Z",
//     updatedAt: "2023-10-23T20:38:28.401Z",
//   },
//   {
//     id: 6,
//     title: "مجموعة كتب الامتحان",
//     image: "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
//     price: 0,
//     grade: "secondary",
//     educationLevel: 1,
//     location: "المنصورة",
//     destination:
//       "يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى أن ",

//     createdAt: "2023-10-23T20:38:28.401Z",
//     updatedAt: "2023-10-23T20:38:28.401Z",
//   },
// ];

// const POST_DATA = [
//   {
//     id: 1,
//     title: "مجموعة كتب الامتحان",
//     images: [
//       "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
//       "https://elghazawy.com/storage/139006/IMG_20230101_134610.webp",
//       "https://modarsonline.com/images/2020/02/18/talb_online_20200218142942_65177_22272.jpg",
//     ],
//     price: 56,
//     offer: "معروض",
//     locationName: "المنصورة",
//     destination:
//       "يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى أن ",

//     bookDetails: {
//       educationLevel: 1,
//       grade: "Preparatory",
//       educationType: "عام",
//       academicYear: "2020-2021",
//       term: 1,
//       identificationNumber: 24112017758484,
//       adId: 1256,
//     },
//     userDetails: {
//       locationOnMap: "https://www.google.com/maps/d/embed?mid=1eauFGY7rU9t4zDOZH0aOntQ5ENg&hl=en&ehbc=2E312F",
//       userName: "Twinks Ashraf",
//       userGender: "Male",
//       userId: "5582964944596898298",
//     },
//     createdAt: "2023-10-23T20:38:28.401Z",
//     updatedAt: "2023-10-23T20:38:28.401Z",
//   },
// ];
