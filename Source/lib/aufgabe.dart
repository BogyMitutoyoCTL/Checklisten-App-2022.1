class Aufgabe {
  late bool fertig;
  late String Element;

  Aufgabe(this.fertig, this.Element);

  Aufgabe.fromJson(Map<String, dynamic> json)
      : fertig = json['fertig'],
        Element = json['Element'];

  Map<String, dynamic> toJson() => {'fertig': fertig, 'Element': Element};
}
