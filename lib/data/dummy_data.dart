import '/models/products.dart';

class DummyProducts{
  static List<Product> all =[
    const Product(
      id: 1,
      name: 'VORTEX V1 THREAD',
      description: 'HEAVY DUTY URBAN ARMOUR',
      price: 10.0,
      size: 'M',
      imageUrl: 'lib/assests/images/blackshoes.jpeg',
      isLimitedEdition: true,
      color: 'Red',
    ),
    const Product(
      id: 2,
      name: 'TACTICAL PACK',
      description: 'Compact design that somehow holds your entire personality.',
      price: 20.0,
      size: 'L',
      imageUrl: 'lib/assests/images/tactical.jpeg',
      isLimitedEdition: true,
      color: 'Blue',
    ),
    const Product(
      id: 3,
      name: 'ECLIPES SHADES',
      description: 'Rugged construction for maximum “classified eyewear” protection.',
      price: 70.0,
      imageUrl: 'lib/assests/images/shades2.jpeg',
      isLimitedEdition: false,
      color: 'Green',
    ),
    const Product(
      id: 4,
      name: 'ULTRA RUNNER SHOES',
      description: 'perfect for escaping awkward conversations, or dramatically running toward absolutely nothing.',
      price: 300.0,
      size: 'S',
      imageUrl: 'lib/assests/images/shoes2.jpeg',
      isLimitedEdition: false,
      color: 'Green',
    ),
    const Product(
      id: 5,
      name: 'TEch LITE JACKET',
      description: 'Lightweight Armor for Daily Chaos.',
      price: 30.0,
      size: 'S',
      imageUrl: 'lib/assests/images/jacket.jpeg',
      isLimitedEdition: false,
      color: 'Green',
    ),
    const Product(
      id: 6,
      name: 'NEON GOGGLES',
      description: 'Glow Hard. See Everything.',
      price: 30.0,

      imageUrl: 'lib/assests/images/neon.jpeg',
      isLimitedEdition: false,
      color: 'Green',
    ),
    const Product(
      id: 7,
      name: 'Cyber Goggles',
      description: 'See Tomorrow. Look Dangerous.',
      price: 50.0,

      imageUrl: 'lib/assests/images/cyber.png',
      isLimitedEdition: false,
      color: 'Green',
    ),


  ];
}

