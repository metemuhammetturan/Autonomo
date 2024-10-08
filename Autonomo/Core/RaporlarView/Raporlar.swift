//
//  Ana Sayfa.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 24.07.2024.
//

import SwiftUI

struct Raporlar: View {
    @State private var isFilteringActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                NavigationLink(destination: YakitRaporlariView()) {
                    RaporKutucukView(title: "Yakıt Raporları")
                }
                Spacer()
                NavigationLink(destination: ArizaRaporlariView()) {
                    RaporKutucukView(title: "Arıza Raporları")
                }
                Spacer()
                NavigationLink(destination: DigerRaporlar()) {
                    RaporKutucukView(title: "Diğer Raporlar")
                }
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBarBaslik(title: "Rapor Seçimi")
                }
            }
        }
        .sheet(isPresented: $isFilteringActive) {
            filter_for_Raporlar()
                .presentationDetents([.medium])
        }
    }
}

struct RaporKutucukView: View {
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.birincilRenk.opacity(0.4), Color.secondary.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                .frame(height: 150)
                .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

#Preview {
    Raporlar()
}
