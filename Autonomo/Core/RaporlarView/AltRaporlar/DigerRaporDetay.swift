import Foundation
import SwiftUI

struct DigerRaporDetay: View {
    @State private var selectedType = "Giderler" // Hangi kutucuğun seçildiğini takip etmek için bir durum değişkeni
    
    var body: some View {
        NavigationStack {
            
            // Rapor türü seçimi burada yapılmakta
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    
                    TumRaporlarSecim(type: "Yakıt Raporları", image: "fuelpump.fill", isSelected: selectedType == "Yakıt Raporları") {
                        selectedType = "Yakıt Raporları"
                    }
                    
                    TumRaporlarSecim(type: "Arıza Raporları", image: "fuelpump.fill", isSelected: selectedType == "Arıza Raporları") {
                        selectedType = "Arıza Raporları"
                    }
                    
                    TumRaporlarSecim(type: "Toplam Giderler", image: "turkishlirasign.circle.fill", isSelected: selectedType == "Toplam Giderler") {
                        selectedType = "Toplam Giderler"
                    }
                    
                    TumRaporlarSecim(type: "Yaklaşan Tarihler", image: "calendar.badge.exclamationmark", isSelected: selectedType == "Yaklaşan Tarihler") {
                        selectedType = "Yaklaşan Tarihler"
                    }
                    
                    TumRaporlarSecim(type: "Araç Bazlı Raporlar", image: "car.circle.fill", isSelected: selectedType == "Araç Bazlı Raporlar") {
                        selectedType = "Araç Bazlı Raporlar"
                    }
                    
                    TumRaporlarSecim(type: "İşlem Durumları", image: "doc.text.fill", isSelected: selectedType == "İşlem Durumları") {
                        selectedType = "İşlem Durumları"
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            .padding(.vertical)
            .frame(height: 50)
            
            
            
            // Seçilen rapora ait veriler burada gözükmekte
            ScrollView(.vertical) {
                
                if(selectedType == "Yakıt Raporları"){
                    YakitRaporlariView()
                }
                
                else if(selectedType == "Arıza Raporları"){
                    ArizaRaporlariView()
                }
                
                else if(selectedType == "Toplam Giderler"){
                    Gider()
                }
                else if(selectedType == "Yaklaşan Tarihler"){
                    YaklasanTarihler()
                }
                else if(selectedType == "Araç Bazlı Raporlar"){
                    AracBazliRaporlar()
                }
                else if(selectedType == "İşlem Durumları"){
                    IslemDurumlari()
                }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical)
            
            
            
            
            
            
            .toolbarRole(.editor)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationBarBaslik(title: "Rapor Detayları")
                }
            }
            
            Spacer()
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
            HStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(isSelected ? Color.black : Color.white) // Simge rengini ayarlıyoruz
                    .frame(width: 15, height: 15)
                Text(type)
                    .font(.subheadline)
                    .foregroundColor(isSelected ? Color.black : Color.white)
                Spacer()
            }
            .frame(height: 9)
            .padding() // İçerik etrafına padding ekleyerek alan oluşturuyoruz
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color.birincilRenk : Color.gray.opacity(0.2)) // Seçiliyse mavi, değilse gri arka plan
                    .shadow(color: Color.black.opacity(0.2), radius: 10) // Gölge ekliyoruz
            )
        }
        .buttonStyle(PlainButtonStyle()) // Varsayılan buton stilini kaldırıyoruz
    }
}

struct DigerRaporDetay_Previews: PreviewProvider {
    static var previews: some View {
        DigerRaporDetay()
    }
}
