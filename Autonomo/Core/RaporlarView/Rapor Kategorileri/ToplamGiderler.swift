//
//  ToplamGiderler.swift
//  Autonomo
//
//  Created by Mete Turan on 8.10.2024.
//

import SwiftUI



// Toplam Giderler Bileşeni
struct ToplamGiderler: View {
    var body: some View {
        ScrollView {
            // Genel Bakış
            ExpenseSection(title: "Genel Bakış", backgroundColor: Color.blue) {
                AnyView(
                    VStack(spacing: 15) {
                        TrendChart(title: "Aylık Gider Eğrisi")
                        ExpenseRow(title: "Toplam Gider:", amount: "₺1,200,000", percentage: "")
                        ExpenseRow(title: "Araç Başına Ortalama Gider:", amount: "₺60,000", percentage: "")
                        ExpenseRow(title: "En Yüksek Harcama:", amount: "Yakıt", percentage: "%45")
                    }
                )
            }
            
            Divider()

            // Gider Kalemleri
            ExpenseSection(title: "Gider Kalemleri", backgroundColor: Color.green) {
                AnyView(
                    VStack(spacing: 15) {
                        ExpenseRow(title: "Yakıt Giderleri:", amount: "₺540,000", percentage: "%45")
                        ExpenseRow(title: "Arıza Giderleri:", amount: "₺160,000", percentage: "%14")
                        ExpenseRow(title: "Bakım ve Onarım:", amount: "₺350,000", percentage: "%33")
                        ExpenseRow(title: "Sigorta ve Kasko:", amount: "₺150,000", percentage: "%12")
                    }
                )
            }

            Divider()

            // Performans ve Maliyet Oranı
            ExpenseSection(title: "Performans ve Maliyet Raporu", backgroundColor: Color.purple) {
                AnyView(
                    VStack(spacing: 15) {
                        TrendChart(title: "Performans Trend Grafiği")
                        ExpenseRow(title: "Kilometre Başına Maliyet:", amount: "5 TL/km", percentage: "")
                        ExpenseRow(title: "En Verimli Araçlar:", amount: "Araç 1, 2, 3", percentage: "")
                        ExpenseRow(title: "Düşük Verimli Araçlar:", amount: "Araç 5, 6", percentage: "")
                    }
                )
            }

            Divider()

            // Zaman Aralığı Karşılaştırmaları
            ExpenseSection(title: "Sezonluk Raporları", backgroundColor: Color.orange) {
                AnyView(
                    VStack(spacing: 15) {
                        TrendChart(title: "Sezonluk Değişimler")
                        ExpenseRow(title: "Aylık Gider Değişimi:", amount: "%10 Artış", percentage: "")
                        ExpenseRow(title: "Yıllık Gider Değişimi:", amount: "%20 Artış", percentage: "")
                    }
                )
            }
        }
    }
}

#Preview {
    ToplamGiderler()
}




// Gider Satırı Bileşeni
struct ExpenseRow: View {
    var title: String
    var amount: String
    var percentage: String

    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.primary)
            Spacer()
            Text("\(amount) | \(percentage)")
                .font(.headline)
                .bold()
                .foregroundColor(.birincilRenk)
        }
    }
}

// Grafik Bileşeni
struct TrendChart: View {
    var title: String

    var body: some View {
        ZStack(alignment: .top){
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundColor(.primary.opacity(0.3))
                .padding(.top)
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 150)
                .overlay(Text("Grafik").foregroundColor(.black).bold())
                .cornerRadius(10)
        }
    }
}



// Harcama Bölümü Componenti
struct ExpenseSection: View {
    var title: String
    var backgroundColor: Color
    var content: () -> AnyView

    var body: some View {
        Section(header: SectionTypeForRaporlar(title: title)) {
            VStack(spacing: 15) {
                content()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor.opacity(0.2))
                    .shadow(color: Color.white.opacity(0.2), radius: 10))
        }
        .shadow(color: Color.white.opacity(0.2), radius: 10)
    }
}
