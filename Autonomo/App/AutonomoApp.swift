//
//  AutonomoApp.swift
//  Autonomo
//
//  Created by Mete Turan on 28.07.2024.
//

import SwiftUI

@main
struct AutonomoApp: App {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
        }
    }
}
