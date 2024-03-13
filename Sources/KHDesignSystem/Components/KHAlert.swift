//
//  KHAlert.swift
//
//
//  Created by KANO on 3/13/24.
//

import SwiftUI

struct KHAlert: View {
    
    @Binding var presentAlert: Bool
    
    var titleView:KHText?
    var messegeView:KHText?
    var buttonViews:[KHButton]?
    
        
    
    var body: some View {
        Color.black.opacity(0.4)
            .ignoresSafeArea().overlay {
                VStack {
                    titleView
                    messegeView
                    if let buttons = buttonViews {
                        HStack {
                            ForEach(buttons.indices, id: \.self) { idx in
                                buttons[idx]
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    
                            }
                            
                        }
                    }
                    
                }.padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)).frame(width: UIScreen.main.bounds.width - 80).background(.white).clipShape(.rect(cornerRadius: 12)).shadow(radius: 10)
            }
    }
}

#Preview {
    
    KHAlert(presentAlert: .constant(true),
            titleView: KHText("제목입니다"),
            messegeView: KHText("메세지입니다."),
            buttonViews: [KHButton(title: "왼쪽") {
        
    },
                          KHButton(title: "오른쪽") {
                              
                          }])
}
