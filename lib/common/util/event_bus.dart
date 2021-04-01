typedef void EventCallback(arg);
class EventKeys {
  static const String JumtoTeam = "JumtoTeam"; // 添加成功之后刷新API
  static const String Login = "JUMP_TO_LOGIN"; // 跳到登录
  static const String RefreshAuth = "RefreshAuth"; // 跳到登录
  static const String RefreshQrCode = "RefreshQrCode"; // 跳到登录
  static const String RereshHome = "RereshHome"; // 跳到登录
  static const String RefreshMine = "RefreshMine"; // 跳到登录
  static const String RefreshLoading = "RefreshLoading";
}

class EventBus {
  factory EventBus() => _getInstance();
  static EventBus get instance => _getInstance();
  static EventBus _instance;
  
  EventBus._internal(){
    // init
  }
  static EventBus _getInstance() {
    if(_instance == null) {
      _instance = EventBus._internal();
    }
    return _instance;
  }

  Map<String, EventCallback> _events = {};

  // 添加监听
  void addListener(String eventkey, EventCallback callback) {
    if(eventkey == null || callback == null) return;
    _events[eventkey] = callback;
  }

  // 移除监听
  void removeListener(String eventKey) {
    if(eventKey == null) return;
    _events.remove(eventKey);
  }

  void commit(String eventKey, Object arg) {
    if(eventKey == null) return;
    EventCallback callback = _events[eventKey];
    if(callback != null) {
      callback(arg);
    }
  }
}