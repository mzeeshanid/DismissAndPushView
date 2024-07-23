//
//  UserReportingView.swift
//  DismissAndPushView
//
//  Created by Ali Aslam on 24/07/2024.
//

import SwiftUI

enum UserReportingOption: CaseIterable {
    case block
    case report
    
    func title() -> String {
        switch self {
        case .block:
            "Block"
        case .report:
            "Report"
        }
    }
    
    func icon() -> String {
        switch self {
        case .block:
            "multiply.circle"
        case .report:
            "hand.raised.slash"
        }
    }
}

struct UserReportingView: View {
    var didSelectOption: (_ option: UserReportingOption) -> Void
    @Environment(\.dismiss) var dismiss
    var options = UserReportingOption.allCases
    
    var body: some View {
        VStack {
            ForEach(0..<options.count, id:\.self) { index in
                let option = options[index]
                Button {
                    dismiss()
                    didSelectOption(option)
                } label: {
                    HStack {
                        Image(systemName: option.icon())
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text(option.title())
                        Spacer()
                    }
                }
                .frame(minHeight: 40)
            }
        }
        .padding()
    }
}

#Preview {
    UserReportingView { option in
        
    }
}
