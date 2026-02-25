class ApiRoutes {
  final baseUrl = "https://localhost:7016/api/v1/";

  final event = "Event/";

  final character = "Character/";

  final story = "Story/";

  String get eventUrl => baseUrl + event;

  String get characterUrl => baseUrl + character;
  
  String get storyUrl => baseUrl + story;
  
  }
