import Foundation
import RealmSwift
class InfoTeamRealm: Object{
    @Persisted(primaryKey: true) var gameId : Int
    @Persisted var teamName: String
    @Persisted var LogoLink: String
    
}
