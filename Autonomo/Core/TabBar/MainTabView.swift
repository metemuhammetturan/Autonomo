//
//  TabBar.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 28.07.2024.
//

import SwiftUI

struct MainTabView: View {
    
    /*
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(Color.ucunculRenk)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    */
    
    @State var selectedTab : Int = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab){
                AnaSayfa()
                    .badge(2)
                    .tabItem {
                        Label("Ana Sayfa", systemImage: "house")
                    }
                    .tag(0)
                
                Araclar()
                    .badge(2)
                    .tabItem {
                        Label("Araçlar", systemImage: "bus")
                    }
                    .tag(1)
                
                Calisanlar()
                    .badge(2)
                    .tabItem {
                        Label("Çalışanlar", systemImage: "person")
                    }
                    .tag(2)
                
                Rotalar()
                    .badge(2)
                    .tabItem {
                        Label("Rotalar", systemImage: "map")
                    }
                    .tag(3)
                
                Raporlar()
                    .badge(2)
                    .tabItem {
                        Label("Raporlar", systemImage: "chart.bar.xaxis")
                    }
                    .tag(4)
            }
            .accentColor(.ucunculRenk)
    }
}

#Preview {
    MainTabView()
}
