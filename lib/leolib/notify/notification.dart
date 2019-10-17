
import 'package:stone_shop/leolib/notify/notify_event.dart';

class Handle {
    Handle(this.func, this.target);
    final void Function(dynamic data) func;
    final Object target;
}

class LEONotification<T> {

    static Map<NotifyEvents, List<Handle>> _notifys = {};
    static void on(NotifyEvents key, void Function(dynamic data) callback, Object target) {
        if (!_notifys.containsKey(key)) {
            _notifys[key] = [];
        }
        var handel = Handle(callback, target);
        _notifys[key].add(handel);
    } 

    static void emit(NotifyEvents key, dynamic data) {
        if (!_notifys.containsKey(key)) {
            return;
        }
        _notifys[key].forEach((handle) {
            handle.func(data);
        });
    }
    static off(NotifyEvents key) {
        if (!_notifys.containsKey(key)) {
            return;
        }
        _notifys.remove(key);
    }
    static offTarget(Object target) {
        _notifys.forEach((key, handles) {
            handles.getRange(0, handles.length).toList().forEach((handle) {
                if (handle.target == target) {
                    handles.remove(handle);
                }
            });
        });
    }
}