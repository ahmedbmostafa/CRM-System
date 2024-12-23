//
//  UserDetailsRow.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import SwiftUI

struct UserDetailsRow: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var viewModel: UserDetailsRowViewModel
    
    // MARK: - Body
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.name)
                        .font(.headline)
                    
                    Text("Email: \(viewModel.email)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    
                    Text("Phone: \(viewModel.phone)")
                        .font(.subheadline)
                    
                    Text("Company: \(viewModel.companyName)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Address: \(viewModel.address)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(viewModel.isLiked ? .red : .gray)
                    .onTapGesture {
                        viewModel.isLiked.toggle()
                    }
            }
            .padding(.bottom, 8)
            
            Divider()
        }
        .padding(.bottom, 8)
        .onChange(of: viewModel.isLiked) { isLiked in
            viewModel.cacheLikedState(isLiked: isLiked, userID: viewModel.userID)
        }
    }
}
