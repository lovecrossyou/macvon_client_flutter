import 'package:mobx/mobx.dart';

// Include generated file
part 'budget.g.dart';

// This is the class used by rest of your codebase
class Budget = _Budget with _$Budget;

// The store-class
abstract class _Budget with Store {
  @observable
  int value = 0;
  @action
  void increment() {
    value++;
  }
}
