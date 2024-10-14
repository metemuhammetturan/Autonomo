//
//  YakıtRaporlariView.swift
//  Autonomo
//
//  Created by Mete Turan on 2.10.2024.
//

import SwiftUI
import Charts

struct YakitRaporlariView: View {
    
    // States for filtering, sorting, and sharing
    @State private var isFilteringActive = false
    @State private var isSortingActive = false
    @State private var isShareActive = false
    
    // Sample Data
    @State private var yakitRaporlari: [YakitRapor] = [
        YakitRapor(aracAdi: "Araç A", tarih: Date(), litre: 45.0, maliyet: 600, kilometre: 500),
        YakitRapor(aracAdi: "Araç B", tarih: Date(), litre: 30.0, maliyet: 400, kilometre: 300),
        YakitRapor(aracAdi: "Araç C", tarih: Date(), litre: 50.0, maliyet: 750, kilometre: 600),
        // Diğer araçların verileri eklenebilir...
    ]
    
    var body: some View {
        
        ScrollView{
            genelYakitOzetiView
            
            Divider()
            
            yakitGrafikleriView
            
            Divider()
            
            yakitVerimliligiRaporuView
            
            Divider()
            
            uyarilarVeHatirlatmalarView
            
            Spacer()
        }
    }
    

    // MARK: - Genel Yakıt Özeti
    var genelYakitOzetiView: some View {
        VStack(alignment: .leading, spacing: 15) {
            RaporlarKategoriBaslik(title: "Genel Yakıt Özeti")
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Image(systemName: "fuelpump.fill")
                            .foregroundColor(.green)
                        Text("Toplam Tüketim")
                            .font(.headline)
                    }
                    
                    Divider()
                        .padding(.top,5)
                    
                    HStack{
                        Text("Litre")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.top,5)
                        Spacer()
                        Text("\(toplamYakitTuketimi(), specifier: "%.1f") lt")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    
                    HStack{
                        Text("Maliyet")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.top,5)
                        Spacer()
                        Text("\(toplamYakitMaliyeti(), specifier: "%.0f") TL")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    
                    HStack{
                        Text("Kilometre Başına Maliyet")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.top,5)
                        Spacer()
                        Text("\(kmBasinaMaliyet(), specifier: "%.2f") TL")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGray6)))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }
        }
    }
    
    // MARK: - Yakıt Grafikleri
    var yakitGrafikleriView: some View {
        VStack(alignment: .leading, spacing: 10) {
            RaporlarKategoriBaslik(title: "Yakıt Tüketim Grafikleri")
            
            // Yakıt Maliyeti Grafiği
            yakitMaliyetiGrafik
            
            // Aylık Yakıt Tüketimi Grafiği
            aylikYakıtTuketimiGrafik
            
            // Yıllık Yakıt Tüketimi Grafiği
            yillikYakıtTuketimiGrafik
        }
    }
    // MARK: - Yakıt Maliyeti Grafiği
    var yakitMaliyetiGrafik: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Araç Başına Maliyet Dağılımı (₺)")
                .font(.subheadline)
                .bold()
                .opacity(0.5)
            
            Chart {
                ForEach(yakitRaporlari) { rapor in
                    BarMark(
                        x: .value("Araç", rapor.aracAdi),
                        y: .value("Maliyet", rapor.maliyet)
                    )
                }
            }
            .frame(height: 200)
            .foregroundColor(.birincilRenk)
        }
    }
    
    // MARK: - Aylık Yakıt Tüketimi Grafiği
    var aylikYakıtTuketimiGrafik: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Aylık Toplam Yakıt Maliyeti (₺)")
                .font(.subheadline)
                .bold()
                .opacity(0.5)
            
            
            Chart {
                ForEach(yakitRaporlari) { rapor in
                    BarMark(
                        x: .value("Araç", rapor.aracAdi),
                        y: .value("Litre", rapor.litre)
                    )
                }
            }
            .frame(height: 200)
            .foregroundColor(.birincilRenk)
        }
    }
    
    // MARK: - Yıllık Yakıt Tüketimi Grafiği
    var yillikYakıtTuketimiGrafik: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Yıllık Toplam Yakıt Maliyeti (₺)")
                .font(.subheadline)
                .bold()
                .opacity(0.5)
            
            // Örnek yıllık veriler (gerçek verilere göre güncellenebilir)
            let yillikVeriler: [String: Double] = [
                "2023": 600.0,
                "2024": 700.0
            ]
            
            Chart {
                ForEach(yillikVeriler.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    BarMark(
                        x: .value("Yıl", key),
                        y: .value("Litre", value)
                    )
                }
            }
            .frame(height: 200)
            .foregroundColor(.birincilRenk)
        }
    }
    
    // MARK: - Yakıt Verimliliği Raporları
    var yakitVerimliligiRaporuView: some View {
        VStack(alignment: .leading, spacing: 10) {
            RaporlarKategoriBaslik(title: "Yakıt Verimliliği Raporu")
            
            HStack {
                Text("En Verimli Araç:")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
                Text(verimliArac().aracAdi)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGreen).opacity(0.1)))
            
            HStack {
                Text("En Verimsiz Araç:")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
                Text(verimsizArac().aracAdi)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemRed).opacity(0.1)))
        }
    }
    
    // MARK: - Uyarılar ve Hatırlatmalar
    var uyarilarVeHatirlatmalarView: some View {
        VStack(alignment: .leading, spacing: 10) {
            RaporlarKategoriBaslik(title: "Uyarılar ve Hatırlatmalar")
            
            if anormalYakitTuketimi() {
                Text("⚠️ Anormal Yakıt Tüketimi: Araç A son dönemde alışılmadık derecede fazla yakıt tüketti.")
                    .foregroundColor(.red)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemRed).opacity(0.1)))
            }
        }
    }
    
    // MARK: - Helper Functions
    
    func toplamYakitTuketimi() -> Double {
        yakitRaporlari.reduce(0) { $0 + $1.litre }
    }
    
    func toplamYakitMaliyeti() -> Double {
        yakitRaporlari.reduce(0) { $0 + $1.maliyet }
    }
    
    func kmBasinaMaliyet() -> Double {
        let toplamKm = yakitRaporlari.reduce(0) { $0 + $1.kilometre }
        return toplamKm > 0 ? toplamYakitMaliyeti() / toplamKm : 0
    }
    
    func verimliArac() -> YakitRapor {
        yakitRaporlari.min { $0.litre / $0.kilometre < $1.litre / $1.kilometre } ?? yakitRaporlari[0]
    }
    
    func verimsizArac() -> YakitRapor {
        yakitRaporlari.max { $0.litre / $0.kilometre < $1.litre / $1.kilometre } ?? yakitRaporlari[0]
    }
    
    func anormalYakitTuketimi() -> Bool {
        // Basit bir kontrol, belirli bir litrenin üstünde fazla tüketim uyarısı verebilir
        return yakitRaporlari.contains { $0.litre > 70 }
    }
    
    func yakitSeviyesiDusuk() -> Bool {
        // Basit bir kontrol, belirli bir yakıt seviyesinin altına düştüğünde uyarı verir
        return yakitRaporlari.contains { $0.litre < 10 }
    }
}

// Sample data structure
struct YakitRapor: Identifiable {
    var id = UUID()
    var aracAdi: String
    var tarih: Date
    var litre: Double
    var maliyet: Double
    var kilometre: Double
}

struct YakitRaporlariView_Previews: PreviewProvider {
    static var previews: some View {
        YakitRaporlariView()
    }
}




























/*
 
 //
 //  YakıtRaporlariView.swift
 //  Autonomo
 //
 //  Created by Mete Turan on 2.10.2024.
 //
 import SwiftUI

 struct YakitRaporlariView: View {
     
     @State private var isFilteringActive = false
     @State private var isSortingActive = false
     @State private var isShareActive = false
     
     var body: some View {
         NavigationStack {
             
             VStack(alignment: .leading, spacing: 12) {
                 Text("Rapor Özet")
                     .font(.headline)
                     .foregroundColor(.primary)
                     .padding(.bottom, 4)
                 
                 Divider()
                     .background(Color.gray.opacity(0.5))
                 
                 VStack(alignment: .leading, spacing: 8) {
                     YakitRaporKutucuguComponent(baslik: "Aylık Toplam Yakıt Gideri:", deger: "1500₺")
                     YakitRaporKutucuguComponent(baslik: "Aylık Ortalama Yakıt Tüketimi:", deger: "8 L / 100 km")
                     YakitRaporKutucuguComponent(baslik: "Kilometre Başına Yakıt Maliyeti:", deger: "2.3 ₺ / km")
                 }
                 .padding(.vertical)
             }
             .frame(maxWidth: .infinity, alignment: .leading)
             .padding()
             .cornerRadius(15)
             .shadow(color: .gray.opacity(0.2), radius: 8, x: 5, y: 5)
             .overlay(
                 RoundedRectangle(cornerRadius: 15)
                     .stroke(Color.blue.opacity(0.3), lineWidth: 1)
             )
             .padding(.horizontal)
             
             .sheet(isPresented: $isFilteringActive) {
                 filter_for_yakitRaporlar()
                     .presentationDetents([.medium])
             }
             .background(
                 LinearGradient(gradient: Gradient(colors: [.black, .gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                     .ignoresSafeArea()
             )
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     HStack(spacing: 0){
                         Button(action: {
                             isSortingActive.toggle()
                         }) {
                             Image(systemName: "arrow.up.arrow.down.circle")
                                 .foregroundColor(.secondary)
                         }
                         
                         Button(action: {
                             isShareActive.toggle()
                         }) {
                             Image(systemName: "square.and.arrow.up.circle")
                                 .foregroundColor(.secondary)
                         }
                     }
                 }
             }
         }
     }
 }




 /*
  
  
  */

 */
