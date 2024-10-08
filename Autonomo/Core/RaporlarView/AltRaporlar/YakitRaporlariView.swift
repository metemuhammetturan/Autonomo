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
            VStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        YakitVeriKutucugu(tarih: "01/10/2024", arac: "Araç 1", ucret: "2342.44₺", litre: "40L", kilometre: "75.000 km")
                        YakitVeriKutucugu(tarih: "02/10/2024", arac: "Araç 2", ucret: "1638.73₺", litre: "30L", kilometre: "64.000 km")
                        YakitVeriKutucugu(tarih: "05/10/2024", arac: "Araç 3", ucret: "765.00₺", litre: "30L", kilometre: "44.000 km")
                        YakitVeriKutucugu(tarih: "02/09/2024", arac: "Araç 4", ucret: "693.77₺", litre: "30L", kilometre: "124.000 km")
                        YakitVeriKutucugu(tarih: "02/10/2024", arac: "Araç 5", ucret: "3287.63₺", litre: "30L", kilometre: "42.000 km")
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
                        YakitRaporKutucuguComponent(baslik: "Aylık Toplam Yakıt Gideri:", deger: "1500₺")
                        YakitRaporKutucuguComponent(baslik: "Aylık Ortalama Yakıt Tüketimi:", deger: "8 L / 100 km")
                        YakitRaporKutucuguComponent(baslik: "Kilometre Başına Yakıt Maliyeti:", deger: "2.3 ₺ / km")
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
                filter_for_yakitRaporlar()
                    .presentationDetents([.medium])
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.black, .gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationBarBaslik(title: "Yakıt Raporları")
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

struct YakitVeriKutucugu: View {
    var tarih: String
    var arac: String
    var ucret: String
    var litre: String
    var kilometre: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            YakitVeriKutucuguComponent(image: "calendar", color: .blue, text: "Tarih: \(tarih)")
            YakitVeriKutucuguComponent(image: "car.fill", color: .green, text: "Araç: \(arac)")
            YakitVeriKutucuguComponent(image: "fuelpump.fill", color: .red, text: "Ücret: \(ucret)")
            YakitVeriKutucuguComponent(image: "gauge", color: .orange, text: "Litre: \(litre)")
            YakitVeriKutucuguComponent(image: "speedometer", color: .purple, text: "Araç Kilometresi: \(kilometre)")
            
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

struct YakitRaporKutucuguComponent: View {
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

struct YakitVeriKutucuguComponent: View{
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
    YakitRaporlariView()
}


/*
 
 
 */
