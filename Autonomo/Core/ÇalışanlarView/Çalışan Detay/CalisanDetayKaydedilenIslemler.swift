//
//  AracDetayIslemler.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

struct CalisanDetayKaydedilenIslemler: View {
    
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
            .navigationTitle("İşlemler - Seçilen Plaka")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $isFilterSheetActive) {
            filtering_AracIslem_for_calisan()
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isMoreSheetActive) {
            MoreSheet_For_Calisan_Detay_KaydedilenIslemler()
                .presentationDetents([.medium,.large])
        }
    }
}





struct filtering_AracIslem_for_calisan: View {
    
    @State private var islemTuru: IslemTuru = .hepsi
    
    @Environment(\.dismiss) var dismiss
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var startPrice: Int? = nil
    @State private var endPrice: Int? = nil
    
    enum IslemTuru: String, CaseIterable, Identifiable {
        case hepsi = "Hepsi"
        case yakit = "Yakıt"
        case ariza = "Arıza"
        case bakim = "Bakım"
        case sigorta = "Sigorta"
        case muayene = "Muayene"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: SectionType(title: "Dönem Aralığı")
                    .bold()
                    .foregroundColor(.primary))
                {
                    HStack {
                        FilteringDateTypeWithStroke(title: "Başlangıç", selection: $startDate, width: 150, height: 75)
                        Spacer()
                        FilteringDateTypeWithStroke(title: "Bitiş", selection: $endDate, width: 150, height: 75)
                    }
                }
                .listRowBackground(Color.clear) // `List` içindeki arka plan rengini kaldırır
                .padding(.bottom, -10)
                
                Section(header: SectionType(title: "Fiyat Aralığı").bold().foregroundColor(.primary)) {
                    HStack {
                        FilteringPriceTypeWithStroke(title: "Alt Fiyat", selection: $startPrice, width: 150, height: 40)
                        Spacer()
                        FilteringPriceTypeWithStroke(title: "Üst Fiyat", selection: $endPrice, width: 150, height: 40)
                    }
                    
                }
                .listRowBackground(Color.clear)
                .padding(.bottom, -10)
                
                Section(header: Text("İşlem Türü").bold().foregroundColor(.primary)) {
                    HStack {
                        Picker(selection: $islemTuru, label: Text("Seçiniz").foregroundColor(.secondary)) {
                            ForEach(IslemTuru.allCases) { tur in
                                Text(tur.rawValue)
                                    .foregroundColor(islemTuru == tur ? .primary : .secondary)
                                    .tag(tur)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                .accentColor(.primary)
                .listRowBackground(Color.clear)
                .padding(.bottom, -10)
                
                
                
            }
            .navigationTitle("Filtrele")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Kapat") {
                        dismiss()
                    }
                    .foregroundColor(.primary)
                    .opacity(0.8)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Uygula") {
                        // Uygula butonuna basıldığında yapılacak işlemler
                        dismiss()
                    }
                    .foregroundColor(.primary)
                    .opacity(0.8)
                }
            }
        }
    }
}



struct MoreSheet_For_Calisan_Detay_KaydedilenIslemler: View {
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
    CalisanDetayKaydedilenIslemler()
}
