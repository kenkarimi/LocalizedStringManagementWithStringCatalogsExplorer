//
//  ContentView.swift
//  LocalizedStringManagementWithStringCatalogsExplorer
//
//  Created by Kennedy Karimi on 15/08/2024.
//

import SwiftUI

/*
 Pluralization is the process of adapting a word or phrase to reflect the quantity it describes.
 
     One of the new features that were introduced with Xcode 15 is String Catalogs which are supposed to help developers make iOS and macOS applications localize even easier than before. While Localizable.strings and stringsdict have been helpful resources for storing and organizing strings, the String Catalogs are far more cohesive and more UI friendlier to manage localized strings.
     
     Key Features and Benefits:

     Unified management: Combine multiple .strings and .stringsdict files into a single catalog for better organization.
     Improved performance: Xcode can optimize string catalog access for faster app startup and performance.
     Advanced features: Support for additional localization features beyond simple pluralization, such as gender-specific forms and complex formatting.
     Better tooling: Xcode provides enhanced tools for managing and editing string catalogs.
 */

/* TIPS:
     To open Localizable.xcstrings as Source Code instead of String Catalog, right click on Localizable, Go to open as, choose 'Source Code'.

     Running Product>Build automatically generates entries in the String catalog for any strings in your Views e.g. Text(NSLocalizedString("Hello, world!", comment: "")) was initially Text("Hello, world!") but after running the command and the auto-generation. Auto-generated entries can't be edited deleted from the String Catalog's View. You have to switch to the Source Code's View to delete them.

    To add a new language other than the default english(en), go the Localization.xcstrings file and click on '+' image button that is on the bottom left corner of the panel with 'English' on it, then select a new language from the list.

    To remove a language, select the Project folder(blue folder with an 'A' logo) and go to Project > Info and check the 'Localizations' sections for the language you want to remove. Select it and click the '-' sign.
*/

/*
     NB: COMMON PROBLEMS:
    If Strings don't show correctly for entries added Localizable.xcstrings in that they show the key used in NSLocalizedString() instead of the value of the key or strings aren't being auto generated in the Stringsdict when you use the Product > Build command, follow these steps to diagnose the problem:
    1. Project Settings:
        Localization: Ensure your project is set up for localization. Right click on the Project folder(blue folder with an 'A' logo) and go to Project > Info and check the "Localizations" section.
        Build Settings: Verify that the "Localization" build setting is set to "Yes".
 
    2. File Path:

        Double-check that your Localizable.xcstrings file is placed in the correct location within your project (usually at the project root/Project folder level).
    3. Build Phases:

        Make sure the Localizable.xcstrings file is included in the "Copy Bundle Resources" build phase. To do so, right click on the Project folder and go to Targets > Build Phases. Under 'Copy Bundle Respurces', Localizable.xcstrings should be on the list alongside Preview Assets.xcassets and Assets.xcassets. If it's not there, add it.
 
    Solution 3 is what worked for me.
 */

/*
 Manually generated entries will have "extractionState" : "manual", as a key-value pair before the "localizations" object. Auto-generated entries ommit that the extractionState from the object.
 */
/*
 Format Specifiers in String Catalogs:
 The format specifiers used in String Catalogs are different from those used in Stringsdict files. This is due to a change in the underlying localization framework introduced in Xcode 15.
 
    Integer: %d(Stringdict) | %lld(StringCatalog)
    Object(typically string): %@ (Stringdict) | %@(String Catalog)
    Floating-point number: %f(Stringdict) | %lf(String Catalog)
    Floating-point(two decimal places): %.2f(Stringdict) | %lf(String Catalog)
 
 Positional arguments: Positional arguments in String Catalogs provides more flexibility and control over format specifiers, especially when dealing with complex formatting scenarios.
 e.g. Stringdict: "The price of %d items is KES %@."
      String Catalog(without positioning): "The price of %lld items is KES %@"
      String Catalog(with positioning): "The price of %1$lld items is KES "%2$@"
 
Regardless of whether the format specifier is an integer, string or floating point number, just add the number/positioning of the specifier(in relation to the other specifiers if more than one exists in a string) after % and a dollar sign directly after.
 
 NOTE: All three catalogs work with & without positioning, but positioning provides more flexibility and control when dealing with complex formatting scenarios.
 
 ALSO: While String Catalogs primarily use positional arguments for format specifiers, you can still use simple format specifiers like %d and %@ in many cases as you do in Stringdict files.
 
 IMPORTANT: To add plural forms for an entry in the catalog, you have to first provide a value for a key that contains any format specifier(this is a MUST). Then, select the entry(key-value pair row), right click and select "Vary by Plural". You'll now be able to provide values for 'one' and 'other'.
 
 More: https://youtu.be/kbgNL7VrQPo
 
 https://hackernoon.com/evolution-of-localization-in-swift-from-strings-to-string-catalogs
*/

struct ContentView: View {
    let count = 1 //%lld means an Int is expected
    let price = 100 //will be used to calculate an Int value which will be concatenated into the expected datatype which is a string(%@)
    let currency = "USD" //%@ means a string is expected.
    let slices = 4.5 //%lf
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text(NSLocalizedString("Hello, world!", comment: ""))
            
            Text(NSLocalizedString("greeting_message", comment: ""))
            
            Button {
                
            } label: {
                Text(NSLocalizedString("Cancel", comment: ""))
            }
            
            Button {
                
            } label: {
                Text(Bundle.main.localizedString(forKey: "save_button", value: nil, table: nil)) //Using Bundle and localizedString(forKey:value:table:)
            }
            
            Text(Bundle.main.localizedString(forKey: "goodbye_message", value: nil, table: nil))
            
            Text(NSLocalizedString("numberOfSongs", comment: ""))
            Text(String(format: NSLocalizedString("numberOfSongs", comment: ""), count))
            
            Text(NSLocalizedString("numberOfItems", comment: ""))
            Text(String(format: NSLocalizedString("numberOfItems", comment: ""), count, "KES. \(price * count)"))
            
            Text(NSLocalizedString("currency", comment: ""))
            Text(String(format: NSLocalizedString("currency", comment: ""), currency))
            
            Text(NSLocalizedString("bread", comment: ""))
            Text(String(format: NSLocalizedString("bread", comment: ""), slices))
        }
        .padding()
        .onAppear {
            let example_string: String = NSLocalizedString("", comment: "") //Localized strings are of type string.
        }
    }
}

#Preview {
    ContentView()
}
