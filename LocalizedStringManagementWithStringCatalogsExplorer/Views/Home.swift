//
//  Home.swift
//  LocalizedStringManagementWithStringCatalogsExplorer
//
//  Created by Kennedy Karimi on 15/08/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        Text(NSLocalizedString("Welcome home.", comment: ""))
        Text(NSLocalizedString("welcome_message", comment: ""))
        Text(NSLocalizedString("Home is fine", comment: ""))
    }
}

#Preview {
    Home()
}
