
//
//  YakıtRaporlariView.swift
//  Autonomo
//
//  Created by Mete Turan on 2.10.2024.
//
import SwiftUI
import Charts

// Sample Arıza Modeli
struct ArizaRapor: Identifiable {
    var id = UUID()
    var aracAdi: String
    var arizaTuru: String
    var arizaMaliyeti: Double
    var cozumSuresiGun: Int
    var arizaTarihi: Date
}


// Örnek Veriler
let arizaRaporlari = [
    ArizaRapor(aracAdi: "81 S 0002", arizaTuru: "Motor", arizaMaliyeti: 22900, cozumSuresiGun: 3, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0003", arizaTuru: "Motor", arizaMaliyeti: 12200, cozumSuresiGun: 5, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0018", arizaTuru: "Motor", arizaMaliyeti: 36000, cozumSuresiGun: 8, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0046", arizaTuru: "Lastik", arizaMaliyeti: 22900, cozumSuresiGun: 2, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0046", arizaTuru: "Lastik", arizaMaliyeti: 22900, cozumSuresiGun: 5, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0002", arizaTuru: "Motor", arizaMaliyeti: 22900, cozumSuresiGun: 2, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0019", arizaTuru: "Lastik", arizaMaliyeti: 8000, cozumSuresiGun: 1, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0019", arizaTuru: "Fren", arizaMaliyeti: 16000, cozumSuresiGun: 1, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "81 S 0019", arizaTuru: "Debriyaj", arizaMaliyeti: 35000, cozumSuresiGun: 1, arizaTarihi: Date()),
    ]

struct ArizaRaporlariView: View {
    
    // MARK: - Genel Arıza Özeti View
    
    var genelArizaOzetiView: some View {
        
        
        VStack(alignment: .leading, spacing: 10){
            RaporlarKategoriBaslik(title: "Genel Arıza Özeti")
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Image(systemName: "list.clipboard.fill")
                            .foregroundColor(.orange)
                        Text("Toplam Tüketim")
                            .font(.headline)
                    }
                    
                    Divider()
                        .padding(.top,5)
                    
                    HStack{
                        Text("Toplam Maliyet")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.top,5)
                        Spacer()
                        Text("\(toplamArizaMaliyeti(), specifier: "%.0f") TL")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    
                    HStack{
                        Text("Toplam Arıza Sayısı")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.top,5)
                        Spacer()
                        Text("\(arizaRaporlari.count)")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    
                    HStack{
                        Text("Ortalama Çözüm Süresi:")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.top,5)
                        Spacer()
                        Text("\(ortalamaCozumSuresi(), specifier: "%.1f") Gün")
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
    
    // MARK: - Ariza Detayları Listesi
    
    var arizaDetaylariListView: some View {
        VStack(alignment: .leading, spacing: 10) {
            RaporlarKategoriBaslik(title: "Arıza Detayları")
            
            List(arizaRaporlari) { rapor in
                VStack(alignment: .leading) {
                    Text("Araç: \(rapor.aracAdi)")
                        .bold()
                    Text("Arıza Türü: \(rapor.arizaTuru)")
                    Text("Maliyet: \(rapor.arizaMaliyeti, specifier: "%.0f") TL")
                    Text("Çözüm Süresi: \(rapor.cozumSuresiGun) gün")
                    Text("Tarih: \(rapor.arizaTarihi, formatter: dateFormatter)")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGray6)))
            }
        }
    }
    
    // MARK: - Arıza Maliyeti Grafiği
    var arizaMaliyetiGrafikView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Araç Bazında Arıza Masrafı")
                .font(.headline)
            
            Chart {
                ForEach(arizaRaporlari) { rapor in
                    BarMark(
                        x: .value("Araç", rapor.aracAdi),
                        y: .value("Maliyet", rapor.arizaMaliyeti)
                    )
                }
            }
            .frame(height: 150)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
    
    // MARK: - Arıza Türü Dağılımı Grafiği
    var arizaTuruGrafikView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Arıza Türü Dağılımı")
                .font(.headline)
            
            Chart {
                ForEach(Array(arizaTuruDagilim()), id: \.key) { key, value in

                    SectorMark(
                        angle: .value("Yüzde", value),
                        innerRadius: .ratio(0.5),
                        outerRadius: .ratio(1.0)
                    )
                    .foregroundStyle(by: .value("Arıza Türü", key))
                }
            }
            .frame(height: 200)
        }
    }
    
    // MARK: - body
    
    var body: some View{
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                genelArizaOzetiView
                arizaDetaylariListView
                arizaMaliyetiGrafikView
                arizaTuruGrafikView   
            }
        }
    }
    
    // MARK: - Functions
    func toplamArizaMaliyeti() -> Double {
        arizaRaporlari.reduce(0) { $0 + $1.arizaMaliyeti }
    }
    
    func ortalamaCozumSuresi() -> Double {
        let toplamGun = arizaRaporlari.reduce(0) {$0 + $1.cozumSuresiGun}
        return Double(toplamGun) / Double(arizaRaporlari.count)
    }
    
    func arizaTuruDagilim() -> [String: Double] {
        var dagilim: [String: Double] = [:]
        let toplamAriza = Double(arizaRaporlari.count)
        
        for rapor in arizaRaporlari {
            dagilim[rapor.arizaTuru, default: 0] += 1
        }
        
        for(key, value) in dagilim {
            dagilim[key] = (value / toplamAriza) * 100
        }
        
        return dagilim
    }
}


// Date Formatter
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()








































































/*

//
//  YakıtRaporlariView.swift
//  Autonomo
//
//  Created by Mete Turan on 2.10.2024.
//
import SwiftUI
import Charts

// Sample Arıza Modeli
struct ArizaRapor: Identifiable {
    var id = UUID()
    var aracAdi: String
    var arizaTuru: String
    var arizaMaliyeti: Double
    var cozumSuresiGun: Int
    var arizaTarihi: Date
}

// Örnek Veriler
let arizaRaporlari = [
    ArizaRapor(aracAdi: "Araç A", arizaTuru: "Motor", arizaMaliyeti: 2000, cozumSuresiGun: 5, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "Araç B", arizaTuru: "Elektrik", arizaMaliyeti: 1500, cozumSuresiGun: 3, arizaTarihi: Date()),
    ArizaRapor(aracAdi: "Araç C", arizaTuru: "Fren", arizaMaliyeti: 3000, cozumSuresiGun: 7, arizaTarihi: Date()),
]

struct ArizaRaporlariView: View {
    
    // MARK: - Genel Arıza Özeti View
    var genelArizaOzetiView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Genel Arıza Özeti")
                .font(.title2)
                .bold()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Toplam Arıza: \(arizaRaporlari.count)")
                    Text("Toplam Maliyet: \(toplamArizaMaliyeti(), specifier: "%.0f") TL")
                    Text("Ortalama Çözüm Süresi: \(ortalamaCozumSuresi(), specifier: "%.1f") gün")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGray6)))
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Arıza Detayları Listesi
    var arizaDetaylariListView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Arıza Detayları")
                .font(.headline)
            
            List(arizaRaporlari) { rapor in
                VStack(alignment: .leading) {
                    Text("Araç: \(rapor.aracAdi)")
                        .bold()
                    Text("Arıza Türü: \(rapor.arizaTuru)")
                    Text("Maliyet: \(rapor.arizaMaliyeti, specifier: "%.0f") TL")
                    Text("Çözüm Süresi: \(rapor.cozumSuresiGun) gün")
                    Text("Tarih: \(rapor.arizaTarihi, formatter: dateFormatter)")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGray6)))
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Arıza Maliyeti Grafiği
    var arizaMaliyetiGrafikView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Araç Bazında Arıza Maliyeti")
                .font(.headline)
            
            Chart {
                ForEach(arizaRaporlari) { rapor in
                    BarMark(
                        x: .value("Araç", rapor.aracAdi),
                        y: .value("Maliyet", rapor.arizaMaliyeti)
                    )
                }
            }
            .frame(height: 200)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
    
    // MARK: - Arıza Türü Dağılımı Grafiği
    var arizaTuruGrafikView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Arıza Türü Dağılımı")
                .font(.headline)
            
            Chart {
                ForEach(Array(arizaTuruDağılımı().sorted(by: { $0.key < $1.key })), id: \.key) { key, value in
                    SectorMark(
                        angle: .value("Yüzde", value),
                        innerRadius: .ratio(0.5),
                        outerRadius: .ratio(1.0)
                    )
                    .foregroundStyle(by: .value("Arıza Türü", key))
                }
            }
            .frame(height: 200)
        }
        .padding(.horizontal)
    }

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                genelArizaOzetiView
                arizaDetaylariListView
                arizaMaliyetiGrafikView
                arizaTuruGrafikView
            }
            .padding()
        }
    }
    
    // MARK: - Helper Functions
    
    func toplamArizaMaliyeti() -> Double {
        arizaRaporlari.reduce(0) { $0 + $1.arizaMaliyeti }
    }
    
    func ortalamaCozumSuresi() -> Double {
        let toplamGun = arizaRaporlari.reduce(0) { $0 + $1.cozumSuresiGun }
        return Double(toplamGun) / Double(arizaRaporlari.count)
    }
    
    func arizaTuruDağılımı() -> [String: Double] {
        var dagilim: [String: Double] = [:]
        let toplamAriza = Double(arizaRaporlari.count)
        
        for rapor in arizaRaporlari {
            dagilim[rapor.arizaTuru, default: 0] += 1
        }
        
        for (key, value) in dagilim {
            dagilim[key] = (value / toplamAriza) * 100
        }
        
        return dagilim
    }
}

// Date Formatter
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

// Preview
struct ArizaRaporlariView_Previews: PreviewProvider {
    static var previews: some View {
        ArizaRaporlariView()
    }
}



*/




















/*
 
 
 
 //
 //  YakıtRaporlariView.swift
 //  Autonomo
 //
 //  Created by Mete Turan on 2.10.2024.
 //
 import SwiftUI

 struct ArizaRaporlariView: View {
     
     @State private var isFilteringActive = false
     @State private var isSortingActive = false
     @State private var isShareActive = false
     
     var body: some View {
         NavigationStack {
             VStack{
                 VStack(alignment: .leading, spacing: 12) {
                     Text("Rapor Özet")
                         .font(.headline)
                         .foregroundColor(.primary)
                         .padding(.bottom, 4)
                     
                     Divider()
                         .background(Color.gray.opacity(0.5))
                     
                     VStack(alignment: .leading, spacing: 8) {
                         ArizaRaporKutucuguComponent(baslik: "Toplam Arıza Maliyeti:", deger: "55.600,00₺")
                         ArizaRaporKutucuguComponent(baslik: "Toplam Arıza Sayısı:", deger: "33")
                         ArizaRaporKutucuguComponent(baslik: "Arıza Çıkaran Araç Sayısı:", deger: "13")
                         ArizaRaporKutucuguComponent(baslik: "En Çok Arıza Çıkaran Araç:", deger: "Araç 2")
                     }
                     .padding(.vertical)
                 }
                 .frame(maxWidth: .infinity, alignment: .leading)
                 .padding()
                 .background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), .birincilRenk.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
                 .cornerRadius(15)
                 .shadow(color: .gray.opacity(0.2), radius: 8, x: 5, y: 5)
                 .overlay(
                     RoundedRectangle(cornerRadius: 15)
                         .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                 )
                 .padding(.horizontal)
                 
             }
             .sheet(isPresented: $isFilteringActive) {
                // filter_for_yakitRaporlar()
                   //  .presentationDetents([.medium])
             }
             .background(
                 LinearGradient(gradient: Gradient(colors: [.black, .gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                     .ignoresSafeArea()
             )
             .toolbar {
                 ToolbarItem(placement: .navigationBarLeading){
                     NavigationBarBaslik(title: "Arıza Raporları")
                 }
                 ToolbarItem(placement: .navigationBarTrailing) {
                     HStack(spacing: 0){
                         Button(action: {
                             isSortingActive.toggle()
                         }) {
                             Image(systemName: "arrow.up.arrow.down.circle")
                                 .foregroundColor(.secondary)
                         }
                         
                         Button(action: {
                             isFilteringActive.toggle()
                         }) {
                             Image(systemName: "line.horizontal.3.decrease.circle")
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



 #Preview {
     ArizaRaporlariView()
 }

 */
