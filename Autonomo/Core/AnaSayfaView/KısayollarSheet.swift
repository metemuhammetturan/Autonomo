//
//  KısayollarSheet.swift
//  Autonomo
//
//  Created by Mete Turan on 29.07.2024.
//

import SwiftUI

struct KisayollarSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                
                KisayollarComponents(title: "İşlem Ekle", destination: AnyView(IslemEkle()), image: "plus.circle")
                    .presentationDetents([.large])
                
                Divider()
                    .background(Color.primary)
                    .frame(height: 2)
                
                KisayollarComponents(title: "Araç Ekle", destination: AnyView(AracEkle()), image: "bus")
                
                Divider()
                    .background(Color.primary)
                    .frame(height: 2)
                
                KisayollarComponents(title: "Çalışan Ekle", destination: AnyView(CalisanEkle()), image: "person.crop.circle")
                
                Divider()
                    .background(Color.primary)
                    .frame(height: 2)
                
                KisayollarComponents(title: "Rota Ekle", destination: AnyView(Text("Rota Ekle View")), image: "mappin.circle")
                
                
                Divider()
                    .background(Color.primary)
                    .frame(height: 2)
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary.opacity(0.8), lineWidth: 2)
                        
                        Text("İptal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .navigationTitle("Kısayollar")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
        }
    }
}

struct KisayollarComponents: View {
    
    let title: String
    let destination: AnyView
    let image: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: image)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.trailing, 5)
                    .frame(width: 16, height: 16)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.leading)
            }
        }
        .frame(height: 50)
    }
}

#Preview {
    KisayollarSheet()
}
