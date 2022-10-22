class CryptoDetails {
  String timestamp;
  num price;
  int volume_24h;
  num marketCap;

  CryptoDetails(
      {
        required this.timestamp,
        required this.price,
        required this.volume_24h,
        required this.marketCap}
      );

  static CryptoDetails getMokcObject() {
    return CryptoDetails(
        timestamp: "timestamp", price: 0.0, volume_24h: 1, marketCap: 1);
        //timestamp: 2015-01-01T00:00:00Z, price: , volume_24h: 13035823, market_cap
  }

  static List<CryptoDetails> getMockObjects() {
    List<CryptoDetails> cryptos = [];
    cryptos.add(CryptoDetails(
        timestamp: "timestamp", price: 0.01, volume_24h: 1000, marketCap: 1));
    cryptos.add(CryptoDetails(
        timestamp: "timestamp", price: 0.02, volume_24h: 2000, marketCap: 2));
    cryptos.add(CryptoDetails(
        timestamp: "timestamp", price: 0.03, volume_24h: 3000, marketCap: 3));
    return cryptos;
  }
}
