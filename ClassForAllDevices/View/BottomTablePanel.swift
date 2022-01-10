//
//  BottomTablePanel.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: BottomTablePanel

struct BottomTablePanel: View {

    //MARK: Properties
    
    @ObservedObject var controller: Controller
    
    //MARK: Initializer

    init(_ controller: Controller) {
        self.controller = controller
    }
    
    var body: some View {
        ScrollView {
            ForEach(0..<controller.getData.numberCell, id: \.self) { item in
                CardTableView(item)
            }
            .padding(.vertical)
        }
    }
}

//MARK: CardTableView

struct CardTableView: View {
    
    //MARK: Properties
    
//    @ObservedObject var controller: Controller

    let number: Int
    
    private let heightCell: CGFloat = 65
    private let cornerRadius: CGFloat = 16
    
    //MARK: Initializer
    
    init(_ number: Int) {
        self.number = number
    }
    
    var body: some View {
        HStack {
            Text("Element:")
                .padding(.leading)
            
            Spacer()
            
            Text("\(number)")
                .bold()
                .padding(.trailing)
        }
        .font(.title)
        .padding()
        .foregroundColor(.defaultText)
        .frame(maxWidth: .infinity)
        .frame(height: heightCell)
        .background(Color.tePapaGreen.opacity(gradualGradationCell(number)),
                    in: RoundedRectangle(cornerRadius: cornerRadius))
        .padding(.horizontal)
    }
    
    //MARK: Private Methods

    func gradualGradationCell(_ index: Int) -> Double {
        1 - 0.04 * Double(index)
    }
}
