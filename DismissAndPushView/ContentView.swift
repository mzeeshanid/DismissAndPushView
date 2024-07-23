//
//  ContentView.swift
//  DismissAndPushView
//
//  Created by Ali Aslam on 24/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showOptions: Bool = false
    @State private var showBlockView: Bool = false
    @State private var showReportView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    showOptions.toggle()
                } label: {
                    Text("Show options")
                }
            }
            .padding()
            .sheet(isPresented: $showOptions) {
                UserReportingView { option in
                    switch option {
                    case .block:
                        showBlockView.toggle()
                    case .report:
                        showReportView.toggle()
                    }
                }
                .presentationDetents([.height(100)])
            }
            .navigationDestination(isPresented: $showBlockView) {
                Text("Block view")
            }
            .navigationDestination(isPresented: $showReportView) {
                Text("Report view")
            }
        }
    }
}

#Preview {
    ContentView()
}
