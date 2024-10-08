//
//  Ana Sayfa.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 24.07.2024.
//

import SwiftUI


struct Calisanlar: View {
    
    @State private var searchText = ""
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            VStack{
                
                Text("Çalışan Sayısı: 13")
                    
                    .padding(.bottom)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                // Çalışanların sıralanması
                ScrollView {
                    LazyVStack {
                        ForEach((1...50).filter { "\($0)".contains(searchText) || searchText.isEmpty }, id: \.self) { index in
                            NavigationLink(destination: CalisanDetayIlkEkran()) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Çalışan \(index)")
                                        .font(.headline)
                                    
                                    HStack {
                                        Image(systemName: "person.circle")
                                        VStack(alignment: .leading){
                                            Text("Atanan araç")
                                            Text("Atanan rota")
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
                    
                    .searchable(text: $searchText, prompt: "Çalışan ara...")
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationBarImage(image: "plus.circle", destination: CalisanEkle())
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationBarBaslik(title: "Çalışanlar")
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    Calisanlar()
}
