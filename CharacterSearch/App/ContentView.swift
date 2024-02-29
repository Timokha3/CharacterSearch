//
//  ContentView.swift
//  CharacterSearch
//
//  Created by Timur on 30.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var charaters = [CharacterModel]()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(charaters, id: \.id) { character in
                NavigationLink(destination: DetailCharacterUIView()) {
                    CharacterCell(character: character)
                        .padding(5)
                }
            }
            .searchable(text: $searchText, prompt: "Search by Name")
            .navigationTitle("Character seach")
        }
        .onSubmit(of: .search) {
            search()
        }
        .onChange(of: searchText) { _ in
            search()
        }
    }
    
    func search() {
        if !searchText.isEmpty {
            Task {
                await loadCharacters(name: searchText)
            }
        }
    }
    
    func loadCharacters(name: String = "") async {
        if name.isEmpty { return }
        print("load \(name)")
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(searchText)") else {
            print("Error: Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decoderData = try? JSONDecoder().decode(ResponseModel<[CharacterModel]>.self, from: data) {
                print(decoderData)
                charaters = decoderData.results
            }
        } catch {
            print("Invalid data")
        }
    }
}
// MARK: - title
struct SectionTitle: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(charaters: [CharacterModel.makeCharacter(),
                                CharacterModel.makeCharacter(),
                                CharacterModel.makeCharacter()])
    }
}
