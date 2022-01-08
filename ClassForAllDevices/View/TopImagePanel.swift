//
//  TopImagePanel.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: TopImageView

struct TopImagePanel: View {
    
    //MARK: Properties
    
    let image: Image
    let heightImage: CGFloat
    
    private let cornerRadius: CGFloat = 16
    
    //MARK: Initializer
    
    init(_ image: Image, _ heightImage: CGFloat) {
        self.image = image
        self.heightImage = heightImage
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            image
                .resizable()
                .scaledToFill()
                .frame(height: heightImage, alignment: .top)
                .clipped()
            
            Text("\( Int(heightImage) )")
                .font(.headline)
                .foregroundColor(.defaultText)
                .padding()
                .background(Color.tePapaGreen,
                            in: RoundedRectangle(cornerRadius: cornerRadius))
                .padding()
        }
        .frame(height: heightImage)
    }
}

struct TopImagePanel_Previews: PreviewProvider {
    static var previews: some View {
        TopImagePanel(Image("BigSur"), 300)
    }
}
