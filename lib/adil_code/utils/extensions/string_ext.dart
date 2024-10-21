extension AssetExtension on String {
  String get pngIcon => 'assets/icons/$this.png';

  String get svgIcon => 'assets/icons/$this.svg';

  String get jsonIcon => 'assets/icons/$this.json';

  String get pngImage => 'assets/images/$this.png';

  String get svgImage => 'assets/images/$this.svg';

  String get jsonImage => 'assets/images/$this.json';

  String get json => 'assets/jsons/$this.json';
}
