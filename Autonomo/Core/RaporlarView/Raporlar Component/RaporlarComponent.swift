//
//  RaporlarComponent.swift
//  Autonomo
//
//  Created by Mete Turan on 8.10.2024.
//

import SwiftUI


struct RaporlarKategoriBaslik: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .padding(.bottom, 5)
            .padding(.leading)
    }
}

struct SectionTypeForRaporlar: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 24))
            .textCase(.none)
            .bold()
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
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
