class Place {
  String? title;
  String? subTitle;
  String? description;
  String? distance;

  Place(String title, String subTitle, String description, String distance) {
    this.title = title;
    this.subTitle = subTitle;
    this.description = description;
    this.distance = distance;
  }

  static List<Place> getDummyData()  {
    List<Place> dummy = [
      Place(
        "개인택시",
        "서비스업",
        "강원도 춘천시 후석로441번길 7102동 101호(후평동 동산A)",
        "0.1km"
      ),
      Place(
          "개인택시",
          "서비스업",
          "강원도 춘천시 후석로441번길 7101동 403호(후평동 동산A)",
          "0.2km"
      ),
      Place(
          "빽다방",
          "카페",
          "강원도 춘천시 후석로441번길 7102동 103호(후평동 동산A)",
          "0.3km"
      ),
      Place(
          "한림대학교",
          "대학교",
          "강원도 춘천시 후석로441번길 7102동 104호(후평동 동산A)",
          "0.5km"
      ),
      Place(
          "HCI 기말프로젝트",
          "노가다",
          "강원도 춘천시 후석로441번길 7102동 105호(후평동 동산A)",
          "1km"
      ),
      Place(
          "플러터",
          "노가다",
          "강원도 춘천시 후석로441번길 7102동 106호(후평동 동산A)",
          "2.1km"
      ),
    ];
    return dummy;
  }
}

