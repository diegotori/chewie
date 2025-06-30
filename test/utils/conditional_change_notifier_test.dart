import 'package:chewie/src/utils/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConditionalChangeNotifier', () {
    test(
        'maybeNotifyListeners should not call notifyListeners when there are no listeners',
        () {
      final notifier = ConditionalChangeNotifier();
      var notifyListenersCalled = false;

      // Add a listener and keep track of the listener.
      void listener() => notifyListenersCalled = true;
      notifier.addListener(listener);
      //remove the listener.
      notifier.removeListener(listener);

      notifier.maybeNotifyListeners();

      expect(notifyListenersCalled, isFalse);
    });

    test(
        'maybeNotifyListeners should call notifyListeners when there are listeners',
        () {
      final notifier = ConditionalChangeNotifier();
      var notifyListenersCalled = false;

      // Mock the notifyListeners method to track if it's called
      notifier.addListener(() => notifyListenersCalled = true);

      notifier.maybeNotifyListeners();

      expect(notifyListenersCalled, isTrue);
    });

    test(
        'maybeNotifyListeners should call notifyListeners multiple times when there are listeners',
        () {
      final notifier = ConditionalChangeNotifier();
      var notifyListenersCalledCount = 0;

      // Mock the notifyListeners method to track how many times it's called
      notifier.addListener(() => notifyListenersCalledCount++);

      notifier.maybeNotifyListeners();
      notifier.maybeNotifyListeners();
      notifier.maybeNotifyListeners();

      expect(notifyListenersCalledCount, equals(3));
    });

    test(
        'maybeNotifyListeners should not call notifyListeners when all listeners are removed',
        () {
      final notifier = ConditionalChangeNotifier();
      var notifyListenersCalled = false;

      // Add a listener and keep track of the listener.
      void listener() => notifyListenersCalled = true;
      notifier.addListener(listener);
      //remove the listener.
      notifier.removeListener(listener);

      notifier.maybeNotifyListeners();

      expect(notifyListenersCalled, isFalse);
    });
  });
}
