class CardItem {
  final String id;        // لازم id ثابت للمفضّلة
  final String price;
  final String title;
  final String location;
  final List<String> images;

  const CardItem({
    required this.id,
    required this.price,
    required this.title,
    required this.location,
    required this.images,
  });
}
