//
//  AracDetayGenelBilgiler.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

struct CalisanDetayGenelBilgiler: View {
    var body: some View {
        
        NavigationStack {
            Form{
                Section(header: SectionType(title: "Çalışan Hakkında")){
                    DetayBasliklarComponent(contentType: "Ad", content: "Mete Muhammet")
                    DetayBasliklarComponent(contentType: "Soyad", content: "Turan")
                    DetayBasliklarComponent(contentType: "Doğum Tarihi", content: "15/05/2004")
                }
                
                Section(header: SectionType(title: "İletişim Bilgileri")){
                    DetayBasliklarComponent(contentType: "Telefon Numarası", content: "0546 733 2339")
                    DetayBasliklarComponent(contentType: "İkametgah Adresi", content: "Düzce/Merkez")
                }
                
                Section(header: SectionType(title: "İş Bilgileri")){
                    DetayBasliklarComponent(contentType: "İşe Başlangıç Tarihi", content: "15/05/2024")
                    DetayBasliklarComponent(contentType: "Anlaşılan Maaş", content: "21.500 TL")
                    DetayBasliklarComponent(contentType: "Atanan Araç", content: "81 S 0019")
                    DetayBasliklarComponent(contentType: "Atanan Rota", content: "Mustafa Kemal Ortaokulu")
                }
                
                Section(header: SectionType(title: "Banka Bilgileri")){
                    DetayBasliklarComponent(contentType: "IBAN Numarası", content: "TR12 0006 1005 1978 6457 8413 01")
                }
            }
            .navigationTitle("Genel Bilgiler - Seçilen Plaka")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CalisanDetayGenelBilgiler()
}






