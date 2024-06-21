import 'game.dart';
import 'player.dart';
import 'psblog.dart';
import 'dart:math';

List<Game> gamesPlayed = [
  Game(
      title: 'Call of Duty Black Ops Cold War',
      lastPlayed: DateTime(2022, 4, 25),
      purchaseDate: DateTime(2022, 4, 1)),
  Game(
      title: 'FIFA 23',
      lastPlayed: DateTime(2022, 12, 21),
      purchaseDate: DateTime(2022, 9, 10)),
  Game(
      title: 'Marvel\'s Spider-Man',
      lastPlayed: DateTime(2022, 6, 23),
      purchaseDate: DateTime(2021, 3, 20)),
  Game(
      title: 'Minecraft',
      lastPlayed: DateTime(2023, 4, 28),
      purchaseDate: DateTime(2018, 4, 25)),
  Game(
      title: 'Red Dead Redemption 2',
      lastPlayed: DateTime(2023, 1, 18),
      purchaseDate: DateTime(2020, 4, 5)),
  Game(
      title: 'The Last of Us Part II',
      lastPlayed: DateTime(2023, 3, 26),
      purchaseDate: DateTime(2022, 3, 10)),
  Game(
      title: 'Uncharted 4 A Thief\'s End',
      lastPlayed: DateTime(2020, 4, 20),
      purchaseDate: DateTime(2020, 2, 28)),
  Game(
      title: 'Star Wars Jedi Survivor',
      lastPlayed: DateTime(2023, 5, 3),
      purchaseDate: DateTime(2023, 4, 28))
];

List<Game> gamesPurchased = [
  Game(
      title: 'Assassin\'s Creed Valhalla',
      lastPlayed: DateTime(2022, 4, 27),
      purchaseDate: DateTime(2022, 3, 15)),
  Game(
      title: 'FIFA 23',
      lastPlayed: DateTime(2022, 12, 21),
      purchaseDate: DateTime(2022, 9, 10)),
  Game(
      title: 'Horizon Zero Dawn',
      lastPlayed: DateTime(2021, 4, 24),
      purchaseDate: DateTime(2020, 2, 20)),
  Game(
      title: 'Ghost of Tsushima',
      lastPlayed: DateTime(2022, 4, 22),
      purchaseDate: DateTime(2022, 3, 5)),
  Game(
      title: 'Minecraft',
      lastPlayed: DateTime(2023, 4, 28),
      purchaseDate: DateTime(2018, 4, 25)),
  Game(
      title: 'The Last of Us Part II',
      lastPlayed: DateTime(2023, 3, 26),
      purchaseDate: DateTime(2022, 3, 10)),
  Game(
      title: 'Watch Dogs Legion',
      lastPlayed: DateTime(2022, 4, 19),
      purchaseDate: DateTime(2022, 4, 8)),
  Game(
      title: 'Star Wars Jedi Survivor',
      lastPlayed: DateTime(2023, 5, 3),
      purchaseDate: DateTime(2023, 4, 28))
];

List<String> trendingGames = [
  'Grand Theft Auto V',
  'FIFA 23',
  'Marvel\'s Spider-Man 2',
  'Fall Guys',
  'Red Dead Redemption 2',
  'Star Wars Battlefront II',
  'Rainbow Six Siege',
  'Star Wars Jedi Survivor',
  'Hogwarts Legacy',
  'Ghost of Tsushima',
  'God of War Ragnarok',
  'Ratchet and Clank Rift Apart',
];
List<String> games = [
  'Call of Duty Black Ops Cold War',
  'FIFA 23',
  'Marvel\'s Spider-Man',
  'Minecraft',
  'The Last of Us Part II',
  'Uncharted 4 A Thief\'s End',
  'Assassin\'s Creed Valhalla',
  'Horizon Zero Dawn',
  'Watch Dogs Legion',
  'God of War',
  'Grand Theft Auto V',
  'Final Fantasy VII Remake',
  'Resident Evil Village',
  'Demon\'s Souls',
  'Ratchet & Clank: Rift Apart',
  'Cyberpunk 2077',
  'Hitman 3',
  'Deathloop',
  'Returnal',
  'Far Cry 5',
  'The Witcher 3 Wild Hunt',
  'Borderlands 3',
  'Doom Eternal',
  'Rainbow Six Siege',
  'Death Stranding',
  'Crash Bandicoot 4 It\'s About Time',
  'Bloodborne',
  'Destiny 2',
  'The Elder Scrolls V Skyrim',
  'No Man\'s Sky',
  'Metal Gear Solid V The Phantom Pain',
  'Fallout 4',
  'Watch Dogs Legion',
  'Batman Arkham Knight',
  'Fortnite',
  'Apex Legends',
  'Bioshock Infinite',
  'Dark Souls III',
  'Mass Effect Legendary Edition',
  'Devil May Cry 5',
  'Nier Automata',
  'Crash Bandicoot N. Sane Trilogy',
  'Days Gone',
  'Gran Turismo Sport',
  'Injustice 2',
  'Shadow of the Tomb Raider',
  'Mafia Definitive Edition',
  'Yakuza Like a Dragon',
  'Bioshock The Collection',
  'Crash Team Racing Nitro-Fueled',
  'Uncharted The Nathan Drake Collection',
  'Marvel\'s Spider-Man 2',
  'Red Dead Redemption 2',
  'Star Wars Battlefront II',
  'Star Wars Jedi Survivor',
  'Hogwarts Legacy',
  'Ghost of Tsushima',
  'God of War Ragnarok',
];

List<Player> players = [
  for (int i = 1; i <= 100; i++)
    Player(
      name: generateUsername(),
      imagePath: 'assets/images/avatars/avatar${Random().nextInt(50) + 1}.jpg',
    ),
];
List<Player> playersYouMayKnow = [
  for (int i = 1; i <= 10; i++)
    Player(
      name: generateUsername(),
      imagePath: 'assets/images/avatars/avatar${Random().nextInt(50) + 1}.jpg',
    ),
];

String generateUsername() {
  final random = Random();
  final adjectives = [
    'Adventurous',
    'Brave',
    'Clever',
    'Daring',
    'Energetic',
    'Fearless',
    'Gentle',
    'Honest',
    'Intrepid',
    'Jovial',
    'Happy',
    'Sad',
    'Magic',
    'Master',
    'Legendary'
  ];
  final nouns = [
    'Warrior',
    'Wizard',
    'Knight',
    'Rogue',
    'Sorcerer',
    'Champion',
    'Hunter',
    'Ranger',
    'Gladiator',
    'Assassin',
    'Player',
    'Gamer',
    'Legend'
  ];

  final randomAdjective = adjectives[random.nextInt(adjectives.length)];
  final randomNoun = nouns[random.nextInt(nouns.length)];
  final randomNumber = random.nextInt(10000);

  return '$randomAdjective$randomNoun$randomNumber';
}

List<Article> news = [
  Article(
      title: 'The Lord of the Rings: Gollum',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/the-lord-of-the-rings-gollum-tmop-image-block-01-en-26apr23?\$800px\$',
      date: 'May 25, 2023',
      text:
          'Taking place parallel to the events of The Fellowship of the Ring™, The Lord of the Rings: Gollum is an epic, interactive action-adventure set in J. R. R. Tolkien\'s iconic literary world. Play as the enigmatic Gollum on a perilous journey and discover how he outwitted the most powerful characters in Middle-earth.'),
  Article(
      title: 'Convergence: A League of Legends Story',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/convergence-tmop-image-block-01-en-26apr23?\$800px\$',
      date: 'May 23, 2023',
      text:
          'Explore and traverse the spectacular city of Zaun (League of Legends, Arcane) as Ekko, a young inventor with an ingenious device that can manipulate time. Convergence is a story-driven, 2D action-platformer that focuses on tight dynamic combat and unique exploration opportunities afforded by Ekko\'s ability to travel in space and time.'),
  Article(
      title: 'Lego 2K Drive',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/lego-2k-drive-tmop-image-block-01-en-26apr23?\$800px\$',
      date: 'May 19, 2023',
      text:
          'Welcome to Bricklandia, home of a massive open-world LEGO® driving adventure. Race anywhere, play with anyone, build your dream rides, and defeat a cast of wild racing rivals for the coveted Sky Trophy! Get behind the wheel of awesome transforming vehicles that give you the freedom to speed seamlessly across riveting racetracks, off-road terrain and open waters.'),
  Article(
      title: 'New Gran Turismo movie trailer',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-spe-video-thumbnail-01-en-28apr23?\$0px\$',
      date: 'May 2, 2023',
      text:
          'Watch the latest trailer for Gran Turismo. Exclusively in movie theaters this summer.'),
  Article(
      title: 'Star Wars Jedi: Survivor',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-survivor-tmop-image-block-01-en-16mar23?\$native\$',
      date: 'April 28, 2023',
      text:
          'Evade the Empire and survive as one of the last remaining Jedi in the galaxy. STAR WARS Jedi: Survivor™ picks up five years after the events of STAR WARS Jedi: Fallen Order™. Cal must stay one step ahead of the Empire\'s constant pursuit as he continues to feel the weight of being one of the last remaining Jedi in the galaxy.'),
  Article(
      title: 'The best open-world games on PS4 and PS5',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/open-world-games-keyart-01-en-01mar23?\$800px\$',
      date: 'March 1, 2023',
      text:
          'Explore some of the most immersive and expansive open worlds on the PlayStation consoles.'),
  Article(
      title: '20 must-play blockbusters in the PlayStation Plus Game Catalogue',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/ps-plus-extra-must-play-keyart-01-en-09nov22?\$800px\$',
      date: 'November 9, 2022',
      text:
          'From competitive tactical shooters to legendary RPGs, experience some of the biggest, most critically lauded gaming blockbusters with PlayStation Plus.'),
  Article(
      title: 'Building the ultimate PS5 gaming set-up',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/ultimate-gaming-setup-keyart-01-en-24oct22?\$800px\$',
      date: 'October 24, 2022',
      text:
          'From the best TVs and sound systems for gaming, to handy additional extras, create a home gaming set up to the leave the competition in the dust.'),
  Article(
      title: 'The best single player adventures on PS4 and PS5',
      imageUrl:
          'https://gmedia.playstation.com/is/image/SIEPDC/single-player-action-keyart-01-en-21oct22?\$800px\$',
      date: 'October 21, 2022',
      text:
          'From the far future to ancient myth, discover the most compelling single-player, story-driven adventures to be had on PS4 and PS5.'),
];
