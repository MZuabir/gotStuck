class onBoardingContent {
  String image;
  String text;

  onBoardingContent({
    required this.image,
    required this.text,
  });
}

List<onBoardingContent> contents = [
  onBoardingContent(
      image: 'assets/images/onBoard/intro.png',
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
  onBoardingContent(
      image: 'assets/images/onBoard/onboardImage2.png',
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
  onBoardingContent(
      image: 'assets/images/onBoard/onboardImage3.png',
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
];
