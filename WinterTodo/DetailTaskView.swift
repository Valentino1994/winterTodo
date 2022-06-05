//
//  DetailTaskView.swift
//  WinterTodo
//
//  Created by Geunil Park on 2022/06/04.
//

import SwiftUI

struct DetailTaskView: View {
    @Binding var test: String
    var body: some View {
        Text(test)
    }
}
