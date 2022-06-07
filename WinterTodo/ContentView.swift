//
//  ContentView.swift
//  WinterTodo
//
//  Created by Geunil Park on 2022/06/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var isShowAdd: Bool = false
    @State var isShowSheet: Bool = false
    @State var isNow: String = ""
    
    private var days: [[String]] = [["SUN", "05"], ["MON", "06"], ["TUE", "07"], ["WED", "08"], ["THU", "09"], ["FRI", "10"], ["SAT", "11"]]
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("TODAY")
                    Text("6월 8일")
                        .font(.title3)
                }
                Spacer()
                Button(action: {
                    isShowAdd.toggle()}
                ) {
                    Text("+ Add Task")
                }
                .sheet(isPresented: self.$isShowAdd) {
                    AddTaskSheet()
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 25)
            HStack(spacing: 0) {
                ForEach(0..<7) {i in
                    VStack(spacing: 0) {
                        Text(days[i][0])
                            .font(.caption)
                        Text(days[i][1])
                            .font(.title)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(width: .infinity)
            .padding(.horizontal)
            ScrollView() {
                VStack {
                    ForEach(0..<7) {i in
                        TaskCardView()
                        .onTapGesture {
                            isShowSheet = true
                            isNow = String(i)
                        }
                        .sheet(isPresented: self.$isShowSheet) {
                            TaskDetailView(test: $isNow)
                        }
                    }
                }
            }
            .padding()
            .background(Color.winterblue)
            .ignoresSafeArea()
        }

        .background(Color.winterblue)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
