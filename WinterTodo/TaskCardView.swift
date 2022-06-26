//
//  TaskCardView.swift
//  WinterTodo
//
//  Created by Geunil Park on 2022/06/04.
//

import SwiftUI

struct TaskCardView: View {
    @Binding var item: String
    
    var body: some View {
        VStack {
            HStack {
                Text("URGENT")
                Spacer()
                Image(systemName: "clock.arrow.circlepath")
                Text("10:00 ~ 12:00")
                    .font(.footnote)
            }
            Divider()
                .padding(.bottom, 4)
            HStack {
                HStack {
                    Divider()
                        .background(.white)
                    VStack(alignment: .leading) {
                        Text("스프링 스터디 디자인")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("스프링 스터디에 쓰일 Todo를 디자인해야한다.")
                            .font(.subheadline)
                            .padding(0)
                    }
                    Spacer()
                }
                .frame(height: 48)
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

//struct TaskCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskCardView()
//    }
//}
