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
                
                KisayollarComponents(title: "İşlem Ekle", action: "", image: "plus.circle")
                
                KisayollarComponents(title: "Çalışan Ekle", action: "", image: "person.crop.circle")
                
                KisayollarComponents(title: "Rota Ekle", action: "", image: "mappin.circle")
                
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
    let action: String
    let image: String
    
    var body: some View {
            Button(action: {
                action
            }, label: {
                
                Image(systemName: image)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.trailing, 5)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            })
            .frame(height: 50)
        
            Divider()
            .background(Color.primary)
            .frame(height: 2)
    }
}

#Preview {
    AnaSayfa()
}
