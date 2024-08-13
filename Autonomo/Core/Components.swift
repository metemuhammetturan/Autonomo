//
//  Components.swift
//  Autonomo
//
//  Created by Mete Turan on 30.07.2024.
//

import SwiftUI

//Kullanımı header: SectionType(title: "...")

struct SectionType: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 15))
            .textCase(.none)
    }
}



struct TabBarSayfalariBaslik: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.primary)
            .fontWeight(.bold)
            .font(.title)
        
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
                VStack {
                    Text(title)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    DatePicker("", selection: $selection, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
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
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .frame(width: width, height: height)
    }
}



/* Navigation Link sağ ok kaldırma
 
AracRaporSecimi(title: "Gider", image: "turkishlirasign")
    .background(
        NavigationLink("", destination: AracDetayMaliyetRaporlari())
            .opacity(0)
    )

*/



/* Sheet'i yarım açma
 
 .sheet(isPresented: $isAddNewStaffActive, content: {
     KisayollarSheet()
         .presentationDetents([.large, .medium])
 })
 
 */




/* Section background kaldırma
 
 Form {
     Section(header: SectionType(title: "Dönem")) {
         ...
         }
     }
     .padding()
     .listRowBackground(Color.clear) // `List` içindeki arka plan rengini kaldırır
     
 }
 */





//
//struct DatePickerFormat: View {
//    var body: some View {
//        
//    }
//}
