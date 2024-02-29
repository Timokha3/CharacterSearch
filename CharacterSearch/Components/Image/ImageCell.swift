//
//  ImageCell.swift
//  CharacterSearch
//
//  Created by Timur on 30.06.2022.
//

import SwiftUI

struct ImageCell: View {
    
    @State private var image: UIImage? = nil
    
    public let imageURL: String?
    public let placeholderImage: UIImage = UIImage(imageLiteralResourceName: "noImage")
    
    public var body: some SwiftUI.View {
        Image(uiImage: image ?? placeholderImage)
            .resizable()
            .scaledToFill()
            .onAppear {
                withAnimation {
                    loadImage()
                }
            }
    }
    
    private func loadImage() {
        print("load image \(imageURL ?? "")")
        guard let url = URL(string: imageURL ?? "") else {
            print("Error: Invalid url")
            return
        }
        
        do {
            let queue = DispatchQueue.global(qos: .utility)
            queue.async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    image = UIImage(data: imageData)
                }
            }
            
        }
    }
}
