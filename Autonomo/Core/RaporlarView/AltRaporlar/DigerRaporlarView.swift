//
//  SigortaKaskoMuayeneView.swift
//  Autonomo
//
//  Created by Mete Turan on 2.10.2024.
//

import SwiftUI

// Sigorta Muayene Kasko Bakım Raporları bu alanda belirtilecek.


struct DigerRaporlar: View {
    
    @State private var isFilteringActive = false
    @State private var isSortingActive = false
    @State private var isShareActive = false
    @State private var goReportsActive = false
    
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        DigerVeriKutucugu(tarih: "01/10/2024", arac: "Araç 1", ucret: "2300.00₺", tur: "Sigorta Yenileme")
                        DigerVeriKutucugu(tarih: "02/10/2024", arac: "Araç 2", ucret: "150₺", tur: "Kasko Yenileme")
                        DigerVeriKutucugu(tarih: "05/10/2024", arac: "Araç 3", ucret: "800.00₺", tur: "TüvTürk Muayenesi Yenileme")
                        DigerVeriKutucugu(tarih: "02/09/2024", arac: "Araç 4", ucret: "300.00₺", tur: "Egzoz Muayenesi Yenileme")
                        DigerVeriKutucugu(tarih: "02/09/2024", arac: "Araç 5", ucret: "300.00₺", tur: "Koltuk Muayenesi Yenileme")
                        DigerVeriKutucugu(tarih: "02/09/2024", arac: "Araç 6", ucret: "300.00₺", tur: "Trafik Muayenesi Yenileme")
                    }
                    .padding(.top)
                }
                .padding(.bottom)
            }
            .sheet(isPresented: $isFilteringActive) {
               // filter_for_yakitRaporlar()
                  //  .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationBarBaslik(title: "Diğer Raporlar")
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
                        
                        NavigationLink(destination: DigerRaporDetay()){
                            Image(systemName: "chart.bar.xaxis")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

struct DigerVeriKutucugu: View {
    var tarih: String
    var arac: String
    var ucret: String
    var tur: String
    // var kilometre: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            DigerVeriKutucuguComponent(image: "calendar", color: .blue, text: "Tarih: \(tarih)")
            DigerVeriKutucuguComponent(image: "car.fill", color: .green, text: "Araç: \(arac)")
            DigerVeriKutucuguComponent(image: "turkishlirasign.square.fill", color: .red, text: "Ücret: \(ucret)")
            DigerVeriKutucuguComponent(image: "text.page.fill", color: .orange, text: "Tür: \(tur)")
            
            /*
             Tür:
             
            - [ ]  Sigorta
            - [ ]  Kasko
            - [ ]  TüvTürk Muayene
            - [ ]  Egzoz Muayenesi
            - [ ]  Koltuk Muayenesi
            - [ ]  Trafik Sigortası
            */
            
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

struct DigerRaporKutucuguComponent: View {
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

struct DigerVeriKutucuguComponent: View{
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
    DigerRaporlar()
}
