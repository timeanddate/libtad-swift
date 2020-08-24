//
//  HolidayTypes.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 29/07/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

///Holday Types
/// - SeeAlso: [Holiday Types](https://services.timeanddate.com/api/doc/v3/type-holidaytype.html)
public struct HolidayTypes: OptionSet, Sequence {

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public let rawValue: Int

    /// Combinations of all known types (except fun.
    static let all = HolidayTypes(rawValue: 1 << 0)

    /// Default holiday set: federal, federallocal, obs1, weekday.
    static let htDefault = HolidayTypes(rawValue: 1 << 1)

    /// Default set depending on country.
    ///
    /// For most countries, this is the same as default. However, for some countries it makes sense to add further types – this type accounts for this case. Currently this only affects the UK: local holidays are added as well. This is to include days that are only valid in one of countries – e.g. Jan 2 is a holiday only for Scotland.
    static let countrydefault = HolidayTypes(rawValue: 1 << 2)

    /// Important (obs1), common (obs2) and other observances (obs3).
    static let obs = HolidayTypes(rawValue: 1 << 3)

    /// All religious holidays: buddhism, christian, hebrew, hinduism, muslim, orthodox.
    static let religious = HolidayTypes(rawValue: 1 << 4)

    /// Buddhist holidays.
    static let buddhism = HolidayTypes(rawValue: 1 << 5)

    /// Christian holidays.
    static let christian = HolidayTypes(rawValue: 1 << 6)

    /// Hebrew holidays.
    static let hebrew = HolidayTypes(rawValue: 1 << 7)

    /// Hindu holidays.
    static let hinduism = HolidayTypes(rawValue: 1 << 8)

    /// Muslim holidays.
    static let muslim = HolidayTypes(rawValue: 1 << 9)

    /// Orthodox holidays.
    static let orthodox = HolidayTypes(rawValue: 1 << 10)

    /// Religious holidays, not covered by other types.
    static let otherreligion = HolidayTypes(rawValue: 1 << 11)

    /// Some countries (e.g. Sweden) have days which are de facto treted as official holidays, even if there's no legal regulation.
    static let defacto = HolidayTypes(rawValue: 1 << 12)

    /// Federal/national holidays.
    static let federal = HolidayTypes(rawValue: 1 << 13)

    /// Common local holidays.
    static let federallocal = HolidayTypes(rawValue: 1 << 14)

    /// Flag days.
    static let flagday = HolidayTypes(rawValue: 1 << 15)

    /// Half day holidays (only afternoon off). These days can be half day holidays either by law, or being de facto half day holidays (e.g. Sweden).
    static let halfday = HolidayTypes(rawValue: 1 << 16)

    /// Local holidays.
    static let local = HolidayTypes(rawValue: 1 << 17)

    /// Local observances.
    static let local2 = HolidayTypes(rawValue: 1 << 18)

    /// Important observances.
    static let obs1 = HolidayTypes(rawValue: 1 << 19)

    /// Common observances.
    static let obs2 = HolidayTypes(rawValue: 1 << 19)

    /// Other observances.
    static let obs3 = HolidayTypes(rawValue: 1 << 20)

    /// Optional holiday.
    ///
    /// Employment and holiday laws in certain countries allow employees to choose a limited number of holidays from a list of holidays. Some employees may choose to take the day off on these day, however, most offices and businesses remain open.
    static let optional = HolidayTypes(rawValue: 1 << 21)

    /// Normal working days.
    ///
    /// In some cases, working days are declared non-working days in order to form a longer period of consecutive non-working days. In exchange, weekend days become normal working days.
    static let weekday = HolidayTypes(rawValue: 1 << 22)

    /// Fun, Wacky and Trivial Holidays.
    static let fun = HolidayTypes(rawValue: 1 << 23)

}

extension HolidayTypes: CustomStringConvertible {
    static var debugDescriptions: [(Self, String)] = [
        (.all, "all"),
        (.htDefault, "default"),
        (.countrydefault, "countrydefault"),
        (.obs, "obs"),
        (.religious, "religious"),
        (.buddhism, "buddhism"),
        (.christian, "christian"),
        (.hebrew, "hebrew"),
        (.hinduism, "hinduism"),
        (.muslim, "muslim"),
        (.orthodox, "orthodox"),
        (.otherreligion, "otherreligion"),
        (.defacto, "defacto"),
        (.federal, "federal"),
        (.federallocal, "federallocal"),
        (.flagday, "flagday"),
        (.halfday, "halfday"),
        (.local, "local"),
        (.local2, "local2"),
        (.obs1, "obs1"),
        (.obs2, "obs2"),
        (.obs3, "obs3"),
        (.optional, "optional"),
        (.weekday, "weekday"),
        (.fun, "fun")
    ]

    public var description: String {
        let result: [String] = Self.debugDescriptions.filter { contains($0.0) }.map { $0.1 }
        return result[0]
    }
}

extension OptionSet where Self.RawValue == Int {
    public func makeIterator() -> OptionSetIterator<Self> {
        return OptionSetIterator(element: self)
    }
}

public struct OptionSetIterator<Element: OptionSet>: IteratorProtocol where Element.RawValue == Int {
    private let value: Element

    public init(element: Element) {
        self.value = element
    }

    private lazy var remainingBits = value.rawValue
    private var bitMask = 1

    public mutating func next() -> Element? {
        while remainingBits != 0 {
            defer { bitMask = bitMask &* 2 }
            if remainingBits & bitMask != 0 {
                remainingBits = remainingBits & ~bitMask
                return Element(rawValue: bitMask)
            }
        }
        return nil
    }
}
