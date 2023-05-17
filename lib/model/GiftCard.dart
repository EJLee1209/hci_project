class GiftCard {
  String? image;
  String? title;
  String? description;
  bool isFavorite = false;

  GiftCard(String image, String title, String description, bool isFavorite) {
    this.image = image;
    this.title = title;
    this.description = description;
    this.isFavorite = isFavorite;
  }
}