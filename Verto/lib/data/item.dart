class Item {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Item({
    required this.id,
    required this.title,
    required this.userId,
    required this.completed,
  });
}