//
//  BottomTablePanelView.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: - BottomTablePanelView

struct BottomTablePanelView: View {

    //MARK: Properties
    
    @ObservedObject var controller: Controller
    
    //MARK: Initializer

    init(_ controller: Controller) {
        self.controller = controller
    }
    
    var body: some View {
        ScrollView {
            ForEach(0..<controller.getData.numberCell, id: \.self) { item in
                CardTableView(controller, item)
            }
            .padding(.vertical)
        }
    }
}

struct BottomTablePanel_Previews: PreviewProvider {
    static var previews: some View {
        BottomTablePanelView(Controller())
    }
}


//MARK: - CardTableView

struct CardTableView: View {
    
    //MARK: Properties
    
    var controller: Controller
    let number: Int
    
    private let heightCell: CGFloat = 65
    private let cornerRadius: CGFloat = 16
    
    //MARK: Initializer
    
    init(_ controller: Controller, _ number: Int) {
        self.controller = controller
        self.number = number
    }
    
    var body: some View {
        HStack {
            Text("Element:")
                .padding(.leading)
            
            Spacer()
            
            Text("\(number + 1)")
                .bold()
                .padding(.trailing)
        }
        .font(.title)
        .padding()
        .foregroundColor(.defaultText)
        .frame(maxWidth: .infinity)
        .frame(height: heightCell)
        .background(Color.tePapaGreen
                        .opacity(controller.gradualGradationCell(number)),
                    in: RoundedRectangle(cornerRadius: cornerRadius))
        .padding(.horizontal)
    }
}
