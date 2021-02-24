//
//  Login_3rd_AttemptApp.swift
//  Login 3rd Attempt
//
//  Created by Robbie Forrey on 2/20/21.
//

import SwiftUI
import Firebase

@main
struct Login_3rd_AttemptApp: App {
    //calling delegate...
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var
        delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//initializing firebase...

class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) ->
                     Bool {
        
                     FirebaseApp.configure()
                     return true
    }
}
