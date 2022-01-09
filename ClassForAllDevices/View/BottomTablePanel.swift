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
    
//    @ObservedObject var controller: Controller
    
//    //MARK: Initializer
//
//    init(_ numberCells: Int) {
//        self.numberCells = numberCells
//    }
//
    
    var body: some View {
        ScrollView {
            List(0..<20) { item in
                CardTableView(item)
            }
            .padding(.vertical)
        }
    }
}

//struct BottomTablePanel_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomTablePanel(device: 20)
//    }
//}

//MARK: CardTableView

struct CardTableView: View {
    
    //MARK: Properties
    
    let number: Int
    
    private let heightCell: CGFloat = 70
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
        .background(Color.tePapaGreen.opacity(gradualGradationColor(number)),
                    in: RoundedRectangle(cornerRadius: cornerRadius))
        .padding(.horizontal)
    }
    
    //MARK: Private Methods

    func gradualGradationColor(_ index: Int) -> Double {
        1 - 0.04 * Double(index)
    }
}
