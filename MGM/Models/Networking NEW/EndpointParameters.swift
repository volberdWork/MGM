//
//  EndpointParameters.swift
//  MGM
//

import Foundation

enum EndpointParameters: Endpoint {
    
    case listLeages
    case getFixturesByLeague(id: String,from: String, to: String)
    case getFixture(id: String)
    case getTeam(id: String)
    case getTeamSquad(id: String)
    case getPlayer(id: String)
    case getTeamStatistics(leageID: String, teamID: String)
    case getFixtureStat(fixtureID: String)
    case getFixtureEvents(fixtureID: String)
    case getFixturePlayers(fixtureID: String)
    case getFixtureH2H(h2h: String)
    
    
    var path: String {
        switch self {
        case .listLeages:
            return "/leagues"
        case .getFixturesByLeague, .getFixture:
            return "/fixtures"
        case .getTeam:
            return "/teams"
        case .getTeamSquad:
            return "/players/squads"
        case .getPlayer:
            return "/players"
        case .getTeamStatistics:
            return "/teams/statistics"
        case .getFixtureStat:
            return "/fixtures/statistics"
        case .getFixtureEvents:
            return  "/fixtures/events"
        case .getFixturePlayers:
            return "/fixtures/players"
        case .getFixtureH2H:
            return "/fixtures/headtohead"
        }
    }
    
    var query: [URLQueryItem] {
        var queryItem: [URLQueryItem] = []
        switch self {
        case .listLeages:
            queryItem.append(URLQueryItem(name: "last", value: "30"))
            queryItem.append(URLQueryItem(name: "current", value: "true"))
            return queryItem
        case .getFixturesByLeague(id: let id, from: let from, to: let to):
            queryItem.append(URLQueryItem(name: "league", value: id))
            queryItem.append(URLQueryItem(name: "from", value: from))
            queryItem.append(URLQueryItem(name: "to", value: to))
            //  let year = (Int(Date.getYear) ?? 0) - 1
            queryItem.append(URLQueryItem(name: "season", value: Date.getYear))
            return queryItem
        case .getFixture(id: let id) ,.getTeam(id: let id):
            queryItem.append(URLQueryItem(name: "id", value: id))
            return queryItem
        case .getPlayer(id: let id):
            let year = (Int(Date.getYear) ?? 0) - 1
            queryItem.append(URLQueryItem(name: "id", value: id))
            queryItem.append(URLQueryItem(name: "season", value: String(year)))
            return queryItem
        case .getTeamSquad(id: let id):
            queryItem.append(URLQueryItem(name: "team", value: id))
            return queryItem
        case .getTeamStatistics(leageID: let leageID, teamID: let teamID):
            queryItem.append(URLQueryItem(name: "league", value: leageID))
            queryItem.append(URLQueryItem(name: "team", value: teamID))
            let year = (Int(Date.getYear) ?? 0) - 1
            queryItem.append(URLQueryItem(name: "season", value: String(year)))
            return queryItem
        case .getFixtureStat(fixtureID: let fixtureID):
            queryItem.append(URLQueryItem(name: "fixture", value: fixtureID))
            return queryItem
        case .getFixtureEvents(fixtureID: let fixtureID):
            queryItem.append(URLQueryItem(name: "fixture", value: fixtureID))
            return queryItem
        case .getFixturePlayers(fixtureID: let fixtureID):
            queryItem.append(URLQueryItem(name: "fixture", value: fixtureID))
            return queryItem
        case .getFixtureH2H(h2h: let h2h):
            queryItem.append(URLQueryItem(name: "h2h", value: h2h))
            return queryItem
        }
    }
}


extension Date {
    static var getNextWeek: String {
        var dayComponent = DateComponents()
        dayComponent.day = 7
        let calendar = Calendar.current
        let nextDate = calendar.date(byAdding: dayComponent, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: nextDate ?? Date())
    }
    
    static var getYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: Date())
    }
    
    static var getToday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    static func formatDateForCell(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
        return dateFormatter.string(from: Date())
    }
    
    static func formatDateForEventsFavoritesCell(date: Date) -> String {
        let dateFormatter = DateFormatter()
       dateFormatter.timeZone = TimeZone.current
       dateFormatter.dateFormat = "dd/MM/yyyy"
       return dateFormatter.string(from: date)
    }
    
    static func formatTimeForEventsFavoritesCell(date: Date) -> String {
        let dateFormatter = DateFormatter()
       dateFormatter.timeZone = TimeZone.current
       dateFormatter.dateFormat = "HH:mm"
        if Calendar.current.isDateInToday(date) {
            return  "today " + dateFormatter.string(from: date)
        } else if Calendar.current.isDateInTomorrow(date) {
            return  "tomorrow " + dateFormatter.string(from: date)
        } else {
            return dateFormatter.string(from: date)
        }
    }
    
   static func formatFromServer(date: Date) -> String {
        let dateFormatter = DateFormatter()
       dateFormatter.timeZone = TimeZone.current
       dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
       return dateFormatter.string(from: date)
    }
    
    static func formatDateForDetailView(date: Date) -> String {
        let dateFormatter = DateFormatter()
       dateFormatter.timeZone = TimeZone.current
       dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
       return dateFormatter.string(from: date)
    }
    
    static func formatPalyerBirth(str: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: str) {
            dateFormatter.dateFormat = "MMMM d, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
}

