//
//  DetailTaskCardView.swift
//  WinterTodo
//
//  Created by Geunil Park on 2022/06/06.
//

import SwiftUI

struct DetailTaskCardView: View {
    @State var isDone: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                Text("메인 화면 만들기")
                    .padding()
                Spacer()
            }
            if isDone == true {
                Rectangle()
                    .frame(height: 1)
                    .padding()
            }
        }
        .background(Color.winterblue)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .onTapGesture { isDone.toggle() }
    }
}

struct DetailTaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTaskCardView()
    }
}
