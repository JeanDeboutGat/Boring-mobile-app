enum Participants { one, group }

enum TypeActivity { education, cooking, recreational, charity, relaxation, music, busywork }

class Activity {
  TypeActivity type;
  Participants participants;
  int cost;
  int accessibility;

  Activity(this.type, this.participants, this.cost, this.accessibility);
}
