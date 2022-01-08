//
//  BottomTablePanel.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: BottomTablePanel

struct BottomTablePanel: View {
    var body: some View {
        ScrollView {
            ForEach(1..<20) { item in
                CardTableView(item)
            }
            .padding(.vertical)
        }
    }
}

struct BottomTablePanel_Previews: PreviewProvider {
    static var previews: some View {
        BottomTablePanel()
    }
}

//MARK: CardTableView

struct CardTableView: View {
    
    //MARK: Properties
    
    let number: Int
    
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
        .frame(height: GlobalConstant.heightCell)
        .background(Color.tePapaGreen.opacity(gradualGradationColor(number)),
                    in: RoundedRectangle(cornerRadius: GlobalConstant.cornerRadius))
        .padding(.horizontal)
    }
    
    //MARK: Private Methods
    
    private func gradualGradationColor(_ index: Int) -> Double {
        1 - 0.025 * Double(index)
    }
}
