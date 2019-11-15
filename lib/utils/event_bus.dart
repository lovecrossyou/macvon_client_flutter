import 'package:event_bus/event_bus.dart';

/// 创建EventBus
EventBus eventBus = EventBus();

/// Event 修改主题色
class ThemeColorEvent {
  String colorStr;
  ThemeColorEvent(this.colorStr);
}

class LoginEvent {
  bool loginState;
}