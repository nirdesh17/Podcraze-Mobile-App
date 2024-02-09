class IntroContent {
  String image;
  String description;
  IntroContent({
    required this.image,
    required this.description,
  });
}

List<IntroContent> contents=[
  IntroContent(
    image: 'assets/images/onboarding 1.png', 
    description: "Welcome to Podcraze, the best podcast app for you."),
  IntroContent(
    image: 'assets/images/onboarding 2.png',
    description: "Discover and listen to your favorite podcasts."),
  IntroContent(
    image: 'assets/images/onboarding 3.png',
    description: "Create your own playlist and enjoy your favorite podcasts."),
];


