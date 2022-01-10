//
//  PseudoMVC.swift
//  ClassForAllDevices
//
//  Created by Валерий Игнатьев on 08.01.2022.
//

import SwiftUI

//MARK: - Model

struct DevicePseudo {
    let name      : String
    let rezolution: String
}

class DeviceStorePseudo: ObservableObject {
    
    //MARK: Properties

    @Published var name      : String
    @Published var rezolution: String
    
    //MARK: Initializer

    init(device: DevicePseudo) {
        name       = device.name
        rezolution = device.rezolution
    }
}

//MARK: - Controller

class DeviceControllerPseudo: ObservableObject {

    //MARK: Properties

    @Published var getData: DeviceStorePseudo?
    
    //MARK: Public Methods

    func getDeviceInfo() {
        let deviceName = UIDevice.current.name
        let rezolution = UIScreen.main.bounds.size
        
        let device = DevicePseudo(name: deviceName,
                            rezolution: "\(Int(rezolution.width)) x \(Int(rezolution.height)) px")
        
        getData = DeviceStorePseudo(device: device)
    }
    
    func removeDeviceInfo() {
        getData = nil
    }
}

//MARK: - View

struct MVCSwiftUIView: View {

    //MARK: Properties

    @ObservedObject private var controller = DeviceControllerPseudo()
    
    private let plugDevice = DevicePseudo(name: "...", rezolution: "...")
    private let spacing: Double = 60
    
    private var  isEmptyDeviceStore: Bool {
        controller.getData == nil
    }
    
    var body: some View {
        
        ZStack {
            BackgroundUIView()
            
            VStack(spacing: spacing) {
                MiniTableView(deviceInfo: controller.getData ?? DeviceStorePseudo(device: plugDevice))
                
                VStack {
                    ButtonView("get Device info", !isEmptyDeviceStore) {
                        getDeviceInfo()
                    }
                    
                    ButtonView("remove Device info", isEmptyDeviceStore) {
                        removeDeviceInfo()
                    }
                }
            }
        }
    }
    
    //MARK: Private Methods

    private func getDeviceInfo() {
        controller.getDeviceInfo()
    }
    
    private func removeDeviceInfo() {
        controller.removeDeviceInfo()
    }
}

struct ContentViewTest_Previews: PreviewProvider {
    static var previews: some View {
        MVCSwiftUIView()
    }
}

//MARK: - ButtonView

struct ButtonView: View {
    
    //MARK: Properties

    let title: String
    let action: () -> ()
    let isDisable: Bool
    
    //MARK: Initializer
    
    init(_ title: String, _ isDisable: Bool, _ action: @escaping () -> ()) {
        self.title = title
        self.isDisable = isDisable
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.title2.bold())
                .padding()
                .frame(width: 280)
                .background(.ultraThinMaterial, in: Capsule())
        }
        .disabled(isDisable)
    }
}

//MARK: - MiniTableView

struct MiniTableView: View {
    
    //MARK: Properties
    
    var deviceInfo: DeviceStorePseudo
    
    var body: some View {
        VStack {
            HStack {
                Text("Device model: ")
                Spacer()
                Text(deviceInfo.name)
                    .bold()
            }
            .padding()
            .background(.ultraThickMaterial)
            
            HStack {
                Text("Rezolution: ")
                Spacer()
                Text("\(deviceInfo.rezolution)")
                    .bold()
            }
            .padding()
            .background(.ultraThickMaterial)
            
        }
        .font(.title2)
    }
}

//MARK: - UIView

struct BackgroundUIView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
