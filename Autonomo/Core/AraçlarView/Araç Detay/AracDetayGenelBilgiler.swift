//
//  AracDetayGenelBilgiler.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

struct AracDetayGenelBilgiler: View {
    var body: some View {
        
        NavigationStack {
                Form{
                    Section(header: SectionType(title: "Araç Hakkında")){
                        DetayBasliklarComponent(contentType: "Plaka", content: "81 S 0023")
                        DetayBasliklarComponent(contentType: "Kilometre", content: "112.450 km")
                        DetayBasliklarComponent(contentType: "Üretim Yılı", content: "27/07/2014")
                        DetayBasliklarComponent(contentType: "Yolcu Kapasitesi", content: "18 kişi")
                    }
                    
                    Section(header: SectionType(title: "Yönetim")){
                        DetayBasliklarComponent(contentType: "Atanan Şoför", content: "Mete")
                        DetayBasliklarComponent(contentType: "Atanan Rota", content: "Salkım Orman Ürünleri")
                    }
                    Section(header: SectionType(title: "Son Tarihler")){
                        DetayBasliklarComponent(contentType: "Tüv-Türk Muayenesi", content: "218 Gün")
                        DetayBasliklarComponent(contentType: "Egzoz Muayenesi", content: "56 Gün")
                        DetayBasliklarComponent(contentType: "Koltuk Sigortası", content: "155 Gün")
                        DetayBasliklarComponent(contentType: "Araç Sigortası", content: "246 Gün")
                        DetayBasliklarComponent(contentType: "Trafik Sigortası", content: "22 Gün")
                        DetayBasliklarComponent(contentType: "Kasko Sigortası", content: "6 Gün")
                    }
                }
                .navigationTitle("Genel Bilgiler - Seçilen Plaka")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AracDetayGenelBilgiler()
}






struct DetayBasliklarComponent: View {
    
    let contentType: String
    let content: String
    
    var body: some View {
        HStack {
            Text(contentType)
                .bold()
            Spacer()
            Text(content)
            
            Divider()
                .frame(height: 3)
                .background(Color.secondary)
        }
    }
}

