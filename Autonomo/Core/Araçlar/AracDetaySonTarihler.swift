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
                        AracDetayGenelBilgilerComponent(contentType: "Tüv-Türk Muayenesi", content: "Kalan Gün - Tarih")
                        AracDetayGenelBilgilerComponent(contentType: "Egzoz Muayenesi", content: "Kalan Gün - Tarih")
                        AracDetayGenelBilgilerComponent(contentType: "Koltuk Sigortası", content: "Kalan Gün - Tarih")
                        AracDetayGenelBilgilerComponent(contentType: "Araç Sigortası", content: "Kalan Gün - Tarih")
                        AracDetayGenelBilgilerComponent(contentType: "Trafik Sigortası", content: "Kalan Gün - Tarih")
                        AracDetayGenelBilgilerComponent(contentType: "Kasko Sigortası", content: "Kalan Gün - Tarih")
                            .foregroundColor(.red)
                    }
                    // En yakın tarihten en uzak tarihe doğru sıralanacak
                }
                .navigationTitle("Son Tarihler")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    AracDetaySonTarihler()
}
