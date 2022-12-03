import 'package:me_bored/models/activity.model.dart';

import '../models/filter.model.dart';

class FilterService {
  Filter filter = Filter();

  void addParticipants(Participants participants) {
    filter.participants = participants;
  }

  void addPriceMin(double price) {
    filter.priceMin = price;
  }

  void addPriceMax(double price) {
    filter.priceMax = price;
  }

  void addAccessibilityMax(double accessibility) {
    filter.accessibilityMax = accessibility;
  }

  void addAccessibilityMin(double accessibility) {
    filter.accessibilityMax = accessibility;
  }

  void addActivityType(TypeActivity type) {
    filter.type = type;
  }

  Filter getFilter() {
    return filter;
  }
}
