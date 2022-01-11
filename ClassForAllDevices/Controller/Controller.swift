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
    
    @Published var getData: DeviceModelStore
    
    //MARK: Initializer
    
    init() {
        let defaultDevice = DeviceModelStore.DeviceModel(modelName: "loading ...",
                                                         imageName: Image("noImage"),
                                                         heightImage: 250,
                                                         numberCell: 0)
        
        getData = DeviceModelStore(defaultDevice)
    }
    
    
    //MARK: Public Methods
    
    func getDeviceInfo() {
        let device = DeviceModelStore.DeviceModel(modelName: UIDevice.current.model,
                                                  imageName: Image("BigSur"),
                                                  heightImage: heightImageDependingDevice(),
                                                  numberCell: 20)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                self.getData = DeviceModelStore(device)
            }
        }
    }
    
    func gradualGradationCell(_ index: Int) -> Double {
        1 - 0.04 * Double(index)
    }
    
    //MARK: Private Methods
    
    private func heightImageDependingDevice() -> CGFloat {

        switch UIScreen.main.bounds.height {
            //iPhone
        case 568:   return 220 //4"
        case 667:   return 240 //4,7"
        case 736:   return 250 //5,5"
        case 812:   return 260 //5,4" or 5,8"
        case 844:   return 270 //6,1" XDR
        case 896:   return 285 //6,1" or 6,5"
        case 926:   return 300 //6,7"
            //iPad
        case 1024:  return 450 //7,9" or 9,7"
        case 1133:  return 400 //8,3"
        case 1080:  return 430 //10,2"
        case 1112:  return 440 //10,5"
        case 1180:  return 450 //10,9"
        case 1194:  return 460 //11"
        case 1366:  return 510 //12,9"
            
        default:    return 0
        }
    }
}
