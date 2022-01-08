//
//  GlobalConstant.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

struct GlobalConstant {
    static let image: Image = Image("BigSur")
    
    static let device: String = UIDevice.current.name
    
    static let heightImage: CGFloat = 300
    static let heightHeader: CGFloat = UIScreen.main.bounds.height / 100 + 10
    static let heightCell: CGFloat = UIScreen.main.bounds.height / 100
    
    static let cornerRadius: CGFloat = 16
}
