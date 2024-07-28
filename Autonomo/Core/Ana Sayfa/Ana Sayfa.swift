//
//  Ana Sayfa.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 24.07.2024.
//

import SwiftUI

struct AnaSayfa: View {
    var body: some View {
        ZStack{
            ArkaPlan()
            VStack(alignment: .leading, spacing: 5){
                
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
                
                // Son 5 işlem
                
                VStack{
                    RoundedRectangle(cornerRadius: 6)
                        .stroke()
                        .overlay(
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Araçlarınıza ait son 5 işlem")
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .padding(.bottom, 10)
                                    .foregroundColor(.white)
                                    .opacity(0.9)
                                
                                Divider()
                                    .background(Color.white)
                                    .frame(height: 1)
                                
                                Section(header:Text("28.07.2024").foregroundColor(.gray)){
                                    HStack {
                                        Image(systemName: "hammer.circle")
                                        Text("81 S 0012 -")
                                        Text("Yağ bakımı")
                                        Spacer()
                                        Text("1.500,00 TL")
                                    }
                                    .foregroundColor(.birincilRenk)
                                    .fontWeight(.light)
                                    .bold()
                                }
                                
                                Divider()
                                    .background(Color.gray)
                                    .frame(height: 1)
                                
                                Section(
                                    header:Text("27.07.2024")
                                        .foregroundColor(.gray)
                                ){
                                    HStack {
                                        Image(systemName: "fuelpump.circle")
                                        Text("81 S 0022 -")
                                        Text("Yakıt alımı")
                                        Spacer()
                                        Text("1.864,21 TL")
                                    }
                                    .foregroundColor(.birincilRenk)
                                    .fontWeight(.light)
                                    .bold()
                                }
                                
                                Divider()
                                    .background(Color.gray)
                                    .frame(height: 1)
                                
                                Section(header:Text("26.07.2024").foregroundColor(.gray)){
                                    HStack {
                                        Image(systemName: "folder.circle")
                                        Text("81 S 0019 -")
                                        Text("MTV Yenileme")
                                        Spacer()
                                        Text("455,33 TL")
                                    }
                                    .foregroundColor(.birincilRenk)
                                    .fontWeight(.light)
                                    .bold()
                                }
                                
                                Divider()
                                    .background(Color.gray)
                                    .frame(height: 1)
                                
                                Section(header:Text("26.07.2024").foregroundColor(.gray)){
                                    HStack {
                                        Image(systemName: "fuelpump.circle")
                                        Text("81 S 004 -")
                                        Text("Yakıt alımı")
                                        Spacer()
                                        Text("1.523,55 TL")
                                    }
                                    .foregroundColor(.birincilRenk)
                                    .fontWeight(.light)
                                    .bold()
                                }
                                
                                Divider()
                                    .background(Color.gray)
                                    .frame(height: 1)
                                
                                Section(header:Text("25.07.2024").foregroundColor(.gray)){
                                    HStack {
                                        Image(systemName: "hammer.circle")
                                        Text("81 S 0055 -")
                                        Text("Lastik değişimi")
                                        Spacer()
                                        Text("2343,25 TL")
                                    }
                                    .foregroundColor(.birincilRenk)
                                    .fontWeight(.light)
                                    .bold()
                                }
                                
                            }
                                .padding()
                                .padding(.vertical)
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
                                Text("Özet Raporlar")
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .padding(.bottom, 10)
                                    .foregroundColor(.white)
                                    .opacity(0.9)
                                
                                Divider()
                                    .background(Color.black)
                                    .fontWeight(.bold)
                                    .frame(height: 5)
                                
                                HStack{
                                    Text("Bugünkü yakıt gideri")
                                    Spacer()
                                    Text("1.628,45 TL")
                                }
                                .font(.headline)
                                
                                Divider()
                                    .background(Color.black)
                                    .frame(height: 1)
                                
                                HStack{
                                    Text("1 haftalık yakıt gideri")
                                    Spacer()
                                    Text("12.356,77 TL")
                                }
                                .font(.headline)
                                
                            }
                                .padding()
                        )
                        .frame(height: 150)
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    MainTabView()
}




















