//
//  Ana Sayfa.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 24.07.2024.
//

import SwiftUI

struct AnaSayfa: View {
    
    @State private var isAddNewStaffActive = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    
                    
                    /*
                     // Uygulama simgesi ve profil fotoğrafı
                     HStack{
                     
                     Image(systemName: "triangle")
                     .font(.system(size: 30))
                     .padding(.leading,30)
                     .foregroundColor(.white)
                     .opacity(0.6)
                     
                     Spacer()
                     
                     Button(action: {
                     
                     }, label: {
                     Image(systemName: "gearshape")
                     .font(.system(size: 30))
                     .foregroundColor(.white)
                     .padding(.trailing,30)
                     .opacity(0.6)
                     })
                     }
                     .padding(.top)
                     */
                    
                    // Son 5 işlem
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke()
                            .overlay(
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        
                                        Image(systemName: "wrench.and.screwdriver.fill")
                                        
                                        Text("Araçlarınıza ait son 5 işlem")
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.primary)
                                            .opacity(0.9)
                                    }
                                    
                                    Divider()
                                        .background(Color.primary)
                                        .frame(height: 1)
                                    
                                    
                                    AnaSayfaSonIslemlerComponents(tarih: "28.07.2024", image: "hammer.circle", plaka: "81 S 0012 -", islemTuru: "Yağ bakımı", islemMaliyeti: "1.500,00 TL")
                                    
                                    Divider()
                                        .background(Color.secondary)
                                        .frame(height: 1)
                                    
                                    AnaSayfaSonIslemlerComponents(tarih: "27.07.2024", image: "fuelpump.circle", plaka: "81 S 0022 -", islemTuru: "Yakıt alımı", islemMaliyeti: "1.864,21 TL")
                                    
                                    
                                    Divider()
                                        .background(Color.secondary)
                                        .frame(height: 1)
                                    
                                    AnaSayfaSonIslemlerComponents(tarih: "26.07.2024", image: "folder.circle", plaka: "81 S 0019 -", islemTuru: "MTV Yenileme", islemMaliyeti: "455,33 TL")
                                    
                                    Divider()
                                        .background(Color.secondary)
                                        .frame(height: 1)
                                    
                                    AnaSayfaSonIslemlerComponents(tarih: "26.07.2024", image: "fuelpump.circle", plaka: "81 S 004 -", islemTuru: "Yakıt alımı", islemMaliyeti: "1.523,55 TL")
                                    
                                    Divider()
                                        .background(Color.secondary)
                                        .frame(height: 1)
                                    
                                    AnaSayfaSonIslemlerComponents(tarih: "25.07.2024", image: "hammer.circle", plaka: "81 S 0055 -", islemTuru: "Lastik değişimi", islemMaliyeti: "2343,25 TL")
                                    
                                    Divider()
                                        .background(Color.secondary)
                                        .frame(height: 1)
                                    
                                }
                                    .padding()
                            )
                            .frame(maxHeight: .infinity)
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke()
                            .overlay(
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Image(systemName: "fuelpump")
                                        
                                        Text("Toplam Yakıt Giderleri")
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.primary)
                                            .opacity(0.9)
                                    }
                                    
                                    Divider()
                                        .background(Color.primary)
                                        .fontWeight(.bold)
                                        .frame(height: 5)
                                    
                                    AnaSayfaOzetRaporlarComponents(raporTuru: "Günlük", raporMaliyeti: "1.628,45 TL")
                                    
                                    Divider()
                                        .background(Color.primary)
                                        .frame(height: 1)
                                    
                                    AnaSayfaOzetRaporlarComponents(raporTuru: "Haftalık", raporMaliyeti: "12.356,77 TL")
                                    
                                }
                                    .padding()
                            )
                            .frame(height: 150)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .navigationTitle("")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isAddNewStaffActive = true
                        }, label: {
                            Text("Ana Sayfa")
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                                .font(.title)
                        })
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isAddNewStaffActive = true
                        }, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.primary)
                                .font(.title3)
                                .bold()
                        })
                    }
                }
                .sheet(isPresented: $isAddNewStaffActive, content: {
                    KisayollarSheet()
                        .presentationDetents([.medium])
                })
            }
        }
    }
}

#Preview {
    MainTabView()
}



struct AnaSayfaSonIslemlerComponents: View {
    
    let tarih: String
    let image: String
    let plaka: String
    let islemTuru: String
    let islemMaliyeti: String
    
    var body: some View {
        Section(header:Text(tarih).foregroundColor(.secondary)){
            HStack {
                Image(systemName: image)
                Text(plaka)
                Text(islemTuru)
                Spacer()
                Text(islemMaliyeti)
            }
            .foregroundColor(.birincilRenk)
            .fontWeight(.bold)
            .bold()
        }
    }
}


struct AnaSayfaOzetRaporlarComponents: View {
    
    let raporTuru: String
    let raporMaliyeti: String
    
    var body: some View {
        HStack{
            Text(raporTuru)
            Spacer()
            Text(raporMaliyeti)
        }
        .foregroundColor(.birincilRenk)
        .fontWeight(.bold)
        .bold()
    }
}





















