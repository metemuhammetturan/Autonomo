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
            .font(.system(size: 16))
            .textCase(.none)
    }
}

struct NavigationBarImage<Destination: View>: View {
    
    let image: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Image(systemName: image)
                .foregroundColor(.secondary)
                .font(.headline)
        }
    }
}

/* Üsttekinin kullanımı
ToolbarItem(placement: .navigationBarTrailing) {
    NavigationBarImage(image: "plus.circle", destination: AracEkle())
}
*/

struct NavigationBarBaslik: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.primary)
            .fontWeight(.bold)
            .font(.title2)
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
