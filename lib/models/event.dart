class Event {
  String title;
  String? description;
  Genre? eventGenre;
  Type? eventType;
  DateTime? date;
  int? duration;
  Level? eventLevel;
  int? playersNumber;

  Event({
    required this.title,
    this.description,
    this.eventGenre,
    this.eventType,
    this.date,
    this.duration,
    this.eventLevel,
    this.playersNumber,
  });
  
}
enum Genre {
  horror,    
  adventure, 
  romance,   
  mystery,   
  sciFi      
}

enum Type {
  dungeonAndDragons, 
  callOfCthulhu, 
  vampireTheMasquerade
}

enum Level {
  beginner,
  intermediate,
  advanced,
  pro
}
