//
//  SigortaKaskoMuayeneView.swift
//  Autonomo
//
//  Created by Mete Turan on 2.10.2024.
//

import SwiftUI

// Sigorta Muayene Kasko Bakım Raporları bu alanda belirtilecek.



struct TumIslemler: View {
    
    @State private var isFilteringActive = false
    @State private var isSortingActive = false
    @State private var isShareActive = false
    @State private var goReportsActive = false
    @State private var isFilterSheetActive = false
    
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        YakitVeriKutucugu(tarih: "01/10/2024", arac: "Araç 1", ucret: "2342.44₺", litre: "40L", kilometre: "75.000 km")
                        YakitVeriKutucugu(tarih: "02/10/2024", arac: "Araç 2", ucret: "1638.73₺", litre: "30L", kilometre: "64.000 km")
                        YakitVeriKutucugu(tarih: "05/10/2024", arac: "Araç 3", ucret: "765.00₺", litre: "30L", kilometre: "44.000 km")
                        YakitVeriKutucugu(tarih: "02/09/2024", arac: "Araç 4", ucret: "693.77₺", litre: "30L", kilometre: "124.000 km")
                        YakitVeriKutucugu(tarih: "02/10/2024", arac: "Araç 5", ucret: "3287.63₺", litre: "30L", kilometre: "42.000 km")
                        
                        DigerVeriKutucugu(tarih: "01/10/2024", arac: "Araç 1", ucret: "2300.00₺", tur: "Sigorta Yenileme")
                        DigerVeriKutucugu(tarih: "02/10/2024", arac: "Araç 2", ucret: "150₺", tur: "Kasko Yenileme")
                        DigerVeriKutucugu(tarih: "05/10/2024", arac: "Araç 3", ucret: "800.00₺", tur: "TüvTürk Muayenesi Yenileme")
                        DigerVeriKutucugu(tarih: "02/09/2024", arac: "Araç 4", ucret: "300.00₺", tur: "Egzoz Muayenesi Yenileme")
                        DigerVeriKutucugu(tarih: "02/09/2024", arac: "Araç 5", ucret: "300.00₺", tur: "Koltuk Muayenesi Yenileme")
                        DigerVeriKutucugu(tarih: "02/09/2024", arac: "Araç 6", ucret: "300.00₺", tur: "Trafik Muayenesi Yenileme")
                        
                        ArizaVeriKutucugu(tarih: "01/10/2024", arac: "Araç 1", ucret: "2300.00₺", aciklama: "Lastik tamiri")
                        ArizaVeriKutucugu(tarih: "02/10/2024", arac: "Araç 2", ucret: "150₺", aciklama: "Plakalık düştü tamir edildi")
                        ArizaVeriKutucugu(tarih: "05/10/2024", arac: "Araç 3", ucret: "800.00₺", aciklama: "Egzoz tamiri")
                        ArizaVeriKutucugu(tarih: "02/09/2024", arac: "Araç 4", ucret: "300.00₺", aciklama: "Silecek değişimi")
                    }
                    .padding(.top)
                }
                .padding(.bottom)
            }
            .toolbarRole(.editor)
            .sheet(isPresented: $isFilteringActive) {
                filterIslem_for_TumIslemlerRapor()
                    .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationBarBaslik(title: "Tüm İşlemler")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 0){
                        Button(action: {
                            isSortingActive.toggle()
                        }) {
                            Image(systemName: "arrow.up.arrow.down.circle")
                                .foregroundColor(.secondary)
                        }
                        
                        Button(action: {
                            isFilteringActive.toggle()
                        }) {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .foregroundColor(.secondary)
                        }
                        
                        Button(action: {
                            isShareActive.toggle()
                        }) {
                            Image(systemName: "square.and.arrow.up.circle")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}




#Preview {
    TumIslemler()
}
