#  Difference between Strings File(legacy), Stringsdict File(legacy) and String Catalog (.xcstrings)
     Strings File(legacy) vs Stringsdict File(legacy)

    1. String File (.strings)
        Legacy: Yes
        Purpose: Basic key-value pairs for simple translations.
        Limitations: No support for pluralization, number formatting, or context-specific variations.
     
     2. Stringsdict File (.stringsdict)
         Legacy: Sometimes marked as legacy, but still widely used.
         Purpose: Improved over .strings, offering support for pluralization, number formatting, and context-specific translations.
         Limitations: While better than .strings, it still has some limitations in terms of flexibility and management.
     3. String Catalog (.xcstrings)
         Legacy: No
         Purpose: Recommended approach for modern localization. Offers advanced features like pluralization, number formatting, context-specific variations, and better organization.
         Advantages: Seamless integration with Xcode, improved tooling support, and better performance.
     
     NB: While .stringsdict is still usable, it's generally recommended to adopt the .xcstrings format for new projects. It provides a more robust and efficient way to manage your app's localization.

