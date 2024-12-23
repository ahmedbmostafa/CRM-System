//
//  UserDetailsView.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import SwiftUI

struct UserDetailsView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel = UserDetailsViewModel()
    
    // MARK: - Body
    
    var body: some View {
        
        List(viewModel.users) { user in
            UserDetailsRow()
                .environmentObject(UserDetailsRowViewModel(user: user))
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden, edges: .all)
                .id(user.id)
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .refreshable {
            viewModel.onAppear()
        }
        .onAppear {
            viewModel.onAppear()
        }
        
    }
}
