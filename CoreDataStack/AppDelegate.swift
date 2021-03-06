//
//  AppDelegate.swift
//  CoreDataStack
//
//  Created by Bart Jacobs on 17/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let coreDataManager = CoreDataManager(modelName: "DataModel")

    // MARK: - Application Life Cycle

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Initialize Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())

        // Instantiate Initial View Controller
        if let viewController = storyboard.instantiateInitialViewController() as? ViewController {
            // Configure View Controller
            viewController.coreDataManager = coreDataManager

            // Set Root View Controller
            window?.rootViewController = viewController
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        coreDataManager.saveChanges()
    }

    func applicationWillTerminate(application: UIApplication) {
        coreDataManager.saveChanges()
    }

}
