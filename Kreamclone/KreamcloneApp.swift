//
//  KreamcloneApp.swift
//  Kreamclone
//
//  Created by JIN on 6/5/25.
//

import SwiftUI
import FirebaseCore
import NidThirdPartyLogin


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    NidOAuth.shared.initialize()
    NidOAuth.shared.setLoginBehavior(.appPreferredWithInAppBrowserFallback)
    return true
  }
    
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
      if (NidOAuth.shared.handleURL(url) == true) {
          return true
      }
      return false
    }
    
}

@main
struct KreamcloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
