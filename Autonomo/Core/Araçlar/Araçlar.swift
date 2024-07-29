//
//  Ana Sayfa.swift
//  AracYonetimUygulamasiIOS
//
//  Created by Mete Turan on 24.07.2024.
//

import SwiftUI


struct Araclar: View {
    
    @State private var searchText = ""
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            
            VStack{
                // Özet bilgiler ve bul kısmı
                Text("Araç Sayısı: 13")
                    .padding(.top, 16) // Safe area üst padding
                
                // Arama Çubuğu
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                // Araçların sıralanması
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 2) {
                        ForEach((1...50).filter { "\($0)".contains(searchText) || searchText.isEmpty }, id: \.self) { index in
                            NavigationLink(destination: AracDetay()) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Plaka \(index)")
                                        .font(.headline)
                                    
                                    HStack {
                                        Image(systemName: "bus")
                                        Text("Atanan kişi")
                                        Text("Atanan rota")
                                    }
                                    .font(.footnote)
                                    
                                    Divider()
                                        .background(Color.primary)
                                        .frame(height: 2)
                                }
                                .padding(.bottom)
                                .padding(.horizontal)
                                .cornerRadius(8) // Optional: for rounded corners
                                .shadow(radius: 4) // Optional: for a shadow effect
                            }
                        }
                    }
                }

            }
            .navigationTitle("Araçlar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AracEkle()) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.primary)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "triangle")
                }
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.setShowsCancelButton(true, animated: true)
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchBar.setShowsCancelButton(false, animated: true)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            searchBar.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

#Preview {
    MainTabView()
}
