//
//  Controller.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: - class Controller

final class Controller: ObservableObject {
    
    //MARK: Properties
    
    @Published var getData: DeviceStore
    
    //MARK: Initializer
    
    init() {
        let defaultDevice = DeviceStore.Device(modelName: "loading ...",
                                               imageName: Image("noImage"),
                                               heightImage: 250,
                                               numberCell: 0)
        
        getData = DeviceStore(defaultDevice)
    }
    
    
    //MARK: Public Methods
    
    func getDeviceInfo() {
        let device = DeviceStore.Device(modelName: UIDevice.current.model,
                                        imageName: Image("BigSur"),
                                        heightImage: heightImageDependingDevice(),
                                        numberCell: 20)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                self.getData = DeviceStore(device)
            }
        }
    }
    
    //MARK: Private Methods
    
    private func heightImageDependingDevice() -> CGFloat {
        let heightDevice = UIScreen.main.bounds.size.height
        var heightImage: CGFloat = 0
        
        switch heightDevice {
            //iPhone
        case 568:   heightImage = 260 //4"
        case 667:   heightImage = 265 //4,7"
        case 736:   heightImage = 270 //5,5"
        case 812:   heightImage = 275 //5,4" or 5,8"
        case 844:   heightImage = 280 //6,1" XDR
        case 896:   heightImage = 285 //6,1" or 6,5"
        case 926:   heightImage = 300 //6,7"
            //iPad
        case 1024:  heightImage = 450 //7,9" or 9,7"
        case 1133:  heightImage = 400 //8,3"
        case 1080:  heightImage = 430 //10,2"
        case 1112:  heightImage = 440 //10,5"
        case 1180:  heightImage = 450 //10,9"
        case 1194:  heightImage = 460 //11"
        case 1366:  heightImage = 510 //12,9"
            
        default:    break
        }
        
        return heightImage
    }
}
