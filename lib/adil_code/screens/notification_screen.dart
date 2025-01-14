import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

import '../utils/utils.dart';
import '../view_model/notification_setting.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  // Temporary notification data
  final List<Map<String, String>> notifications = [
    {
      "title": "Important Update",
      "text":
          "Stay updated! Enable notifications to receive alerts about important updates, offers, and reminders from GiveHope Enable notifications to receive alerts about important updates,.",
      "time": "2024-09-23 10:45",
    },
    {
      "title": "Short Notification",
      "text": "This is a short notification.",
      "time": "2024-09-24 12:30",
    },
    {
      "title": "Reminder",
      "text": "Test notification from last week.",
      "time": "2024-09-18 13:15",
    },
  ];

  // Function to get the label based on the notification date
  String getNotificationLabel(String notificationTime) {
    final notificationDate = DateTime.parse(notificationTime);
    final now = DateTime.now();

    if (now.difference(notificationDate).inDays == 0 &&
        notificationDate.day == now.day) {
      return "Today";
    }
    if (now.difference(notificationDate).inDays == 1 &&
        now.day - notificationDate.day == 1) {
      return "Yesterday";
    }
    if (now.difference(notificationDate).inDays > 1 &&
        now.difference(notificationDate).inDays <= 7) {
      return "Last Week";
    }
    if (now.month == notificationDate.month) {
      return "This Month";
    }
    return DateFormat('MMMM d').format(notificationDate);
  }

  // Group notifications by their label
  Map<String, List<Map<String, String>>> groupNotifications() {
    final Map<String, List<Map<String, String>>> groupedNotifications = {};

    for (var notification in notifications) {
      final label = getNotificationLabel(notification['time']!);
      if (groupedNotifications.containsKey(label)) {
        groupedNotifications[label]!.add(notification);
      } else {
        groupedNotifications[label] = [notification];
      }
    }

    return groupedNotifications;
  }

  @override
  Widget build(BuildContext context) {
    final groupedNotifications = groupNotifications(); // Grouped notifications

    // Define the order in which labels should be displayed
    final List<String> labelOrder = [
      "Today",
      "Yesterday",
      "Last Week",
      "This Month"
    ];

    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: AppColor.themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(Icons.arrow_back, color: AppColor.themeColor),
              ),
            ),
            24.height,
            const Text(
              "Notification",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Stay updated! Enable notifications to receive alerts about important updates, offers, and reminders from",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                  ),
                  TextSpan(
                    text: " GiveHope.",
                    style: TextStyle(
                      color: AppColor.themeColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
            16.height,
            notifications.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/notification.png'),
                        const SizedBox(height: 20),
                        const Text(
                          'No Notifications',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: labelOrder.map((label) {
                        final notificationList =
                            groupedNotifications[label] ?? [];

                        if (notificationList.isEmpty) {
                          return SizedBox();
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                label,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ...notificationList.map((notification) {
                              return NotificationSetting(
                                notificationText: notification['text']!,
                                notificationTitle: notification['title']!,
                                notificationTime: label,
                              );
                            }),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ).padAll(16),
      ),
    );
  }
}
