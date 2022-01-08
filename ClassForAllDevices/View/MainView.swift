//
//  MainView.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: MainView

struct MainView: View {
    
    //MARK: Properties
    
    @ObservedObject private var controller = Controller()
    
    private let noSpacing: Double = 0
    private let gradient = Gradient(colors: [.ziggurat, .tePapaGreen])
    
    var body: some View {
        VStack(spacing: noSpacing) {
            TopImagePanel(controller.getData?.imageName ?? Image("no image"),
                          controller.getData?.heightImage ?? 0)
            
            MiddleHeaderPanel(controller.getData?.modelName ?? "no model")
            
            BottomTablePanel(controller.getData?.numberCells ?? 0)
        }
        .background(.linearGradient(gradient, startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea()
        
        .onAppear() {
            print("HSCIUACIUa")
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
