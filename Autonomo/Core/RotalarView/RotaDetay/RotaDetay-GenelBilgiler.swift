//
//  AracDetayGenelBilgiler.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

struct RotaDetay_GenelBilgiler: View {
    var body: some View {
        
        NavigationStack {
            Form{
                Section(header: SectionType(title: "Rota Bilgileri")){
                    DetayBasliklarComponent(contentType: "İsmi", content: "Mustafa Kemal Ortaokulu")
                    DetayBasliklarComponent(contentType: "Araç Sayısı", content: "12")
                    DetayBasliklarComponent(contentType: "Atanan Şoför Sayısı", content: "15")
                    DetayBasliklarComponent(contentType: "Taşınan Yolcu Sayısı", content: "182")
                }
                
                Section(header: SectionType(title: "Ücret Bilgileri")){
                    DetayBasliklarComponent(contentType: "0 - 5 Kilometre", content: "18.612,00 TL")
                    DetayBasliklarComponent(contentType: "5 - 10 Kilometre", content: "20.961,00 TL")
                    DetayBasliklarComponent(contentType: "10 - 15 Kilometre", content: "29.466,00 TL")
                    DetayBasliklarComponent(contentType: "15 - 20 Kilometre", content: "35.325,00 TL")
                    DetayBasliklarComponent(contentType: "20 - 25 Kilometre", content: "40.671,00 TL")
                }
                
                // Tıklanıldığında ilgili personele gidecek şekilde güncelleme yapılacak
                Section(header: SectionType(title: "Rota Şoförleri")){
                    DetayBasliklarComponent(contentType: "Mete Muhammet Turan", content: "81 S 0001")
                    DetayBasliklarComponent(contentType: "ABC DEF", content: "81 S 0002")
                }
                
                Section(header: SectionType(title: "Rota Raporları (Aylık)")){
                    DetayBasliklarComponent(contentType: "Toplam Arıza Gideri", content: "62.225,00 TL")
                    DetayBasliklarComponent(contentType: "Toplam Yakıt Gideri", content: "36.566,72 TL")
                    DetayBasliklarComponent(contentType: "Araç Başına Ort. Yakıt Tüketimi (lt/100 km)", content: "6,2 Litre")
                }
            }
            .navigationTitle("Genel Bilgiler - Seçilen Plaka")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RotaDetay_GenelBilgiler()
}






