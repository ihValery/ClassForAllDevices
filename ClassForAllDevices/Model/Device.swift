//
//  Device.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI


//MARK: - class DeviceStore

final class DeviceStore: ObservableObject {
    
    //MARK: Properties
    
    @Published var modelName: String
    @Published var imageName: Image
    @Published var heightImage: CGFloat
    @Published var numberCell: Int
    
    //MARK: struct Device
    
    struct Device {
        let modelName: String
        let imageName: Image
        let heightImage: CGFloat
        let numberCell: Int
    }
    
    //MARK: Initializer
    
    init(_ device: Device) {
        modelName = device.modelName
        imageName = device.imageName
        heightImage = device.heightImage
        numberCell = device.numberCell
    }
}
