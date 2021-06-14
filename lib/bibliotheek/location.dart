class Location {
  final String countryName;
  final String zoneName;
  final int gmtOffset;
  final int currentTime;

  Location({
    this.countryName,
    this.zoneName,
    this.gmtOffset,
    this.currentTime
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      countryName: json['countryName'],
      zoneName: json['zoneName'],
      gmtOffset: json['gmtOffset'],
      currentTime: json['timestamp']
    );
  }
}
