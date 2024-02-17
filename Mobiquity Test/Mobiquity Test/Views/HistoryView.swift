//
//  HistoryView.swift
//  Mobiquity Test
//
//  Created by Ross Viviani on 15/02/2024.
//

import SwiftUI

struct HistoryView: View {
    
    let data: [HistoryDataModel] = HistoryViewDataModel.history
    
    var body: some View {
        
        List {
            ForEach(data) { item in
                Text(item.title)
            }
        }
        .navigationTitle("History")
    }
}

#Preview {
    HistoryView()
}
