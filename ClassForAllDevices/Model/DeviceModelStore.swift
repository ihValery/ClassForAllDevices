//
//  DeviceModelStore.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: - class DeviceModelStore

final class DeviceModelStore: ObservableObject {
    
    //MARK: Properties
    
    let modelName: String
    let imageName: Image
    let heightImage: CGFloat
    let numberCell: Int
    
    //MARK: struct Device
    
    struct DeviceModel {
        let modelName: String
        let imageName: Image
        let heightImage: CGFloat
        let numberCell: Int
    }
    
    //MARK: Initializer
    
    init(_ device: DeviceModel) {
        modelName = device.modelName
        imageName = device.imageName
        heightImage = device.heightImage
        numberCell = device.numberCell
    }
}
