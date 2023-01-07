enum Participants { one, group }
enum TypeActivity { education, cooking, recreational, charity, relaxation, music, busywork, social, diy, any }

final ACCESSIBILITY_MAX = 3;
final COST_MAX = 3;

class Activity {
  String title;
  TypeActivity type;
  Participants participants;
  double cost;
  double accessibility;

  Activity(this.title, this.type, this.participants, this.cost, this.accessibility);

  static TypeActivity fromTypeActivityString(String typeActivity) {
    print("typeActivity==========:");
    //
    print(typeActivity);
    print(TypeActivity.values);
    var foundTypeActivity = TypeActivity.values.firstWhere((e) => e.name == typeActivity);
    return foundTypeActivity;
  }

  static Participants fromParticipantsNumber(int participants) {
    if (participants < 1) {
      return Participants.one;
    }
    return Participants.group;
  }

  static int proportionalizeForDisplay(double value) {
   // Either ACCESSIBILITY_MAX or COST_MAX, they are all 3
    return (value * ACCESSIBILITY_MAX).floor();
  }
}
