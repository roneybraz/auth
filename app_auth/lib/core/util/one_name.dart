String? oneName(String? value) {
  if (value != null) {
    List<String> name = value.split(" ");
    return name[0];
  }
  return "";
}
