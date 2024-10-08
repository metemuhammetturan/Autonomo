
/*

import Foundation
import SwiftUI

struct DigerRaporDetay: View {
    
    @State private var currentCardIndex: Int = 0
    private let cards = [
        ("Toplam Maliyet", "creditcard", Color.blue.opacity(0.2), [
            ("Sigorta Maliyeti:", "5.000₺"),
            ("Kasko Maliyeti:", "4.000₺"),
            ("Muayene Maliyeti:", "3.300₺")
        ]),
        ("Yaklaşan Yenilemeler", "calendar.badge.exclamationmark", Color.orange.opacity(0.2), [
            ("Araç 1 (Kasko Yenileme):", "15 gün kaldı"),
            ("Araç 2 (Sigorta Yenileme):", "25 gün kaldı"),
            ("Araç 3 (Muayene):", "5 gün kaldı")
        ]),
        ("Yıllık Maliyet Artışı", "chart.bar.fill", Color.green.opacity(0.2), [
            ("2023 Toplam Maliyet:", "10.000₺"),
            ("2024 Toplam Maliyet:", "11.500₺"),
            ("Artış:", "%15")
        ]),
        ("Araç Başına Ortalama Maliyet", "car", Color.purple.opacity(0.2), [
            ("Araç 1:", "3.000₺"),
            ("Araç 2:", "2.500₺"),
            ("Araç 3:", "2.800₺")
        ]),
        ("En Yüksek Maliyetli İşlem", "exclamationmark.triangle.fill", Color.red.opacity(0.2), [
            ("Araç 3 (Sigorta Yenileme):", "5.000₺")
        ]),
        ("Eksik ve Tamamlanan Raporlar", "doc.text.fill", Color.yellow.opacity(0.2), [
            ("Sigorta Yenileme (Araç 1):", "Tamamlandı"),
            ("Kasko Yenileme (Araç 3):", "Eksik")
        ])
    ]
    
    var body: some View {
        NavigationStack {
            TabView(selection: $currentCardIndex) {
                ForEach(0..<cards.count, id: \.self) { index in
                    CardView(title: cards[index].0, imageName: cards[index].1, color: cards[index].2) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(cards[index].3, id: \.0) { item in
                                HStack {
                                    Text(item.0).bold()
                                    Spacer()
                                    Text(item.1)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .tag(index) // Her kart için bir etiket ekleyin
                    .padding(.horizontal)
                }
            }
            .tabViewStyle(PageTabViewStyle()) // Sayfa geçiş stili
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Sayfa göstergesi
            .padding()
            .navigationTitle("Detay Raporlar")
            .navigationBarTitleDisplayMode(.inline)
            .frame(height: 200)
            
            Spacer()
            
            VStack{
                Text("Merhaba")
            }
        }
    }
}

// Tekrar kullanılabilir Kart Görünümü
struct CardView<Content: View>: View {
    var title: String
    var imageName: String
    var color: Color
    let content: Content
    
    init(title: String, imageName: String, color: Color, @ViewBuilder content: () -> Content) {
        self.title = title
        self.imageName = imageName
        self.color = color
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.headline)
            }
            Divider()
            content
                .frame(width: 300, height: 75) // Sabit boyut
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct DigerRaporDetay_Previews: PreviewProvider {
    static var previews: some View {
        DigerRaporDetay()
    }
}














 
 
 
 */
