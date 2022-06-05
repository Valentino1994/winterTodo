//
//  AddTaskSheet.swift
//  WinterTodo
//
//  Created by Geunil Park on 2022/06/04.
//

import SwiftUI

struct AddTaskSheet: View {
    @State private var taskName: String = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("이름")
                TextField("Task Name", text: $taskName)
                Divider()
            }
            VStack(alignment: .leading) {
                Text("날짜")
                TextField("Date", text: $taskName)
                Divider()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("시작 시간")
                    TextField("Start Time", text: $taskName)
                    Divider()
                }
                VStack(alignment: .leading) {
                    Text("끝 시간")
                    TextField("End Time", text: $taskName)
                    Divider()
                }
            }
            VStack(alignment: .leading) {
                Text("설명")
                TextField("Description", text: $taskName)
                Divider()
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("타입")
                    Text("추가하기")
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<100) {i in
                            Text("\(i)")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct AddTaskSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskSheet()
    }
}
