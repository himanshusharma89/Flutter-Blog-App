import 'package:blog_app/widgets/page_view.dart';

List<Map<String, dynamic>> contributors = const <Map<String, dynamic>>[
  {
    "login": "shubham-chhimpa",
    "name": "Shubham Chhimpa",
    "avatar_url": "https://avatars0.githubusercontent.com/u/38981756?v=4",
    "profile": "https://www.linkedin.com/in/shubhamchhimpa/",
    "contributions": ["code"]
  },
  {
    "login": "carlosfrodrigues",
    "name": "Carlos Felix",
    "avatar_url": "https://avatars3.githubusercontent.com/u/18339454?v=4",
    "profile": "http://carlosfelix.pythonanywhere.com/",
    "contributions": ["design"]
  },
  {
    "login": "derangga",
    "name": "Dimas Rangga",
    "avatar_url": "https://avatars2.githubusercontent.com/u/31648630?v=4",
    "profile": "https://medium.com/@derangga",
    "contributions": ["code"]
  },
  {
    "login": "arbazdiwan",
    "name": "Arbaz Mustufa Diwan",
    "avatar_url": "https://avatars3.githubusercontent.com/u/24837320?v=4",
    "profile": "https://github.com/arbazdiwan",
    "contributions": ["code"]
  },
  {
    "login": "Mrgove10",
    "name": "Adrien",
    "avatar_url": "https://avatars0.githubusercontent.com/u/25491408?v=4",
    "profile": "http://www.adrienrichard.com/",
    "contributions": ["code"]
  },
  {
    "login": "Wizpna",
    "name": "Promise Amadi",
    "avatar_url": "https://avatars2.githubusercontent.com/u/15036164?v=4",
    "profile": "https://promise.hashnode.dev/",
    "contributions": ["design"]
  },
  {
    "login": "daruanugerah",
    "name": "Daru Anugerah Setiawan",
    "avatar_url": "https://avatars2.githubusercontent.com/u/20470960?v=4",
    "profile": "https://linkedin.com/in/daruanugerah",
    "contributions": ["design"]
  },
  {
    "login": "yash2189",
    "name": "Yash Ajgaonkar",
    "avatar_url": "https://avatars2.githubusercontent.com/u/31548778?v=4",
    "profile": "https://www.linkedin.com/in/yash-ajgaonkar-289520168/?",
    "contributions": ["doc"]
  },
  {
    "login": "Dhruv-Sachdev1313",
    "name": "Dhruv Sachdev",
    "avatar_url": "https://avatars0.githubusercontent.com/u/56223242?v=4",
    "profile": "https://github.com/Dhruv-Sachdev1313",
    "contributions": ["code"]
  },
  {
    "login": "Janhavi23",
    "name": "Janhavi",
    "avatar_url": "https://avatars3.githubusercontent.com/u/56731465?v=4",
    "profile": "https://github.com/Janhavi23",
    "contributions": ["code", "design"]
  },
  {
    "login": "Saransh-cpp",
    "name": "Saransh Chopra",
    "avatar_url": "https://avatars.githubusercontent.com/u/74055102?v=4",
    "profile": "https://github.com/Saransh-cpp",
    "contributions": ["design", "doc"]
  }
];

/// SOCIAL LINKS

List<Map<String, String>> social = const <Map<String, String>>[
  {
    'URL': 'https://github.com/himanshusharma89',
    'iconURL': 'https://img.icons8.com/fluent/50/000000/github.png'
  },
  {
    'URL': 'https://twitter.com/_SharmaHimanshu',
    'iconURL': 'https://img.icons8.com/color/48/000000/twitter.png'
  },
  {
    'URL': 'https://www.linkedin.com/in/himanshusharma89/',
    'iconURL': 'https://img.icons8.com/color/48/000000/linkedin.png'
  },
];

List<PageViewWidget> introSlider = const <PageViewWidget>[
  PageViewWidget(
    text: 'Do you have ideas that you want to pen down?',
    image: 'Blog3.png',
  ),
  PageViewWidget(
    text: 'Looking for a spot to write blogs?',
    image: 'Blog2.png',
  ),
  PageViewWidget(
    text:
        'You came to the right place!\nWrite, read and even fetch articles from internet!',
    image: 'Blog1.jpg',
  ),
];
