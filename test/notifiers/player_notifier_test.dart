import 'package:chewie/src/notifiers/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlayerNotifier', () {
    test('init should set hideStuff to true', () {
      final notifier = PlayerNotifier.init();
      expect(notifier.hideStuff, isTrue);
    });

    test('hideStuff setter should update _hideStuff', () {
      final notifier = PlayerNotifier.init();
      notifier.hideStuff = false;
      expect(notifier.hideStuff, isFalse);
      notifier.hideStuff = true;
      expect(notifier.hideStuff, isTrue);
    });

    test('hideStuff setter should notify listeners when hideStuff changes', () {
      final notifier = PlayerNotifier.init();
      var listenerCalled = false;

      notifier.addListener(() {
        listenerCalled = true;
      });

      notifier.hideStuff = false;
      expect(listenerCalled, isTrue);
    });
    test(
        'hideStuff setter should not notify listeners when there are no listeners',
        () {
      final notifier = PlayerNotifier.init();
      var listenerCalled = false;

      void listener() {
        listenerCalled = true;
      }

      notifier.addListener(listener);
      notifier.removeListener(listener);
      notifier.hideStuff = false;
      expect(listenerCalled, isFalse);
    });
    test('hideStuff setter should call listeners multiple times', () {
      final notifier = PlayerNotifier.init();
      var listenerCalledCount = 0;

      notifier.addListener(() {
        listenerCalledCount++;
      });

      notifier.hideStuff = false;
      notifier.hideStuff = true;
      notifier.hideStuff = false;
      notifier.hideStuff = true;

      expect(listenerCalledCount, equals(4));
    });
  });
}
