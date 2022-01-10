//
//  MiddleHeaderPanel.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: - MiddleHeaderPanel

struct MiddleHeaderPanel: View {
    
    //MARK: Properties
    @ObservedObject var controller: Controller
    
    let deviceModel: String
    private let heightHeader: CGFloat = 70
    
    //MARK: Initializer
    
    init(_ controller: Controller) {
        self.controller = controller
        deviceModel = controller.getData.modelName
    }

    var body: some View {
        Text(deviceModel)
            .font(.largeTitle)
            .foregroundColor(.defaultText)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: heightHeader)
            .background(Color.tePapaGreen)
    }
}

struct MiddleHeaderPanel_Previews: PreviewProvider {
    static var previews: some View {
        MiddleHeaderPanel(Controller())
    }
}
