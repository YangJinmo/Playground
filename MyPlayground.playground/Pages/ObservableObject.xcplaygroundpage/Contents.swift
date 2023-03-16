//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

PlaygroundPage.current.setLiveView(ContentView())

class StateManager : ObservableObject {
    @Published var counter = 0
}

struct ContentView : View {
    @ObservedObject var state = StateManager()
    
    var body: some View {
        TabView {
            Page1(state: state).tabItem { Text("Tab 1") }
            Page2(state: state).tabItem { Text("Tab 2") }
        }
    }
}

struct Page1 : View {
    @ObservedObject var state : StateManager
    
    var body: some View {
        Subview(state: state)
    }
}

struct Subview : View {
    @ObservedObject var state : StateManager
    
    var body : some View {
        Button(action: { state.counter += 1 }) {
            Text("Increment: \(state.counter)")
        }.foregroundColor(.purple)
    }
}

struct Page2 : View {
    @ObservedObject var state : StateManager
    
    var body: some View {
        Subview2(state: state)
    }
}

struct Subview2 : View {
    @ObservedObject var state : StateManager
    
    var body : some View {
        Button(action: { state.counter -= 1 }) {
            Text("Decrement: \(state.counter)")
        }.foregroundColor(.red)
    }
}

//: [Next](@next)
