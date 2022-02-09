//
//  FoursquareAPI.swift
//  Evenly Challenge
//
//  Created by Rasul Mammadov on 09.02.22.
//

import Foundation
import CoreLocation

public final class FoursquareAPI {
    public static let shared = FoursquareAPI()

    public func fetchVenueCategories() {
        let urlString =
            "https://api.foursquare.com/v2/venues/categories" +
        "?client_id=\(Constants.EVENLY_FOURSQUARE_CLIENT_ID.rawValue)&client_secret=\(Constants.EVENLY_FOURSQUARE_CLIENT_SECRET.rawValue)&v=20180323"
        
        guard let url = URL(string: urlString) else { return }
        
    }
    }

     public func fetchVenues(using query: String, with spanRadius: Double,
                            at location: CLLocationCoordinate2D
                            ) {
        let section = query.lowercased().replacingOccurrences(of: " ", with: "")
        let urlString =
        "https://api.foursquare.com/v2/venues/explore" +
    "?client_id=\(Constants.EVENLY_FOURSQUARE_CLIENT_ID.rawValue)&client_secret=\(Constants.EVENLY_FOURSQUARE_CLIENT_SECRET.rawValue)&v=20180323" +
        "&limit=\(20)&ll=\(location.latitude),\(location.longitude)&radius=\(spanRadius)&section=\(section)"
        guard let url = URL(string: urlString) else {
            return
        }
        }
    
    public func fetchVenuePhotos(using venueId: String, completion: @escaping () -> () ) {
        let urlString =
            "https://api.foursquare.com/v2/venues/\(venueId.lowercased())/photos" +
            "?client_id=\(Constants.EVENLY_FOURSQUARE_CLIENT_ID.rawValue)&client_secret=\(Constants.EVENLY_FOURSQUARE_CLIENT_SECRET.rawValue)&v=20180323" +
            "&limit=\(10)"
        guard let url = URL(string: urlString) else { return }
        }

    public func openWeb(of venueId: String) {
        if let encodedAddress =
            ("https://www.foursquare.com/v/"+venueId).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: encodedAddress) {
            
        }
    }
    
