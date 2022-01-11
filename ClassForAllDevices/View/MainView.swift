//
//  MainView.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: - MainView

struct MainView: View {
    
    //MARK: Properties
    
    @ObservedObject private var controller = Controller()
    
    private let noSpacing: Double = 0
    private let gradient = LinearGradient(colors: [.tePapaGreen, .ziggurat],
                                          startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        VStack(spacing: noSpacing) {
            
            TopImagePanelView(controller)
            
            MiddleHeaderPanelView(controller)
            
            BottomTablePanelView(controller)
                .background(gradient)
        }
        .background(Color.tePapaGreen)
        .ignoresSafeArea()
        
        .onAppear() {
            controller.getDeviceInfo()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
//            .preferredColorScheme(.dark)
    }
}
