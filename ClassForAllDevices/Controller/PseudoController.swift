//
//  Controller.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: class Controller

final class Controller: ObservableObject {
    
    //MARK: Properties
    
    @Published var getData: DeviceStore
    
    //MARK: Initializer
    
    init() {
        let defaultDevice = Device(modelName: "loading ...",
                                   imageName: Image("noImage"),
                                   heightImage: 220,
                                   numberCell: 0)
        
        getData = DeviceStore(defaultDevice)
    }
    
    
    //MARK: Public Methods
    
    func getDeviceInfo() {
        let device = Device(modelName: UIDevice.current.model,
                            imageName: Image("BigSur"),
                            heightImage: heightImageDependingDevice(),
                            numberCell: 20)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                getData = DeviceStore(device)
            }
        }
    }
    
    //MARK: Private Methods
    
    private func heightImageDependingDevice() -> CGFloat {
        let heightDevice = UIScreen.main.bounds.size.height
        var heightImage: CGFloat = 0
        
        switch heightDevice {
        case 568:   heightImage = 150 //4"
        case 667:   heightImage = 170 //4,7"
        case 736:   heightImage = 195 //5,5"
        case 812:   heightImage = 220 //5,4" or 5,8"
        case 844:   heightImage = 250 //6,1" XDR
        case 896:   heightImage = 270 //6,1" or 6,5"
        case 926:   heightImage = 300 //6,7"
            
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
