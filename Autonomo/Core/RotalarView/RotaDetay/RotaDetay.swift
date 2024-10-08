//
//  Arac Detayi.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct RotaDetayIlkEkran: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 32),
        .init(.flexible(), spacing: 32),
        .init(.flexible(), spacing: 32)
    ]
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: SectionType(title: "Rota Bilgileri")){
                    DetayBasliklarComponent(contentType: "Rota İsmi", content: "Mustafa Kemal Ortaokulu")
                    DetayBasliklarComponent(contentType: "Atanan Araç Sayısı", content: "3")
                    DetayBasliklarComponent(contentType: "Atanan Rota", content: "Mustafa Kemal Ortaokulu")
                }
                .listRowBackground(Color.clear)
                
                Section(header: SectionType(title: "Rota Detayları")){
                    NavigationLink(destination: RotaDetay_GenelBilgiler()){
                        CreateDetayComponent(title: "Genel Bilgiler", image: "chart.bar.xaxis")
                        
                    }
                    
                    NavigationLink(destination: RotaDetay_Araclar()){
                        CreateDetayComponent(title: "Rota Araçları", image: "bus")
                    }
                    
                    NavigationLink(destination: RotaDetay_KaydedilenIslemler()){
                        CreateDetayComponent(title: "İşlemler", image: "doc.fill")
                    }
                }
                
                // Create a blue circle
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Rota Detayları - Seçilen Rota Kısaltması")
            .navigationBarTitleDisplayMode(.inline)
        }
        Spacer()
    }
}


#Preview {
    RotaDetayIlkEkran()
}


