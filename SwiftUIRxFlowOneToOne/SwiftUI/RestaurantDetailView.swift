//
//  RestaurantDetailView.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant?
    
    var body: some View {
        if let restaurant = self.restaurant {
            VStack {
                Image(restaurant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(restaurant.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                
                Spacer()
            }
        } else {
            EmptyView()
        }

    }
}
