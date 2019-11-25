//
//  AppDelegate.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import StoreKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: Store Review
        
        // get current number of times app has been launched
        let currentCount = UserDefaults.standard.integer(forKey: "launchCount")
        // increment received number by one
        UserDefaults.standard.set(currentCount+1, forKey:"launchCount")
        // save changes to disk
        UserDefaults.standard.synchronize()
        
        // if true request user for an App Review!
        if askUserForAppRating(currentCount) {
            requestUserForAnAppRating()
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // This is the logic for when the app should ask the user for a rating.
    fileprivate func askUserForAppRating(_ openCount: Int) -> Bool {
        switch openCount {
        case 0, 1:
            return false
        case 3,18,30,50:
            return true
        case _ where openCount % 100 == 0:
            return true
        default:
            return false
        }
        
    }
    
    // This will show a user a prompt to rate the app.
    fileprivate func requestUserForAnAppRating() {
        if #available( iOS 10.3,*){
            SKStoreReviewController.requestReview()
        }
    }
}

