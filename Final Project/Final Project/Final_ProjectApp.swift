//
//  Final_ProjectApp.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

import SwiftUI

@main
struct Final_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView(username: .constant(""), password: .constant(""), isLoggedIn: .constant(false))
        }
    }
}
