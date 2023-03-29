class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    image: "assets/images/reports.png",
    title: "Keep Your Health Records Safe and Organized",
    description: "With MediVault, you can easily store and access all of your health records in one secure location. MediVault keeps everything organized and provides you with instant analysis and insights into your health."
  ),
  OnboardingContent(
      image: "assets/images/hospital.png",
      title: "Instant Analysis and Health Progress Tracking",
      description: " Hospitals can easily add your medical records to your MediVault account. With MediVault, you can track your health progress over time and work with your healthcare provider to make informed decisions about your health."
  ),
];