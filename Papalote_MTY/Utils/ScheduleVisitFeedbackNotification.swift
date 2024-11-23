//
//  ScheduleVisitFeedbackNotification.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 23/11/24.
//

import UserNotifications
import UIKit

func scheduleVisitFeedbackNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Queremos saber cómo te fue en tu visita"
    
    // Create a clickable URL by using markdown formatting
    let urlString = "https://app.evaasurvey.com/s/papalotemuseodelniomonterrey5024/Mi0yMA=="
    content.subtitle = "Toca aquí para dejarnos tu opinión"  // More inviting text
    content.userInfo = ["url": urlString]  // Store URL in userInfo
    
    // Optional: Add a category identifier for handling the URL action
    content.categoryIdentifier = "SURVEY_INVITATION"
    content.sound = UNNotificationSound.default
    
    // Get the current date and set the target time to 6 PM
    var targetDate = Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!
    
    // Check if the current time is past 6 PM, and adjust to one hour from now if it is
    if Date() > targetDate {
        targetDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
    }
    /*if true {
        targetDate = Calendar.current.date(byAdding: .second, value: 5, to: Date())!
    }*/
    
    // Create a calendar-based trigger
    let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate)
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
    
    // Create the notification request
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // Schedule the notification
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Failed to schedule notification: \(error.localizedDescription)")
        } else {
            print("Notification scheduled successfully for \(targetDate)")
        }
    }
}
/*
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        setupNotificationCategories()  // This line is here but we need the function
        return true
    }
    
    // Add this function to the AppDelegate
    func setupNotificationCategories() {
        let urlAction = UNNotificationAction(
            identifier: "OPEN_URL",
            title: "Abrir encuesta",
            options: .foreground
        )
        
        let surveyCategory = UNNotificationCategory(
            identifier: "SURVEY_INVITATION",
            actions: [urlAction],
            intentIdentifiers: [],
            options: []
        )
        
        UNUserNotificationCenter.current().setNotificationCategories([surveyCategory])
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        print("did get inside")
        print(response.actionIdentifier)
        print(response.notification.request.content.userInfo["url"])
        if response.actionIdentifier == "OPEN_URL" || true,
           let urlString = response.notification.request.content.userInfo["url"] as? String,
           let url = URL(string: urlString) {
            print("Opening URL: \(url)")
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
        }
        completionHandler()
    }
}
*/

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        setupNotificationCategories()
        return true
    }
    
    func setupNotificationCategories() {
        let urlAction = UNNotificationAction(
            identifier: "OPEN_URL",
            title: "Abrir encuesta",
            options: .foreground
        )
        
        let surveyCategory = UNNotificationCategory(
            identifier: "SURVEY_INVITATION",
            actions: [urlAction],
            intentIdentifiers: [],
            options: []
        )
        
        UNUserNotificationCenter.current().setNotificationCategories([surveyCategory])
    }
    
    // Show notifications even when the app is in the foreground
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        // You can customize this based on your app's needs
        print("Notification received in foreground: \(notification.request.content.title)")
        
        // Show the notification as a banner, with sound
        completionHandler([.banner, .sound])
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        if response.actionIdentifier == "OPEN_URL" || true,
           let urlString = response.notification.request.content.userInfo["url"] as? String,
           let url = URL(string: urlString) {
            print("Opening URL: \(url)")
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
        }
        completionHandler()
    }
}
