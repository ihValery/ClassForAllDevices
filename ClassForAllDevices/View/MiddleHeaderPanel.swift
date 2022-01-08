//
//  MiddleHeaderPanel.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: MiddleHeaderPanel

struct MiddleHeaderPanel: View {
    var body: some View {
        Text(GlobalConstant.deviceModel)
            .font(.largeTitle)
            .foregroundColor(.defaultText)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: GlobalConstant.heightHeader)
            .background(Color.tePapaGreen)
    }
}

struct MiddleHeaderPanel_Previews: PreviewProvider {
    static var previews: some View {
        MiddleHeaderPanel()
    }
}
