//
//  Ana Sayfa.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 24.07.2024.
//

import SwiftUI


struct Araclar: View {
    
    @State private var searchText = ""
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
                VStack{
                    // Özet bilgiler ve bul kısmı
                    Text("Araç Sayısı: 13")
                        .padding(.top, 16) // Safe area üst padding
                    
                    // Araçların sıralanması
                    ScrollView {
                        LazyVStack {
                            ForEach((1...50).filter { "\($0)".contains(searchText) || searchText.isEmpty }, id: \.self) { index in
                                NavigationLink(destination: AracDetayIlkEkran()) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Plaka \(index)")
                                            .font(.headline)
                                        
                                        HStack {
                                            Image(systemName: "bus")
                                            Text("Atanan kişi")
                                            Text("Atanan rota")
                                        }
                                        .font(.footnote)
                                        
                                        Divider()
                                            .background(Color.primary)
                                            .frame(height: 2)
                                    }
                                    .foregroundColor(.primary)
                                    .padding(.bottom)
                                    .padding(.horizontal)
                                    .cornerRadius(8) // Optional: for rounded corners
                                    .shadow(radius: 4) // Optional: for a shadow effect
                                }
                            }
                        }
                        .searchable(text: $searchText, prompt: "Araç ara...")
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AracEkle()) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        TabBarSayfalariBaslik(title: "Araçlar")
                    }
                }
            
            
        }
    }
}

#Preview {
    MainTabView()
}
