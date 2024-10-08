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
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ArizaVeriKutucugu(tarih: "01/10/2024", arac: "Araç 1", ucret: "2300.00₺", aciklama: "Lastik tamiri")
                        ArizaVeriKutucugu(tarih: "02/10/2024", arac: "Araç 2", ucret: "150₺", aciklama: "Plakalık düştü tamir edildi")
                        ArizaVeriKutucugu(tarih: "05/10/2024", arac: "Araç 3", ucret: "800.00₺", aciklama: "Egzoz tamiri")
                        ArizaVeriKutucugu(tarih: "02/09/2024", arac: "Araç 4", ucret: "300.00₺", aciklama: "Silecek değişimi")
                    }
                    .padding(.top)
                }
                
                Divider()
                
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

struct ArizaVeriKutucugu: View {
    var tarih: String
    var arac: String
    var ucret: String
    var aciklama: String
    // var kilometre: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            ArizaVeriKutucuguComponent(image: "calendar", color: .blue, text: "Tarih: \(tarih)")
            ArizaVeriKutucuguComponent(image: "car.fill", color: .green, text: "Araç: \(arac)")
            ArizaVeriKutucuguComponent(image: "turkishlirasign.square.fill", color: .red, text: "Ücret: \(ucret)")
            ArizaVeriKutucuguComponent(image: "text.page.fill", color: .orange, text: "Açıklama: \(aciklama)")
            // YakitVeriKutucuguComponent(image: "speedometer", color: .purple, text: "Araç Kilometresi: \(kilometre)")
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.black, .gray.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .padding(.horizontal)
        
    }
}

struct ArizaRaporKutucuguComponent: View {
    var baslik: String
    var deger: String
    
    var body: some View {
        HStack {
            Text(baslik)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            Text(deger)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

struct ArizaVeriKutucuguComponent: View{
    var image: String
    var color: Color
    var text: String
    
    var body: some View{
        HStack {
            HStack{
                Image(systemName: image)
                    .foregroundColor(color)
                    .opacity(0.8)
            }
            .frame(width: 20)
            Text(text)
                .font(.callout)
                .bold()
                .foregroundColor(.primary.opacity(0.9))
        }
    }
}


#Preview {
    ArizaRaporlariView()
}
