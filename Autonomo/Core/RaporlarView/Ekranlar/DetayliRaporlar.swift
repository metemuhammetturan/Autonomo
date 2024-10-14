import SwiftUI

struct DetayliRaporlar: View {
    @State private var selectedType = 0
    @State private var isSortingActive = false
    @State private var isShareActive = false
    @State private var isFilteringActive = false

    var body: some View {
        NavigationStack {
            VStack {
                // Rapor türü seçimi burada yapılmakta
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<5) { index in
                                TumRaporlarSecim(type: self.selectedTypeTitle(index), image: self.imageForType(index), isSelected: selectedType == index) {
                                    withAnimation {
                                        selectedType = index
                                        proxy.scrollTo(index, anchor: .center)
                                    }
                                }
                                .id(index)
                            }
                        }
                        .padding()
                    }
                    .frame(height: 50)
                    .onChange(of: selectedType) { newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
                
                // Ekranlar arasında geçiş için animasyonlu kaydırma
                TabView(selection: $selectedType) {
                    ToplamGiderler().tag(0)
                    YakitRaporlariView().tag(1)
                    ArizaRaporlariView().tag(2)
                    YaklasanTarihler().tag(3)
                    AracBazliRaporlar().tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut, value: selectedType)

                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBarBaslik(title: selectedTypeTitle(selectedType))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 0) {
                        // Toolbar butonları
                        Button(action: { isSortingActive.toggle() }) {
                            Image(systemName: "arrow.up.arrow.down.circle")
                                .foregroundColor(.secondary)
                        }
                        Button(action: { isFilteringActive.toggle() }) {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .foregroundColor(.secondary)
                        }
                        Button(action: { isShareActive.toggle() }) {
                            Image(systemName: "square.and.arrow.up.circle")
                                .foregroundColor(.secondary)
                        }
                        NavigationLink(destination: TumIslemler()) {
                            Image(systemName: "list.bullet.circle")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
    
    // Seçilen türü göstermek için bir yardımcı fonksiyon
    func selectedTypeTitle(_ index: Int) -> String {
        switch index {
        case 0: return "Toplam Giderler"
        case 1: return "Yakıt Raporları"
        case 2: return "Arıza Raporları"
        case 3: return "Yaklaşan Tarihler"
        case 4: return "Araç Bazlı Raporlar"
        default: return ""
        }
    }
    
    // Butonların simgelerini döndüren yardımcı fonksiyon
    func imageForType(_ index: Int) -> String {
        switch index {
        case 0: return "turkishlirasign.circle.fill"
        case 1: return "fuelpump.fill"
        case 2: return "exclamationmark.triangle"
        case 3: return "calendar.badge.exclamationmark"
        case 4: return "car.circle.fill"
        default: return ""
        }
    }
}



struct TumRaporlarSecim: View {
    var type: String
    var image: String
    var isSelected: Bool // Seçim durumunu kontrol etmek için bir değişken
    var action: () -> Void // Tıklama işlemi için bir closure

    var body: some View {
        Button(action: {
            action() // Tıklama işlemi
        }) {
            HStack(spacing: 5) { // Daha az boşluk
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(isSelected ? Color.black : Color.white) // Simge rengini ayarlıyoruz
                    .frame(width: 12, height: 12) // Görseli daha küçük yapıyoruz
                Text(type)
                    .font(.system(size: 10)) // Fontu küçültüyoruz
                    .foregroundColor(isSelected ? Color.black : Color.white)
                Spacer(minLength: 0) // Minimum boşluğu kaldırıyoruz
            }
            .frame(height: 20) // Yüksekliği biraz artırıyoruz
            .padding(.horizontal, 8) // Yatay padding'i küçültüyoruz
            .padding(.vertical, 4) // Dikey padding'i küçültüyoruz
            .background(
                RoundedRectangle(cornerRadius: 8) // Köşe yuvarlamayı da küçülttük
                    .fill(isSelected ? Color.birincilRenk : Color.gray.opacity(0.2)) // Seçiliyse mavi, değilse gri arka plan
                    .shadow(color: Color.black.opacity(0.1), radius: 5) // Gölgeyi hafiflettik
            )
        }
        .buttonStyle(PlainButtonStyle()) // Varsayılan buton stilini kaldırıyoruz
    }
}
