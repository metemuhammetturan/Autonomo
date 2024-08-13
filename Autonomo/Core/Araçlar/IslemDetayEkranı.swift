//
//  IslemDetayEkranı.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

struct IslemDetay: Identifiable {
    var id = UUID()
    var tarih: String
    var maliyet: Double
    var tur: String
    var aciklama: String
    var bildirimYapanSofor: String
}

struct IslemDetayEkrani: View {
    // Örnek veriler
    let islemDetaylari = [
        IslemDetay(tarih: "30.07.2024", maliyet: 500.0, tur: "Bakım", aciklama: "Yağ değişimi", bildirimYapanSofor: "Ahmet Yılmaz"),
        IslemDetay(tarih: "25.07.2024", maliyet: 300.0, tur: "Tamir", aciklama: "Fren tamiri", bildirimYapanSofor: "Mehmet Demir")
    ]
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section(header: SectionType(title: "İşlem Hakkında")){
                    HStack{
                        Text("Tarih")
                        Spacer()
                        Text("17/07/2024")
                    }
                    HStack{
                        Text("Maliyet")
                        Spacer()
                        Text("790 TL")
                    }
                    HStack{
                        Text("Türü")
                        Spacer()
                        Text("Sigorta")
                    }
                    HStack{
                        Text("Açıklama")
                        Spacer()
                        Text("Koltuk sigortası yapıldı")
                    }
                }
                
                Section(header: SectionType(title: "İşlem Fotoğrafı/Fatura")){
                    Image("fis")
                        .resizable()
                        .scaledToFill()
                        .padding()
                }
                
            }
            .navigationTitle("İşlem Detayları")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    IslemDetayEkrani()
}
