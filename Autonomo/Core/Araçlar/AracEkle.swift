//
//  AracEkle.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct AracEkle: View {
    
    @State private var plaka: String = ""
    @State private var secilenKisi: String = "Kimseyi atamak istemiyorum"
    @State private var aracKm: String = ""
    @State private var aracYili: String = ""
    @State private var kapasite: String = ""
    
    
    let people = ["Ahmet", "Mehmet", "Veli", "Kimseyi atamak istemiyorum"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Araç Bilgileri")) {
                    TextField("81 S 0001", text: $plaka)
                        .keyboardType(.default)
                
                
                    TextField("198.000", text: $aracKm)
                        .keyboardType(.numberPad)
                
                    TextField("2004", text: $aracYili)
                        .keyboardType(.numberPad)
                
                    TextField("17 kişi", text: $kapasite)
                        .keyboardType(.numberPad)
                
                    Picker("Mete", selection: $secilenKisi) {
                        ForEach(people, id: \.self) { person in
                            Text(person)
                        }
                    }
                }
                
                Button(action: {
                    Text(" ")
                }, label: {
                    Text("Aracı Ekle")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.primary)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity)
                })
            }
            .navigationTitle("Araç Ekle")
        }
    }
}

#Preview {
    AracEkle()
}
