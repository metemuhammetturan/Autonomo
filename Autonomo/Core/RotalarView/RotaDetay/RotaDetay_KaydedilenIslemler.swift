//
//  AracDetayIslemler.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

struct RotaDetay_KaydedilenIslemler: View {
    
    @State private var searchText = ""
    @State private var isFilterSheetActive = false
    @State private var isMoreSheetActive = false
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Toplam 34 işlem bulundu")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                    // Sıralama
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundColor(.secondary)
                    
                    // Filtreleme
                    Button(action: {
                        isFilterSheetActive = true
                    }, label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.secondary)
                    })
                    
                    // Daha fazla butonu
                    Button(action: {
                        isMoreSheetActive = true
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.secondary)
                    })
                }
                .padding()
                
                // Tüm işlemlerin sıralanması
                ScrollView {
                    LazyVStack {
                        ForEach((1...34).filter { "\($0)".contains(searchText) || searchText.isEmpty }, id: \.self) { index in
                            VStack(alignment: .leading, spacing: 8) {
                                NavigationLink(destination: IslemDetayEkrani()) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Tarih \(index)")
                                            .font(.headline)
                                        
                                        HStack {
                                            Image(systemName: "bus")
                                            Text("İşlem Türü")
                                            Text("İşlem Açıklaması")
                                            Text("İşlem Maliyeti")
                                        }
                                        .font(.footnote)
                                        
                                        Divider()
                                            .background(Color.primary)
                                            .frame(height: 2)
                                    }
                                    .padding(.bottom)
                                    .padding(.horizontal)
                                    .cornerRadius(8)
                                    .shadow(radius: 4)
                                    .foregroundColor(.primary)
                                    .shadow(radius: 6)
                                }
                            }
                            .swipeActions(edge: .trailing) {
                                Button {
                                    // Düzenleme işlemi
                                    print("Düzenle butonuna tıklandı")
                                } label: {
                                    Text("Düzenle")
                                }
                                .tint(.blue)
                                
                                Button(role: .destructive) {
                                    // Silme işlemi
                                    print("Sil butonuna tıklandı")
                                } label: {
                                    Text("Sil")
                                }
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "İşlem ara...")
                }
                Spacer()
            }
            .navigationTitle("İşlemler - Seçilen Rota")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $isFilterSheetActive) {
            filterIslem_for_rotalar()
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isMoreSheetActive) {
            MoreSheet_For_Rota_Detay_KaydedilenIslemler()
                .presentationDetents([.medium,.large])
        }
    }
}


// Yapılacak
 
 
 



struct MoreSheet_For_Rota_Detay_KaydedilenIslemler: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    
                    // İşlem Ekle Butonu
                    NavigationLink(destination: CalisanaIslemEkle()) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.primary)
                                .frame(width: 16,height: 16)
                            
                            Text("İşlem Ekle")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .cornerRadius(8)
                    }
                    
                    // Gönder Butonu
                    Button(action: {
                        // Gönder butonuna tıklanıldığında yapılacak işlemler
                    }) {
                        HStack{
                            Image(systemName: "square.and.arrow.up.circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.primary)
                                .frame(width: 16,height: 16)
                            
                            Text("Bilgileri Dışa Aktar")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            .navigationTitle("Daha Fazla")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Kapat") {
                        dismiss() // Sheet'i kapat
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}



#Preview {
    RotaDetay_KaydedilenIslemler()
}
