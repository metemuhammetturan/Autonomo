import SwiftUI

struct AnaSayfa: View {
    
    @State private var isAddNewStaffActive = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Uygulama simgesi ve profil fotoğrafı (isteğe bağlı)
                HStack {
                    Text("Autonomo")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Spacer()
                    // Profile picture placeholder
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Button(action: {
                        // Settings action
                    }) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        isAddNewStaffActive = true
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        isAddNewStaffActive = true
                    }) {
                        Image(systemName: "bell.badge")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.purple)
                
                // MARK: - Son 5 işlem
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "wrench.and.screwdriver.fill")
                        Text("Araçlarınıza ait son 5 işlem")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)

                    Divider()
                        .background(Color.primary)

                    // Son İşlemler
                    ForEach(sonIslemler) { islem in
                        AnaSayfaSonIslemlerComponents(tarih: islem.tarih, image: islem.image, plaka: islem.plaka, islemTuru: islem.islemTuru, islemMaliyeti: islem.islemMaliyeti)
                        Divider()
                            .background(Color.secondary)
                    }
                }
                .padding()

                // MARK: - Özet Bilgiler
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "fuelpump")
                        Text("Toplam Yakıt Giderleri")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)

                    Divider()
                        .background(Color.primary)

                    // Özet Raporlar
                    ForEach(ozetRaporlar) { rapor in
                        AnaSayfaOzetRaporlarComponents(raporTuru: rapor.raporTuru, raporMaliyeti: rapor.raporMaliyeti)
                        Divider()
                            .background(Color.primary)
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Ana Sayfa Eylemi
                    }) {
                        NavigationBarBaslik(title: "Ana Sayfa")
                    }
                }
                
                /*
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 0) {
                        Button(action: {
                            isAddNewStaffActive = true
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.secondary)
                                .padding()
                                .background(Circle().fill(Color.gray.opacity(0.2)))
                        }
                        
                        Button(action: {
                            isAddNewStaffActive = true
                        }) {
                            Image(systemName: "bell.badge")
                                .foregroundColor(.secondary)
                                .padding()
                                .background(Circle().fill(Color.gray.opacity(0.2)))
                        }
                    }
                }
                 */
            }
            .sheet(isPresented: $isAddNewStaffActive) {
                KisayollarSheet()
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct AnaSayfaSonIslemlerComponents: View {
    let tarih: String
    let image: String
    let plaka: String
    let islemTuru: String
    let islemMaliyeti: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            VStack(alignment: .leading) {
                Text(plaka)
                Text(islemTuru)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(islemMaliyeti)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

struct AnaSayfaOzetRaporlarComponents: View {
    let raporTuru: String
    let raporMaliyeti: String
    
    var body: some View {
        HStack {
            Text(raporTuru)
                .fontWeight(.semibold)
            Spacer()
            Text(raporMaliyeti)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(8)
    }
}

// Örnek veri
struct Islem: Identifiable {
    let id: UUID
    let tarih: String
    let image: String
    let plaka: String
    let islemTuru: String
    let islemMaliyeti: String
}

let sonIslemler: [Islem] = [
    Islem(id: UUID(), tarih: "28.07.2024", image: "hammer.circle", plaka: "81 S 0012", islemTuru: "Yağ bakımı", islemMaliyeti: "1.500,00 TL"),
    Islem(id: UUID(), tarih: "27.07.2024", image: "fuelpump.circle", plaka: "81 S 0022", islemTuru: "Yakıt alımı", islemMaliyeti: "1.864,21 TL"),
    Islem(id: UUID(), tarih: "26.07.2024", image: "folder.circle", plaka: "81 S 0019", islemTuru: "MTV Yenileme", islemMaliyeti: "455,33 TL"),
    Islem(id: UUID(), tarih: "26.07.2024", image: "fuelpump.circle", plaka: "81 S 004", islemTuru: "Yakıt alımı", islemMaliyeti: "1.523,55 TL"),
    Islem(id: UUID(), tarih: "25.07.2024", image: "hammer.circle", plaka: "81 S 0055", islemTuru: "Lastik değişimi", islemMaliyeti: "2343,25 TL")
]

struct Rapor: Identifiable {
    let id: UUID
    let raporTuru: String
    let raporMaliyeti: String
}

let ozetRaporlar: [Rapor] = [
    Rapor(id: UUID(), raporTuru: "Günlük", raporMaliyeti: "1.628,45 TL"),
    Rapor(id: UUID(), raporTuru: "Haftalık", raporMaliyeti: "12.356,77 TL")
]

#Preview {
    AnaSayfa()
}
