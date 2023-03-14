import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';




class LocalNoticeService {
  // Singleton of the LocalNoticeService
  static final LocalNoticeService _notificationService =LocalNoticeService._internal();

  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();


  factory LocalNoticeService() {
    return _notificationService;
  }
  LocalNoticeService._internal();

  void addNotification(
    String title,
    String body, {
    String sound = '',
    String channel = 'default',
  }) async {
   // tzData.initializeTimeZones();

    //final scheduleTime =
      //  tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local, endTime);

    // #3
    final iosDetail = sound == ''
        ? null
        : DarwinNotificationDetails(presentSound: true, sound: sound);

    final soundFile = sound.replaceAll('.mp3', '');
    final notificationSound =
        sound == '' ? null : RawResourceAndroidNotificationSound(soundFile);

    final androidDetail = AndroidNotificationDetails(
        channel, // channel Id
        channel, // channel Name
        playSound: true,
        sound: notificationSound);

    final noticeDetail = NotificationDetails(
      iOS: iosDetail,
      android: androidDetail,
    );

    // #4
    const id = 0;

    await _localNotificationsPlugin.show(
      id,
      title,
      body,
      
      noticeDetail
      
    );
  }
  


  Future<void> setup() async {
    // #1 
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSetting = DarwinInitializationSettings();

    // #2
    const initSettings = InitializationSettings(android: androidSetting, iOS: iosSetting);

    // #3
    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }
}




