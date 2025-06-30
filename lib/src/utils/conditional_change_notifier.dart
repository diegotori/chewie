import 'package:flutter/foundation.dart';

///
/// A [ChangeNotifier] that only calls [notifyListeners] if there are
/// registered listeners.
///
/// This class extends [ChangeNotifier] and provides a modified version
/// of [notifyListeners]  called [maybeNotifyListeners].
/// This method checks if there are any active listeners
/// before calling the original [notifyListeners], ensuring that resources
/// are not wasted when no listeners are interested in updates.
///
/// Example:
/// ```dart
/// class MyModel extends ConditionalChangeNotifier {
///   int _counter = 0;
///
///   int get counter => _counter;
///
///   void increment() {
///     _counter++;
///     maybeNotifyListeners(); // Only calls if there are listeners.
///   }
/// }
///
/// void main() {
///   final model = MyModel();
///
///   model.addListener(() {
///     print('Counter: ${model.counter}');
///   });
///
///   model.increment(); // Output: Counter: 1
///   model.increment(); // Output: Counter: 2
///
///   // Remove the listener
///   model.removeListener(() {
///     print('Counter: ${model.counter}');
///   });
///   model.increment(); // Nothing is printed
/// }
/// ```
///
class ConditionalChangeNotifier extends ChangeNotifier {
  /// Notifies listeners if there are any.
  ///
  /// This method checks if there are any registered listeners
  /// (using [hasListeners]) before calling the original [notifyListeners]
  /// method.
  /// This prevents unnecessary computations and side effects when
  /// no listeners are present.
  void maybeNotifyListeners() {
    if (hasListeners) {
      notifyListeners();
    }
  }
}
