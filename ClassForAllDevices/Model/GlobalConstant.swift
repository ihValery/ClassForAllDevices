//
//  GlobalConstant.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

struct GlobalConstant {
    static let image: Image = Image("BigSur")
    
    static let deviceModel: String = UIDevice.current.name
    
    static let heightImage: CGFloat = UIScreen.main.bounds.height > 750 ? 300 : 200
    static let heightHeader: CGFloat = 80
    static let heightCell: CGFloat = 70
    
    static let cornerRadius: CGFloat = 16
}
