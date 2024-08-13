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
                        AracDetayGenelBilgilerComponent(contentType: "Plaka", content: "81 S 0023")
                        AracDetayGenelBilgilerComponent(contentType: "Kilometre", content: "112.450 km")
                        AracDetayGenelBilgilerComponent(contentType: "Üretim Yılı", content: "27/07/2014")
                        AracDetayGenelBilgilerComponent(contentType: "Yolcu Kapasitesi", content: "18 kişi")
                    }
                    
                    Section(header: SectionType(title: "Yönetim")){
                        AracDetayGenelBilgilerComponent(contentType: "Atanan Şoför", content: "Mete")
                        AracDetayGenelBilgilerComponent(contentType: "Atanan Rota", content: "Salkım Orman Ürünleri")
                    }
                    Section(header: SectionType(title: "Son Tarihler")){
                        AracDetayGenelBilgilerComponent(contentType: "Tüv-Türk Muayenesi", content: "218 Gün")
                        AracDetayGenelBilgilerComponent(contentType: "Egzoz Muayenesi", content: "56 Gün")
                        AracDetayGenelBilgilerComponent(contentType: "Koltuk Sigortası", content: "155 Gün")
                        AracDetayGenelBilgilerComponent(contentType: "Araç Sigortası", content: "246 Gün")
                        AracDetayGenelBilgilerComponent(contentType: "Trafik Sigortası", content: "22 Gün")
                        AracDetayGenelBilgilerComponent(contentType: "Kasko Sigortası", content: "6 Gün")
                    }
                }
                .navigationTitle("Genel Bilgiler")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AracDetayGenelBilgiler()
}






struct AracDetayGenelBilgilerComponent: View {
    
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

