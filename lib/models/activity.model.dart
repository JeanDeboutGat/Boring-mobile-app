enum Participants { one, group }

enum TypeActivity { education, cooking, recreational, charity, relaxation, music, busywork, any }

class Activity {
  String title;
  TypeActivity type;
  Participants participants;
  int cost;
  int accessibility;

  Activity(this.title, this.type, this.participants, this.cost, this.accessibility);
}
