//
//  Filters.swift
//  Autonomo
//
//  Created by Mete Turan on 1.10.2024.
//

import Foundation
import SwiftUI

struct filter_for_Raporlar: View  {
    
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
                Section(header: SectionType(title: "Dönem Aralığı").bold().foregroundColor(.primary)) {
                    HStack(spacing: 20) {
                        // Başlangıç Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Başlangıç Tarihi",
                            selection: $startDate,
                            width: 150,
                            height: 75
                        )
                        
                        // Bitiş Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Bitiş Tarihi",
                            selection: $endDate,
                            width: 150,
                            height: 75
                        )
                        
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

struct filterIslem_for_AracDetay: View {
    
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
                Section(header: SectionType(title: "Dönem Aralığı").bold().foregroundColor(.primary)) {
                    HStack(spacing: 20) {
                        // Başlangıç Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Başlangıç Tarihi",
                            selection: $startDate,
                            width: 150,
                            height: 75
                        )
                        
                        // Bitiş Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Bitiş Tarihi",
                            selection: $endDate,
                            width: 150,
                            height: 75
                        )
                        
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

struct filterIslem_for_rotalar: View {
    
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
                Section(header: SectionType(title: "Dönem Aralığı").bold().foregroundColor(.primary)) {
                    HStack(spacing: 20) {
                        // Başlangıç Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Başlangıç Tarihi",
                            selection: $startDate,
                            width: 150,
                            height: 75
                        )
                        
                        // Bitiş Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Bitiş Tarihi",
                            selection: $endDate,
                            width: 150,
                            height: 75
                        )
                        
                    }
                }
                .listRowBackground(Color.clear) // `List` içindeki arka plan rengini kaldırır
                .padding(.bottom, -10)
                
                Section(header: SectionType(title: "Fiyat Aralığı").bold().foregroundColor(.primary)) {
                    HStack {
                        FilteringPriceTypeWithStroke(
                            title: "Alt Fiyat",
                            selection: $startPrice,
                            width: 150,
                            height: 40)
                        Spacer()
                        FilteringPriceTypeWithStroke(
                            title: "Üst Fiyat",
                            selection: $endPrice,
                            width: 150,
                            height: 40)
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

struct filter_for_yakitRaporlar: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var startPrice: Int? = nil
    @State private var endPrice: Int? = nil
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: SectionType(title: "Dönem Aralığı").bold().foregroundColor(.primary)) {
                    HStack(spacing: 20) {
                        // Başlangıç Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Başlangıç Tarihi",
                            selection: $startDate,
                            width: 150,
                            height: 75
                        )
                        
                        // Bitiş Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Bitiş Tarihi",
                            selection: $endDate,
                            width: 150,
                            height: 75
                        )
                        
                    }
                }
                .listRowBackground(Color.clear) // `List` içindeki arka plan rengini kaldırır
                .padding(.bottom, -10)
                
                Section(header: SectionType(title: "Fiyat Aralığı").bold().foregroundColor(.primary)) {
                    HStack {
                        FilteringPriceTypeWithStroke(
                            title: "Alt Fiyat",
                            selection: $startPrice,
                            width: 150,
                            height: 40)
                        Spacer()
                        FilteringPriceTypeWithStroke(
                            title: "Üst Fiyat",
                            selection: $endPrice,
                            width: 150,
                            height: 40)
                    }
                    
                }
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

struct filterIslem_for_TumIslemlerRapor: View {
    
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
                Section(header: SectionType(title: "Dönem Aralığı").bold().foregroundColor(.primary)) {
                    HStack(spacing: 20) {
                        // Başlangıç Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Başlangıç Tarihi",
                            selection: $startDate,
                            width: 150,
                            height: 75
                        )
                        
                        // Bitiş Tarihi Seçimi
                        FilteringDateTypeWithStroke(
                            title: "Bitiş Tarihi",
                            selection: $endDate,
                            width: 150,
                            height: 75
                        )
                        
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


struct FilteringDateTypeWithStroke: View {
    let title: String
    @Binding var selection: Date
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray, lineWidth: 1)
            .overlay(
                VStack(alignment: .center) {
                    Text(title)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        Spacer()
                        DatePicker("", selection: $selection, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                        Spacer()
                    }
                }
            )
            .frame(width: width, height: height)
    }
}

struct FilteringPriceTypeWithStroke: View {
    
    let title: String
    @Binding var selection: Int?
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        TextField(title, value: $selection, format: .number)
            .textFieldStyle(PlainTextFieldStyle())
            .padding(4)
            .padding(.leading,5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .frame(width: width, height: height)
    }
}


