//
//  Arac Detayi.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct AracDetay: View {
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Genel Bilgiler")){
                    
                    AracDetayGenelBilgilerComponent(contentType: "Plaka", content: "81 S 0023")
                    AracDetayGenelBilgilerComponent(contentType: "Atanan Şoför", content: "Mete")
                    AracDetayGenelBilgilerComponent(contentType: "Atanan Rota", content: "Salkım Orman Ürünleri")
                    AracDetayGenelBilgilerComponent(contentType: "Kilometre", content: "112.450 km")
                    AracDetayGenelBilgilerComponent(contentType: "Üretim Yılı", content: "27/07/2014")
                    AracDetayGenelBilgilerComponent(contentType: "Yolcu Kapasitesi", content: "18 kişi")
                    
                    
                    
                    
                    
                }
            }
            .navigationTitle("81 S 0023")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AracDetay()
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
