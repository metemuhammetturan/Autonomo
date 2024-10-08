//
//  Ana Sayfa.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 24.07.2024.
//

import SwiftUI


struct Rotalar: View {
    
    @State private var searchText = ""
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            VStack{
                
                Text("Rota Sayısı: 13")
                    .padding(.leading)
                    .padding(.bottom)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                // Çalışanların sıralanması
                ScrollView {
                    LazyVStack {
                        ForEach((1...12).filter { "\($0)".contains(searchText) || searchText.isEmpty }, id: \.self) { index in
                            NavigationLink(destination: RotaDetayIlkEkran()) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Rota \(index)")
                                        .font(.headline)
                                    
                                    HStack {
                                        Image(systemName: "person.circle")
                                        VStack(alignment: .leading){
                                            Text("Sefer Saati")
                                            Text("Atanan Araç")
                                            Text("Atanan Şoför")
                                            Text("Yolcu Sayısı")
                                            
                                        }
                                        .font(.caption)

                                    }
                                    
                                    
                                    Divider()
                                        .background(Color.primary)
                                        .frame(height: 2)
                                }
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .cornerRadius(8) // Optional: for rounded corners
                                .shadow(radius: 4) // Optional: for a shadow effect
                            }
                        }
                    }
                    
                    .searchable(text: $searchText, prompt: "Rota ara...")
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationBarImage(image: "plus.circle", destination: RotaOlustur())
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationBarBaslik(title: "Rotalar")
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    Rotalar()
}
