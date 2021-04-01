
class TimeTool {
  
  int duration;
  Function(int count) callback;

  static TimeTool begin({int duration, Function(int count) callback}) {
    final tool = TimeTool();
    tool.duration = duration;
    tool.callback = callback;
    tool._begin();
    return tool;
  }

  void _begin() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      duration -= 1;
      if(duration >= 0){
        _begin();
        if(callback != null) callback(duration);
      }
    });
  }

  void stop() {
    duration = 0;
  }
  
}