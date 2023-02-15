//
//  DateButton.swift
//  Task
//
//  Created by Kevin Amador Rios on 6/23/22.
//

import SwiftUI

struct DateButton: View {
    
    var title:String
    @ObservedObject var homeModel : HomeViewModel
    
    var body: some View {
        Button(action: {
            homeModel.UpdateDate(value: title)
        }) {
            Text(title)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .foregroundColor(homeModel.checkDate() == title ? .white:.black)
                .background(
                    homeModel.checkDate() == title ?
                        LinearGradient(colors: [.white,.purple], startPoint: .trailing, endPoint: .leading)
                    :
                        LinearGradient(colors: [.purple, .white], startPoint: .leading, endPoint: .trailing)
                )
        }
    }
}
