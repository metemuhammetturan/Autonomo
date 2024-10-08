//
//  IslemEkle.swift
//  Autonomo
//
//  Created by Mete Turan on 13.08.2024.
//

import SwiftUI

struct CalisanaIslemEkle: View {
    
    @State private var selectedArac = ""
    @State private var islemTarihi = Date()
    @State private var selectedKategori = ""
    @State private var aciklama = ""
    @State private var selectedRota = ""
    @State private var selectedKisi = ""
    @State private var islemFotograflari: [UIImage] = []
    @State private var islemMaliyeti: String = ""
    
    let araclar = ["81 S 0023", "81 S 0042", "81 S 024"]
    let kategoriler = ["Yakıt Alımı", "Tüv-Türk Muayene", "Egzoz Muayenesi", "Koltuk Sigortası", "Araç Sigortası", "Trafik Sigortası", "Kasko"]
    let rotalar = ["Rota 1", "Rota 2", "Rota 3"]
    let kisiler = ["Kişi 1", "Kişi 2", "Kişi 3"]

    var body: some View {
        NavigationStack {
            Form {

                Section(header: SectionType(title: "İşlem Hakkında")) {

                    TextField("Başlık (Opsiyonel)", text: $aciklama)

                    TextField("Açıklama (Opsiyonel)", text: $aciklama)

                    TextField("Maliyet *", text: $islemMaliyeti)
                        .keyboardType(.decimalPad)

                }
                
                Section(header: SectionType(title: "İşlem Detayları")) {
                    
                    DatePicker("Tarih *", selection: $islemTarihi, displayedComponents: [.date, .hourAndMinute])
                    
                    Picker("Kategori *", selection: $selectedKategori) {
                        ForEach(kategoriler, id: \.self) { kategori in
                            Text(kategori)
                        }
                    }

                    Picker("Gerçekleştiği Rota (Opsiyonel)", selection: $selectedRota) {
                        ForEach(rotalar, id: \.self) { rota in
                            Text(rota)
                        }
                    }

                    Picker("Gerçekleştiren Kişi (Opsiyonel)", selection: $selectedKisi) {
                        ForEach(kisiler, id: \.self) { kisi in
                            Text(kisi)
                        }
                    }
                }
                
                // İşlem Fotoğrafları
                Section(header: SectionType(title: "İşlem Fotoğrafları (Opsiyonel)")) {
                    
                    // İşleme ait fotoğraf seçimi - maksimum 10 adet
                    if islemFotograflari.isEmpty {
                        Text("Fotoğraf seçilmedi")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<islemFotograflari.count, id: \.self) { index in
                                    Image(uiImage: islemFotograflari[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    
                    Button(action: {
                        // Fotoğraf ekleme işlemi burada yapılabilir
                    }) {
                        Text("Fotoğraf Ekle")
                    }
                }
            }
            .navigationTitle("İşlem Ekle")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CalisanaIslemEkle()
}
