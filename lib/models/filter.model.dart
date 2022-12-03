import 'activity.model.dart';

class Filter {
  TypeActivity type = TypeActivity.any; // TODO find a better way to use union type in dart
  double priceMin = 0;
  double priceMax = 1;
  Participants participants = Participants.group;
  double accessibilityMin = 0;
  double accessibilityMax = 1;
}

class FilterType {
  TypeActivity name;
  String image;

  FilterType(this.name, this.image);

  @override
  bool operator ==(Object other) => other is FilterType && (other.name == name && other.image == image);

  @override
  int get hashCode => name.hashCode;
}
