//
//  Genel.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 25.07.2024.
//

import Foundation
import SwiftUI

// Arka Plan

struct ArkaPlan: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.ucunculRenk, Color.ucunculRenk.opacity(0.8), Color.birincilRenk]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}
