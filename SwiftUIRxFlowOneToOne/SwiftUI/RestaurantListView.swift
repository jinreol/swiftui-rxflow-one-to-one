//
//  RestaurantListView.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import SwiftUI
import RxFlow
import RxCocoa

struct RestaurantListView: View {
    var steps = PublishRelay<Step>()
    
    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    .onTapGesture {
                        let _ = print("\(restaurant.name)")
                        steps.accept(AppStep.detailVC(restaurant))
                    }
            }
        }
    }
}
    
struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}


struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
