//
//  Arac Detayi.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct AracDetayIlkEkran: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 32),
        .init(.flexible(), spacing: 32),
        .init(.flexible(), spacing: 32)
    ]
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: SectionType(title: "Özet Bilgiler")){
                    DetayBasliklarComponent(contentType: "Plaka", content: "81 S 0023")
                    DetayBasliklarComponent(contentType: "Kilometre", content: "112.450 km")
                    DetayBasliklarComponent(contentType: "Atanan Şoför", content: "Mete")
                    DetayBasliklarComponent(contentType: "Atanan Rota", content: "Salkım Orman Ürünleri")
                }
                .listRowBackground(Color.clear)
                
                Section(header: SectionType(title: "Araç Detayları")){
                    NavigationLink(destination: AracDetayGenelBilgiler()){
                        CreateDetayComponent(title: "Genel Bilgiler", image: "chart.bar.xaxis")
                        
                    }
                    
                    NavigationLink(destination: AracDetayIslemler()){
                        CreateDetayComponent(title: "İşlemler", image: "doc.fill")
                    }
                    
                    NavigationLink(destination: AracDetaySonTarihler()){
                        CreateDetayComponent(title: "Son Tarihler", image: "calendar")
                    }
                }
                .listRowBackground(Color.clear)
                
                
                /*
                Section(header: SectionType(title: "Raporlar")){
                    LazyVGrid(columns: gridItems, spacing: 2){
                        AracRaporSecimiComponent(title: "Gider", image: "turkishlirasign")
                            .background(
                                NavigationLink("", destination: AracRaporlari())
                                    .opacity(0)
                            )
                        
                        AracRaporSecimiComponent(title: "Yakıt ", image: "fuelpump")
                        AracRaporSecimiComponent(title: "Sigorta", image: "doc.text")
                        AracRaporSecimiComponent(title: "Muayene", image: "doc.text.image")
                        AracRaporSecimiComponent(title: "Bakım", image: "wrench.and.screwdriver")
                        AracRaporSecimiComponent(title: "Arıza", image: "screwdriver")
                        
                    }
                }
                .listRowBackground(Color.clear)
                 */ // Tüm işlemler sayfası sağ üste taşınan raporlar sayfası
                
                
            }
            .navigationTitle("Araç Detayları - Seçilen Plaka")
            .navigationBarTitleDisplayMode(.inline)
        }
        Spacer()
    }
}


#Preview {
    AracDetayIlkEkran()
}


struct CreateDetayComponent: View {
    let title: String
    let image: String
    
    var body: some View {
        Button(action: {
            
        }) {
            HStack{
                Image(systemName: image)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .frame(width: 16, height: 16)
                
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.leading)
                
                Spacer()
            }
        }
    }
}

struct AracRaporSecimiComponent: View {
    let title: String
    let image: String
    
    var body: some View {
        Button(action: {
            
        }) {
            VStack{
                Image(systemName: image)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .frame(width: 16, height: 16)
                
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .frame(width: 90, height: 25)
            }
            .padding()
        }
        .background(Color.secondary.opacity(0.2).cornerRadius(6).frame(width: 100, height: 75))
    }
}





