//
//  YaklasanYenilemeSureleri.swift
//  Autonomo
//
//  Created by Mete Turan on 8.10.2024.
//

import SwiftUI

struct YaklasanTarihler: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView {
                    ForEach(yaklasanTarihler) { islem in
                        AracKartView(islem: islem)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
    }
}

struct AracKartView: View {
    var islem: AracYaklasanTarihler
    let maxSure = 20 // En fazla gün kabul ediliyor
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(islem.aracAdi)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(islem.yaklasanIslemTuru)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Kalan günlere göre progress bar ters hesaplanıyor
                ProgressView(value: kalanSureYuzdesi(kalanSure: islem.kalanSure), total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: renkSecici(kalanSure: islem.kalanSure)))
                    .frame(height: 8)
                    .cornerRadius(4)
                
                HStack {
                    Image(systemName: "calendar")
                    Text("\(islem.kalanSure) gün kaldı")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            Image(systemName: "car.fill")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 4)
    }
    
    // Kalan süre yüzdesini hesaplayan fonksiyon
    func kalanSureYuzdesi(kalanSure: Int) -> Double {
        return 1.0 - (Double(kalanSure) / Double(maxSure)) // 0'a yaklaştıkça bar dolacak
    }
    
    // Kalan süreye göre renk seçen fonksiyon
    func renkSecici(kalanSure: Int) -> Color {
        switch kalanSure {
        case 0...5:
            return .red
        case 6...10:
            return .orange
        case 11...20:
            return .green
        default:
            return .gray
        }
    }
}

struct AracYaklasanTarihler: Identifiable {
    var id = UUID()
    var aracAdi: String
    var kalanSure: Int
    var yaklasanIslemTuru: String
}

let yaklasanTarihler = [
    AracYaklasanTarihler(aracAdi: "81 S 0012", kalanSure: 12, yaklasanIslemTuru: "Tüv-Türk Muayene"),
    AracYaklasanTarihler(aracAdi: "81 S 0013", kalanSure: 16, yaklasanIslemTuru: "Egzoz Muayenesi"),
    AracYaklasanTarihler(aracAdi: "81 S 0016", kalanSure: 11, yaklasanIslemTuru: "Koltuk Sigortası"),
    AracYaklasanTarihler(aracAdi: "81 S 0022", kalanSure: 5, yaklasanIslemTuru: "Araç Sigortası"),
    AracYaklasanTarihler(aracAdi: "81 S 0076", kalanSure: 7, yaklasanIslemTuru: "Trafik Sigortası"),
    AracYaklasanTarihler(aracAdi: "81 S 0012", kalanSure: 19, yaklasanIslemTuru: "Kasko")
]

#Preview {
    YaklasanTarihler()
}
