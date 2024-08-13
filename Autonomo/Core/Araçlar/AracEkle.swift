//
//  AracEkle.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct AracEkle: View {
    
    @State private var plaka: String = ""
    @State private var secilenKisi: String = "Yok"
    @State private var secilenRota: String = "Yok"
    @State private var aracKm: String = ""
    @State private var aracYili: String = ""
    @State private var kapasite: String = ""
    
    
    @State private var tuvTurkMuayenesi: Date = Date()
    @State private var egzozMuayenesi: Date = Date()
    @State private var koltukSigortasi: Date = Date()
    
    @State private var aracSigortasi: Date = Date()
    @State private var trafikSigortasi: Date = Date()
    
    @State private var kasko: Date = Date()
    
    
    
    let people = ["Ahmet", "Mehmet", "Veli", "Yok"]
    let routes = ["Salkım Orman Ürünleri", "Düzce Cam"]
    
    var body: some View {
        NavigationStack{
                Form {
                    Section(header: Text("Genel Bilgiler")
                        .font(.system(size: 12))
                        .textCase(.none)) {
                        TextField("Plaka", text: $plaka)
                            .keyboardType(.default)
                        
                        
                        TextField("Kilometre", text: $aracKm)
                            .keyboardType(.numberPad)
                        
                        TextField("Üretim Yılı", text: $aracYili)
                            .keyboardType(.numberPad)
                        
                        TextField("Araç Kapasitesi", text: $kapasite)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Son Tarihler")
                        .font(.system(size: 12))
                        .textCase(.none)){
                            
                            DatePicker("Tüv-Türk Muayenesi", selection: $tuvTurkMuayenesi, displayedComponents: .date)
                            
                            DatePicker("Egzoz Muayenesi", selection: $egzozMuayenesi, displayedComponents: .date)
                            
                            DatePicker("Koltuk Sigortası", selection: $koltukSigortasi, displayedComponents: .date)
                            
                            DatePicker("Araç Sigortası", selection: $aracSigortasi, displayedComponents: .date)
                            
                            DatePicker("Trafik Sigortası", selection: $trafikSigortasi, displayedComponents: .date)
                            
                            DatePicker("Kasko Sigortası", selection: $kasko, displayedComponents: .date)
                            
                        }
                    
                    Section(header: Text("Yönetim")
                        .font(.system(size: 12))
                        .textCase(.none)){
                        
                        Picker("Atanacak Çalışan", selection: $secilenKisi) {
                            ForEach(people, id: \.self) { person in
                                Text(person)
                            }
                        }
                        
                        Picker("Atanacak Rota", selection: $secilenRota) {
                            ForEach(routes, id: \.self) { routes in
                                Text(routes)
                            }
                        }
                    }
                    
                    Button(action: {
                        Text(" ")
                    }, label: {
                        Text("Aracı Ekle")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                    })
                }
                .navigationTitle("Araç Ekle")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    AracEkle()
}
