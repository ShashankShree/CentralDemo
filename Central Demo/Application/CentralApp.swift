//
//  Central_DemoApp.swift
//  Central Demo
//
//  Created by Shashank Shree on 04/10/23.
//

import SwiftUI

@main
struct CentralApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            CentralMainView()
        }
    }
}
