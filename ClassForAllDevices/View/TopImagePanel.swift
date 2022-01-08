//
//  TopImagePanel.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: TopImageView

struct TopImagePanel: View {
    var body: some View {
        GlobalConstant.image
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: GlobalConstant.heightImage, alignment: .top)
            .clipped()
    }
}

struct TopImagePanel_Previews: PreviewProvider {
    static var previews: some View {
        TopImagePanel()
    }
}
