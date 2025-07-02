//
//  AppDelegate.swift
//  LifeCycleViewController
//
//  Created by Debash on 07.05.2018.
//  Copyright © 2018 swiftbook.ru. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Загрузка приложения завершена
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //window?.rootViewController = UINavigationController(rootViewController: RootViewController())
        window?.tintColor = .red
        UINavigationBar.appearance().barTintColor = .green
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        
        return true
    }

    // Вызвается перед переходом в состояние в фоновый режим
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }
    
    // Вызвается при переходе в фоновый режим
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }
    
    // Вызвается перед переходом на Передний план
    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }
    
    // Вызвается при переходе на Передний план
    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }

    // Вызвается при завершении работы
    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }
}

