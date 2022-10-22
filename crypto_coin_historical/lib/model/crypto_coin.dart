class CryptoCoin {
  String id;
  String name;
  String symbol;
  int rank;
  bool isNew;
  bool isActive;
  String type;

  CryptoCoin(
      {
        required this.id,
        required this.name,
        required this.symbol,
        required this.rank,
        required this.isNew,
        required this.isActive,
        required this.type}
      );

  static CryptoCoin getMockObject() {
    return CryptoCoin(
        id: "btc-bitcoin",
        name: "Bitcoin",
        symbol: "BTC",
        rank: 1,
        isNew: false,
        isActive: true,
        type: "coin");
  }

  static List<CryptoCoin> getMockObjects() {
    List<CryptoCoin> cryptos = [];
    cryptos.add(CryptoCoin(
        id: "btc-bitcoin",
        name: "Bitcoin",
        symbol: "BTC",
        rank: 1,
        isNew: false,
        isActive: true,
        type: "coin"));
    cryptos.add(CryptoCoin(
        id: "btc-bitcoin",
        name: "Bitcoin",
        symbol: "BTC",
        rank: 1,
        isNew: false,
        isActive: true,
        type: "coin"));
    cryptos.add(CryptoCoin(
        id: "btc-bitcoin",
        name: "Bitcoin",
        symbol: "BTC",
        rank: 1,
        isNew: false,
        isActive: true,
        type: "coin"));
    return cryptos;
  }
}
