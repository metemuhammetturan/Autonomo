//
//  AracDetayMaliyetRaporlari.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

struct AracRaporlari: View {
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var showFilterSheet = false
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    // Toplam Maliyet
                    Section(header: SectionType(title: "Toplam")){
                        GiderlerFontTypeComponent(title: "Toplam Gider", price: 4870, image: "turkishlirasign", titleType: "TL")
                    }
                    
                    // Maliyet Kategorileri
                    Section(header: SectionType(title: "Kategoriler")){
                        GiderlerFontTypeComponent(title: "Yakıt", price: 12222, image: "fuelpump", titleType: "TL")
                        GiderlerFontTypeComponent(title: "Sigorta", price: 4870, image: "doc.text", titleType: "TL")
                        GiderlerFontTypeComponent(title: "Muayene", price: 12344, image: "doc.text.image", titleType: "TL")
                        GiderlerFontTypeComponent(title: "Bakım", price: 5355, image: "wrench.and.screwdriver", titleType: "TL")
                        GiderlerFontTypeComponent(title: "Arızalar", price: 2225, image: "screwdriver", titleType: "TL")
                        
                    }
                    
                    // Yakıt Raporları
                    Section(header: SectionType(title: "Yakıt Raporları")){
                        GiderlerFontTypeComponent(title: "Toplam Maliyet", price: 15245, image: "fuelpump.arrowtriangle.right", titleType: "TL")
                        GiderlerFontTypeComponent(title: "Toplam Tüketim (Litre)", price: 5531, image: "fuelpump.arrowtriangle.right", titleType: "LT")
                        GiderlerFontTypeComponent(title: "Ortalama Tüketim (100 km)", price: 7.4, image: "fuelpump.arrowtriangle.right", titleType: "LT")
                        GiderlerFontTypeComponent(title: "Kilometre Başına Tüketim", price: 2.35, image: "fuelpump.arrowtriangle.right", titleType: "TL")
                        
                        
                        
                    }
                }
            }
            .navigationTitle("Giderler")
            .navigationBarTitleDisplayMode(.inline)
            /*
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showFilterSheet = true
                    }) {
                        Image(systemName:"line.3.horizontal.decrease.circle")
                            .foregroundColor(.primary)
                            .opacity(0.8)
                    }
                }
            }
            .sheet(isPresented: $showFilterSheet) {
                filteringAracIslem()
                    .presentationDetents([.medium])
            }
             */ // Araç detay sayfasında filtreleme işlemi olduğu için buradaki filtreleme işlemi kaldırıldı. Gerekirse eklenir.
            
        }
    }
}

struct GiderlerFontTypeComponent: View {
    let title: String
    let price: Double
    let image: String
    let titleType: String
    
    // Sayıyı formatlamak için bir NumberFormatter tanımlayın
    private var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.primary)
                .frame(width: 16, height: 16)
                .bold()
                .padding(.trailing)
            
            Text(title)
                .bold()
            Spacer()
            Text("\(formattedPrice) \(titleType)")
        }
    }
}


#Preview {
    AracRaporlari()
}


