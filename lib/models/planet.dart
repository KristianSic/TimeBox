class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.description,
    required this.images,
  });
}

List<PlanetInfo> planetInfo = [
  PlanetInfo(1,
      name: 'Pandora',
      iconImage: 'assets/box_1.png',
      description: "The Pandora's Box",
      images: []),
  PlanetInfo(2,
      name: 'Alcatraz',
      iconImage: 'assets/box_2.png',
      description: "Alcatraz Island, prison",
      images: []),
  PlanetInfo(3,
      name: 'Arkham',
      iconImage: 'assets/box_3.png',
      description: "The Arkham Asylum",
      images: []),
  PlanetInfo(4,
      name: 'Covenant',
      iconImage: 'assets/box_4.png',
      description: "The Ark of the Covenant",
      images: []),
];
