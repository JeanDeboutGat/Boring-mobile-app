import 'activity.dart';

class FilterItem {
  TypeActivity type;
  String image;

  FilterItem(this.type, this.image);

  @override
  bool operator ==(Object other) => other is FilterItem && (other.type == type && other.image == image);

  @override
  int get hashCode => type.hashCode;
}
