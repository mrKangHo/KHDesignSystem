//
//  KHToast.swift
//
//
//  Created by KANO on 3/13/24.
//

import SwiftUI

struct KHToast: View {
    
    var toastText: String
    
    @Binding var isShowing:Bool

    var body: some View {
        VStack {
            Spacer()
            HStack {
                KHText(toastText).frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
                    .transition(.slide)
                    
            }
        }
        .padding()
        .opacity(self.isShowing ? 1 : 0)
        .onAppear {
            withAnimation {
                self.isShowing = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isShowing = false
                }
            }
        }
    }
}

#Preview {
    KHToast(toastText: "KHToast", isShowing: .constant(true))
}
