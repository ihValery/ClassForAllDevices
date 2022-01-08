//
//  Device.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: struct Device

struct Device {
    
    //MARK: Properties

    let modelName: String
    let imageName: Image
    let heightImage: CGFloat
    let numberCells: Int
}

//MARK: class DeviceStore

final class DeviceStore: ObservableObject {
    
    //MARK: Properties

    @Published var modelName: String
    @Published var imageName: Image
    @Published var heightImage: CGFloat
    @Published var numberCells: Int
    
    //MARK: Initializer
    
    init(_ device: Device) {
        modelName = device.modelName
        imageName = device.imageName
        heightImage = device.heightImage
        numberCells = device.numberCells
    }
}
