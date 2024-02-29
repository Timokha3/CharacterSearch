//
//  CharacterCell.swift
//  CharacterSearch
//
//  Created by Timur on 30.06.2022.
//

import SwiftUI

struct CharacterCell: View {
    let character: CharacterModel
    var body: some View {
        HStack {
            ImageCell(imageURL: character.image)
                .frame(width: 60, height: 60, alignment: .center)
                .cornerRadius(15)
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text(character.name)
                }
                HStack {
                    Text("Status:")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text(character.status ?? "-")
                }
            }
        }
    }
}

struct CharacterCellUIView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: CharacterModel.makeCharacter())
    }
}
