//
//  AracDetaySonTarihler.swift
//  Autonomo
//
//  Created by Mete Turan on 13.08.2024.
//

import SwiftUI

struct AracDetaySonTarihler: View {
    var body: some View {
        
        NavigationStack {
                Form{
                    Section(header: SectionType(title: "Son Tarihler")){
                        DetayBasliklarComponent(contentType: "Tüv-Türk Muayenesi", content: "Kalan Gün - Tarih")
                        DetayBasliklarComponent(contentType: "Egzoz Muayenesi", content: "Kalan Gün - Tarih")
                        DetayBasliklarComponent(contentType: "Koltuk Sigortası", content: "Kalan Gün - Tarih")
                        DetayBasliklarComponent(contentType: "Araç Sigortası", content: "Kalan Gün - Tarih")
                        DetayBasliklarComponent(contentType: "Trafik Sigortası", content: "Kalan Gün - Tarih")
                        DetayBasliklarComponent(contentType: "Kasko Sigortası", content: "Kalan Gün - Tarih")
                            .foregroundColor(.red)
                    }
                    // En yakın tarihten en uzak tarihe doğru sıralanacak
                }
                .navigationTitle("Son Tarihler - Seçilen Plaka")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    AracDetaySonTarihler()
}
