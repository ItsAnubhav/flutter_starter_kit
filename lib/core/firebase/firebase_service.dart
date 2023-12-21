import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/injection.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'general_notifications', // id
    'General Notifications', // title
    description:
        'This channel is used for important notifications regarding latest features and offers.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initializeFirebase() async {
  flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    ),
    onDidReceiveNotificationResponse: (response) =>
        onSelectNotification(response.payload),
    onDidReceiveBackgroundNotificationResponse: (response) =>
        onSelectNotification(response.payload),
  );

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    // TODO: handle the received notifications
  } else {
    print('User declined or has not accepted permission');
  }

  messaging.getToken().then((value) {
    String? token = value;
    debugPrint("Firebase token: $token");
    if (token != null) {
      getIt<SharedPreferences>().setString("device_token", token);
    }
  });
  // Firebase local notification plugin
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print(
        'A new onMessageOpenedApp event was published! data: ${message.data} notification: ${message.notification}');
    //getIt<NavigationService>().navigateTo(Routes.notification);
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final data = message.data;
    showNotification(message);
    // try {
    //   await getIt<AppDatabase>()
    //       .notificationDao
    //       .insertNotification(notificationModel);
    // } catch (e) {
    //   final database =
    //       await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    //   await database.notificationDao.insertNotification(notificationModel);
    //   print(e.toString());
    // }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  debugPrint("Firebase initialized");
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  showNotification(message);
  // try {
  //   await getIt<AppDatabase>()
  //       .notificationDao
  //       .insertNotification(notificationModel);
  //   BlocProvider.of<NotificationBloc>(
  //           getIt<NavigationService>().navigatorKey.currentContext!)
  //       .add(const NotificationLoadEvent(fetchFromRemote: true));
  // } catch (e) {
  //   final database =
  //       await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //   await database.notificationDao.insertNotification(notificationModel);
  //   print(e.toString());
  // }
  print("Handling a background message: ${message.messageId}");
}

void showNotification(RemoteMessage message) async {
  final notificationData = message.data;

  String? largeImagePath;
  // Download and save the image locally
  // if ((notificationData['urlImageString'] as String).isNotEmpty) {
  //   largeImagePath = await _downloadAndSaveFile(
  //       notificationData['urlImageString'], "largeIcon.png");
  // }
  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
          'general_notifications', 'General Notifications',
          channelDescription:
              'This channel is used for important notifications regarding latest features and offers.',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
          styleInformation: largeImagePath != null
              ? BigPictureStyleInformation(
                  FilePathAndroidBitmap(largeImagePath))
              : null,
          ticker: 'ticker');
  DarwinNotificationDetails darwinNotificationDetails =
      const DarwinNotificationDetails();
  NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: darwinNotificationDetails);
  int notificationId = 0;
  try {
    notificationId = int.parse(notificationData['notificationid']);
  } catch (e) {
    notificationId = 0;
  }
  await flutterLocalNotificationsPlugin.show(notificationId,
      notificationData['title'], notificationData['body'], notificationDetails);
}

Future<dynamic> onSelectNotification(payload) async {
  debugPrint("Navigating. Payload: $payload");
}

// Future<String?> _downloadAndSaveFile(String url, String fileName) async {
//   try {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final String filePath = '${directory.path}/$fileName';
//     final resp = await Dio()
//         .get(url, options: Options(responseType: ResponseType.bytes));
//     final File file = File(filePath);
//     await file.writeAsBytes(resp.data);
//     print("Img file path: $filePath");
//     return filePath;
//   } catch (e) {
//     return null;
//   }
// }
