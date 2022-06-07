//
//  DetailTaskView.swift
//  WinterTodo
//
//  Created by Geunil Park on 2022/06/04.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var test: String
    var body: some View {
        DetailTaskCardView()
            .padding()
    }
}
