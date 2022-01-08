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
    private let noSpacing: Double = 0
    private let gradient = Gradient(colors: [.ziggurat, .tePapaGreen])
    
    var body: some View {
        VStack(spacing: noSpacing) {
            TopImagePanel()
            
            MiddleHeaderPanel()
            
            BottomTablePanel()
        }
        .background(.linearGradient(gradient, startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
//            .preferredColorScheme(.dark)
    }
}
