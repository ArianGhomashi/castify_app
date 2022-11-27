class AudioBook {
  String name;
  String author;
  String? narrator;
  String imagePath;
  Duration? total;
  Duration? progress;

  AudioBook({
    required this.name,
    required this.author,
    this.narrator,
    required this.imagePath,
    this.total,
    this.progress,
  });
}
