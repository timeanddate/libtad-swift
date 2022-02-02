//
//  TadEndPoint.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 01/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case production
    case staging
}

public class RequestObject {

}

public class TadApi: EndPointType {

    private var _path: String
    private var _task: HTTPTask

    var environmentBaseURL: String {
        return "https://api.xmltime.com/"
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        return _path
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        return _task
    }

    init(accesskey: String, secretkey: String, request: RequestObject) {

        func astronomyBuilder(accessKey: String, secretKey: String, request: AstronomyRequest) -> HTTPTask {
            var urlParameters: Parameters = Parameters()
            urlParameters["accesskey"] = accessKey
            urlParameters["object"] = request.objects.map {$0.rawValue}.joined(separator: ",")
            urlParameters["placeid"] = request.placeId
            urlParameters["startdt"] = request.startDate.iso8601withFractionalSeconds
            if request.endDate != nil {
                urlParameters["enddt"] = request.endDate?.iso8601withFractionalSeconds
            }
            if request.types.count > 0 {
                urlParameters["types"] = request.types.map {$0.rawValue}
            }
            urlParameters["radius"] = request.radius
            urlParameters["geo"] = request.geo.intValue
            urlParameters["utctime"] = request.utcTime.intValue
            urlParameters["isotime"] = request.isoTime.intValue
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accessKey, secretKey: secretKey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func astrodataBuilder(accessKey: String, secretKey: String, request: AstrodataRequest) -> HTTPTask {
            var urlParameters: Parameters = Parameters()
            urlParameters["accesskey"] = accesskey
            urlParameters["object"] = request.objects.map {$0.rawValue}.joined(separator: ",")
            urlParameters["placeid"] = request.placeId
            urlParameters["interval"] = request.interval.map {$0}.joined(separator: ",")
            urlParameters["radius"] = request.radius
            urlParameters["localtime"] = request.localtime.intValue
            urlParameters["utctime"] = request.utcTime.intValue
            urlParameters["isotime"] = request.isoTime.intValue
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func businessdateBuilder(accessKey: String, secretKey: String, request: BusinessDateRequest) -> HTTPTask {
            var urlParameters: Parameters = Parameters()
            urlParameters["accesskey"] = accesskey
            urlParameters["placeid"] = request.placeId
            urlParameters["country"] = request.country
            urlParameters["startDt"] = request.startDt.iso8601withFractionalSeconds
            urlParameters["days"] = request.days
            if request.state != "" {
                urlParameters["state"] = request.state
            }
            urlParameters["include"] = request.include.intValue
            urlParameters["filter"] = request.filter
            urlParameters["op"] = request.op.map {$0.rawValue}.joined(separator: ",")
            if request.repeatDays > 0 {
                urlParameters["repeat"] = request.repeatDays
            }
            urlParameters["verbosetime"] = request.verbosetime.intValue
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func businessDurationBuilder(accessKey: String, secretKey: String, request: BusinessDurationRequest) -> HTTPTask {
            var urlParameters: Parameters = Parameters()
            urlParameters["accesskey"] = accesskey
            urlParameters["placeid"] = request.placeId
            urlParameters["country"] = request.country
            if request.state != "" {
                urlParameters["state"] = request.state
            }
            urlParameters["startdt"] = request.startDt.iso8601withFractionalSeconds
            urlParameters["enddt"] = request.endDt.iso8601withFractionalSeconds
            urlParameters["include"] = request.include.intValue
            urlParameters["filter"] = request.filter
            urlParameters["includelastdate"] = request.includelAStdate.intValue
            urlParameters["verbosetime"] = request.verbosetime.intValue
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return .requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func convertTimeBuilder(accessKey: String, secretKey: String, request: ConvertTimeRequest) -> HTTPTask {
            var urlParameters: Parameters = Parameters()
            urlParameters["accesskey"] = accesskey
            urlParameters["fromid"] = request.fromPlaceId
            urlParameters["toid"] = request.toPlaceId
            if request.isoTimeStamp != nil {
                urlParameters["iso"] = request.isoTimeStamp?.iso8601withFractionalSeconds
            } else {
                urlParameters["year"] = request.year
                urlParameters["month"] = request.month
                urlParameters["day"] = request.day
                urlParameters["hour"] = request.hour
                urlParameters["min"] = request.minute
                urlParameters["sec"] = request.second
            }

            if request.radius != 0 {
                urlParameters["radius"] = request.radius
            }
            urlParameters["timechanges"] = request.timeChanges.intValue
            urlParameters["tz"] = request.timeZoneInfo.intValue
            urlParameters["verbosetime"] = request.verbosetime.intValue
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func DSTListRequestBuilder(accessKey: String, secretKey: String, request: DSTListRequest) -> HTTPTask {

            var urlParameters: Parameters = Parameters()
            if request.year != nil {
                urlParameters["year"] = request.year
            }

            if request.country != nil {
                urlParameters["country"] = request.country
            }
            urlParameters["listplaces"] = request.listPlaces
            urlParameters["onlydst"] = request.onlyDST
            urlParameters["timechanges"] = request.timeChanges.intValue
            urlParameters["verbosetime"] = request.verbosetime.intValue
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func HolidayRequestBuilder(accessKey: String, secretKey: String, request: HolidaysRequest) -> HTTPTask {
            var urlParameters: Parameters = Parameters()
            urlParameters["country"] = request.country
            urlParameters["year"] = request.year
            urlParameters["tz"] = request.tz.intValue
            urlParameters["verbosetime"] = request.verbosetime ? 1 : 0

            var types: String = ""

            if request.includeTypes!.count > 0 {
                for type in request.includeTypes! {
                    types.append(type.description)
                    types.append(", ")
                }
            }

            if request.excludeTypes!.count > 0 {
                for type in request.includeTypes! {
                    types.append("~")
                    types.append(type.description)
                    types.append(", ")
                }
            }
            
            
            urlParameters["types"] = types
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func PlacesRequest(accessKey: String, secretKey: String, request: PlacesRequest) -> HTTPTask {
            var urlParameters: Parameters = Parameters()
            urlParameters["geo"] = request.geo
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return .requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }

        func TimeRequest(accessKey: String, secretKey: String, request: TimeRequest) -> HTTPTask {

            var urlParameters: Parameters = Parameters()
            urlParameters["placeid"] = request.placeId
            urlParameters["qlimit"] = request.qLimit
            urlParameters["geo"] = request.geo.intValue
            urlParameters["radius"] = request.radius
            urlParameters["sun"] = request.sun.intValue
            urlParameters["time"] = request.time.intValue
            urlParameters["timechanges"] = request.timechanges.intValue
            urlParameters["tz"] = request.tz.intValue
            urlParameters["verbosetime"] = request.verbosetime.intValue
            urlParameters["lang"] = request.lang
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        }
        
        func accountDataBuilder(accessKey: String, secretKey: String, request: AccountRequest) -> HTTPTask {
        
            var urlParameters: Parameters = Parameters()
            urlParameters["accesskey"] = accessKey
            urlParameters["version"] = Constants.DefaultVersion

            return HTTPTask.requestParameters(accessKey: accesskey, secretKey: secretkey, urlParameters: urlParameters, encoding: .urlEncoding)
        
        }

        switch request {
        case is AstronomyRequest:
            _path = "astronomy"
            _task = astronomyBuilder(accessKey: accesskey, secretKey: secretkey, request: request as! AstronomyRequest)
        case is AstrodataRequest:
            _path = "astrodata"
            _task = astrodataBuilder(accessKey: accesskey, secretKey: secretkey, request: request as! AstrodataRequest)
        case is BusinessDateRequest:
            _path = "businessdate"
            self._task = businessdateBuilder(accessKey: accesskey, secretKey: secretkey, request: request as! BusinessDateRequest)
        case is BusinessDurationRequest:
            _path = "businessDuration"
            _task = businessDurationBuilder(accessKey: accesskey, secretKey: accesskey, request: request as! BusinessDurationRequest)
        case is ConvertTimeRequest:
            _path = "converttime"
            _task = convertTimeBuilder(accessKey: accesskey, secretKey: secretkey, request: request as! ConvertTimeRequest)
        case is DSTListRequest:
            _path = "dstlist"
            _task = DSTListRequestBuilder(accessKey: accesskey, secretKey: secretkey, request: request as! DSTListRequest)
        case is HolidaysRequest:
            _path = "holidays"
            _task = HolidayRequestBuilder(accessKey: accesskey, secretKey: secretkey, request: request as! HolidaysRequest)
        case is PlacesRequest:
            _path = "places"
            _task = PlacesRequest(accessKey: accesskey, secretKey: secretkey, request: request as! PlacesRequest)
        case is TimeRequest:
            _path = "timeservice"
            _task = TimeRequest(accessKey: accesskey, secretKey: secretkey, request: request as! TimeRequest)
        case is AccountRequest:
            _path = "account"
            _task = accountDataBuilder(accessKey: accesskey, secretKey: secretkey, request: request as! AccountRequest)
        default:
            abort()
        }
    }
}
