//
//  Arac Detayi.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct CalisanDetayIlkEkran: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 32),
        .init(.flexible(), spacing: 32),
        .init(.flexible(), spacing: 32)
    ]
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: SectionType(title: "Özet Bilgiler")){
                    DetayBasliklarComponent(contentType: "Adı", content: "Mete Muhammet")
                    DetayBasliklarComponent(contentType: "Soyadı", content: "Turan")
                    DetayBasliklarComponent(contentType: "Atanan Araç", content: "81 S 0019")
                    DetayBasliklarComponent(contentType: "Atanan Rota", content: "Mustafa Kemal Ortaokulu")
                }
                .listRowBackground(Color.clear)
                
                Section(header: SectionType(title: "Çalışan Detayları")){
                    NavigationLink(destination: CalisanDetayGenelBilgiler()){
                        CreateDetayComponent(title: "Genel Bilgiler", image: "chart.bar.xaxis")
                        
                    }
                    NavigationLink(destination: CalisanDetayKaydedilenIslemler()){
                        CreateDetayComponent(title: "İşlemler", image: "doc.fill")
                    }
                }
                
                // Create a blue circle
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Çalışan Detayları - Seçilen Çalışan")
            .navigationBarTitleDisplayMode(.inline)
        }
        Spacer()
    }
}


#Preview {
    CalisanDetayIlkEkran()
}


