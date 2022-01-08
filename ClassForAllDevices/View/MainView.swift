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
    
    var body: some View {
        VStack(spacing: 0) {
            TopImagePanel()
            
            MiddleTextPanel()
            
            ScrollView {
                ForEach(1..<20) { item in
                    Text("Element: \(item)")
                        .font(.title)
                        .padding()
                        .foregroundColor(.defaultText)
                        .frame(maxWidth: .infinity)
                        .frame(height: GlobalConstant.heightCell)
                        .background(Color.tePapaGreen.opacity(gradualGradationColor(item)),
                                    in: RoundedRectangle(cornerRadius: GlobalConstant.cornerRadius))
                        .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .listStyle(.plain)
            
        }
        .background(LinearGradient(colors: [.ziggurat, .tePapaGreen],
                                   startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea()
    }
    
    //MARK: Private Methods

    private func gradualGradationColor(_ index: Int) -> Double {
        1 - 0.025 * Double(index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
    }
}

//MARK: TopImageView

struct TopImagePanel: View {
    var body: some View {
        GlobalConstant.image
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: GlobalConstant.heightImage, alignment: .top)
            .clipped()
    }
}

//MARK: MiddleTextPanel

struct MiddleTextPanel: View {
    
    let heightHeader: CGFloat = UIScreen.main.bounds.height / 20 + 10

    var body: some View {
        Text(GlobalConstant.device)
            .font(.largeTitle)
            .foregroundColor(.defaultText)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: heightHeader)
            .background(Color.tePapaGreen)
    }
}
