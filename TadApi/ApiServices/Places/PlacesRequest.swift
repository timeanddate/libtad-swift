//
//  PlacesRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 20/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Place Request
/// - SeeAlso: [places] (https://dev.timeanddate.com/docs/places-service)
///
///~~~
///     var placeRequest = PlacesRequest()
///~~~
public class PlacesRequest: RequestObject {

    /// Return longitude and latitude for the geo object.
    public var geo: Bool = true

    /// The preferred language for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
    ///
    /// In case you have specific needs for a certain language/translation, please email api@timeanddate.com.s
    public var lang: String = Constants.DefaultLanguage

}
