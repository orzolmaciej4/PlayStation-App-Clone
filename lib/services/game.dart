class Game {
  final String title;
  final DateTime lastPlayed;
  final DateTime purchaseDate;

  Game({
    required this.title,
    required this.lastPlayed,
    required this.purchaseDate,
  });
}

List<Game> sortGamesAlphabetically(List<Game> games) {
  games.sort((a, b) => a.title.compareTo(b.title));
  return games;
}

List<Game> sortGamesReverseAlphabeticalOrder(List<Game> games) {
  games.sort((a, b) => b.title.compareTo(a.title));
  return games;
}

List<Game> sortGamesByLastPlayed(List<Game> games) {
  games.sort((a, b) => b.lastPlayed.compareTo(a.lastPlayed));
  return games;
}

List<Game> sortGamesByPurchaseDate(List<Game> games) {
  games.sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));
  return games;
}
