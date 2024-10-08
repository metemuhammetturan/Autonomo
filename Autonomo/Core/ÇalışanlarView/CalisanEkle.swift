//
//  AracEkle.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct CalisanEkle: View {
    
    @State private var adi: String = ""
    @State private var soyAdi: String = ""
    @State private var dogumTarihi: Date = Date()
    @State private var telefonNumarasi: String = ""
    @State private var ikametgahAdresi: String = ""
    @State private var iseBaslangicTarihi: Date = Date()
    @State private var anlasilanMaas: String = ""
    @State private var atananArac: String = ""
    @State private var atananRota: String = ""
    @State private var ibanNumarasi: String = ""
    
    
    
    let araclar = ["81 S 0021", "81 S 0088", "81 S 004", "81 S 012"]
    let rotalar = ["Mustafa Kemal Ortaokulu", "Düzce Cam"]
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Temel Bilgiler")
                    .font(.system(size: 12))
                    .textCase(.none)){
                        TextField("Adı", text: $adi)
                            .keyboardType(.default)
                        TextField("Soyadı", text: $soyAdi)
                            .keyboardType(.default)
                        DatePicker("Doğum Tarihi", selection: $dogumTarihi, displayedComponents: .date)
                    }
                
                Section(header: Text("İletişim Bilgileri")
                    .font(.system(size: 12))
                    .textCase(.none)){
                        TextField("Telefon Numarası", text: $telefonNumarasi)
                            .keyboardType(.numberPad)
                        TextField("İkametgah Adresi", text: $ikametgahAdresi)
                            .keyboardType(.default)
                    }
                
                Section(header: Text("İş Bilgileri")
                    .font(.system(size: 12))
                    .textCase(.none)){
                        
                        DatePicker("İşe Başlangıç Tarihi", selection: $iseBaslangicTarihi, displayedComponents: .date)
                        TextField("Anlaşılan Maaş", text: $anlasilanMaas)
                            .keyboardType(.numberPad)
                        
                        Picker("Atanacak Araç", selection: $atananArac) {
                            ForEach(araclar, id: \.self) { person in
                                Text(person)
                            }
                        }
                        
                        Picker("Atanacak Rota", selection: $atananRota) {
                            ForEach(rotalar, id: \.self) { routes in
                                Text(routes)
                            }
                        }
                    }
                
                Section(header: Text("Banka Bilgileri")
                    .font(.system(size: 12))
                    .textCase(.none)){
                        TextField("IBAN Numarası", text: $ibanNumarasi)
                            .keyboardType(.numberPad)
                    }
                
                Button(action: {
                    Text("")
                }, label: {
                    Text("Çalışanı Kaydet")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity)
                })
            }
            .navigationTitle("Çalışan Ekle")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CalisanEkle()
}
