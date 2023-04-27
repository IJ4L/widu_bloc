String replaceTags(String text) {
  text = text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  return text;
}
