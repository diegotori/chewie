import 'package:chewie/src/utils/index.dart';

///
/// The new State-Manager for Chewie!
/// Has to be an instance of Singleton to survive
/// over all State-Changes inside chewie
///
class PlayerNotifier extends ConditionalChangeNotifier {
  PlayerNotifier._(bool hideStuff) : _hideStuff = hideStuff;

  bool _hideStuff;

  bool get hideStuff => _hideStuff;

  set hideStuff(bool value) {
    _hideStuff = value;
    maybeNotifyListeners();
  }

  // ignore: prefer_constructors_over_static_methods
  static PlayerNotifier init() {
    return PlayerNotifier._(true);
  }
}
