import SwiftUI

/*
 
     - View Notları -
 
 1) Kullanıcı duraklardan herhangi birisine uzun bastığında diğer durak kutucuklarıyla birlikte basılı tutulan kutucuğun boyutu da tek satıra düşürülüp sıralamanın değiştirilmesine müsaade edecek kod yazılacak. (Şu anki durumda basılı tutulabiliyor değişiklik yapıldığında eski haline geri dönüyor bu düzeltilecek.)
 
 */


struct RotaOlustur: View {
    @State private var rotaIsmi: String = ""
    @State private var seferSayisi: Int = 1
    @State private var baslangicSaati: String = ""
    @State private var bitisSaati: String = ""
    @State private var notlar: String = ""
    @State private var duraklar: [Durak] = [Durak()]
    
    @State private var gunler: [String] = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"]
    @State private var secilenGunler: Set<String> = []
    
    @State private var editMode: EditMode = .inactive
    @State private var showingActionSheet = false
    @State private var isReordering: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: SectionType(title: "Rota Bilgileri")) {
                    CustomTextField(title: "Rota İsmi", placehoder: "Örn: Mustafa Kemal Ortaokulu", text: $rotaIsmi)
                    CustomTextField(title: "Başlangıç Saati", placehoder: "Örn: 07:00", text: $baslangicSaati)
                    CustomTextField(title: "Bitiş Saati", placehoder: "Örn: 18:00", text: $bitisSaati)
                }

                Section(header: SectionType(title: "Gün Seçimi")) {
                    ForEach(gunler, id: \.self) { gun in
                        Toggle(gun, isOn: Binding(
                            get: { secilenGunler.contains(gun) },
                            set: { isSelected in
                                if isSelected {
                                    secilenGunler.insert(gun)
                                } else {
                                    secilenGunler.remove(gun)
                                }
                            }
                        ))
                    }
                }

                Section(header: SectionType(title: "Güzergah")) {
                    List {
                        ForEach(duraklar.indices, id: \.self) { index in
                            DurakView(durak: $duraklar[index], durakNumarasi: index + 1, isReordering: $isReordering)
                                .onLongPressGesture {
                                    withAnimation {
                                        isReordering = true
                                        editMode = .active
                                    }
                                }
                        }
                        .onMove(perform: moveDurak)
                    }
                    
                    if !isReordering {
                        Button(action: {
                            duraklar.append(Durak())
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Durak Ekle")
                            }
                        }
                    }
                }

                Section(header: SectionType(title: "Ekstra Notlar")) {
                    CustomTextField(title: "Notlar", placehoder: "Rota ile ilgili notlar ekleyin", text: $notlar)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingActionSheet = true
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.primary)
                    }
                    .actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(title: Text("İşlemler"), buttons: [
                            .default(Text("Rota Kopyala"), action: {}),
                            .default(Text("Rota Sil"), action: {}),
                            .default(Text("Favorilere Ekle"), action: {}),
                            .cancel()
                        ])
                    }
                }
            }
            .environment(\.editMode, $editMode)
            .navigationTitle("Rota Oluştur")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: isReordering) { newValue in
            if !newValue {
                withAnimation {
                    editMode = .inactive
                }
            }
        }
    }

    func moveDurak(from source: IndexSet, to destination: Int) {
        duraklar.move(fromOffsets: source, toOffset: destination)
    }
}

struct DurakView: View {
    @Binding var durak: Durak
    var durakNumarasi: Int
    @Binding var isReordering: Bool
    
    var body: some View {
        if isReordering {
            HStack {
                Text("Durak \(durakNumarasi): \(durak.adres)")
                    .font(.headline)
                Spacer()
            }
            .padding(.vertical, 4)
        } else {
            VStack(alignment: .leading, spacing: 4) {
                Text("Durak \(durakNumarasi)")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.vertical, 3)
                
                CustomTextField(title: "Adres", placehoder: "Örn: Atatürk Cad. No:45", text: $durak.adres)
                Divider()
                CustomTextField(title: "Saat", placehoder: "Örn: 08:30", text: $durak.saat)
                Divider()
                CustomTextField(title: "Öğrenci İsmi", placehoder: "Örn: Ali Yılmaz", text: $durak.alinacakKisi)
                Divider()
                CustomTextField(title: "Veli İsmi", placehoder: "Örn: Mehmet Yılmaz", text: $durak.veliIsmi)
                Divider()
                CustomTextField(title: "Veli Telefon Numarası", placehoder: "Örn: 0532 123 45 67", text: $durak.veliTelefonNumarasi)
            }
        }
    }
}

struct CustomTextField: View {
    var title: String
    var placehoder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.primary)
            TextField(placehoder, text: $text)
                .padding(.horizontal,6)
                .padding(.vertical, 4)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.1)))
            
        }
        .padding(.top, 4)
    }
}

struct Durak: Identifiable {
    let id = UUID().uuidString
    var adres: String = ""
    var saat: String = ""
    var alinacakKisi: String = ""
    var veliIsmi: String = ""
    var veliTelefonNumarasi: String = ""
}

#Preview {
    RotaOlustur()
}
