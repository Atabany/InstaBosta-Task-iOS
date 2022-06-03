//
//  ProfileHeaderViewModel.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import Foundation

struct ProfileHeaderViewModel {
    let welcomeMessage: String
    let name: String
    let date: Date
    
    var dateFormatted: String {
        return date.monthDayYearString
    }
}
