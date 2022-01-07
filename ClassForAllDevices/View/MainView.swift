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
    
    let nameDevice: String = UIDevice.current.name
    
    var body: some View {
        VStack {
            Color.gray
                .frame(width: .infinity, height: 300)
            
            Text(nameDevice)
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
    }
}
