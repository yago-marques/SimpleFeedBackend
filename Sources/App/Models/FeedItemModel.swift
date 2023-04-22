import Vapor

struct FeedItemModel: Content {
    var id: String
    var author: String
    var content: String
    var numberOfLikes: Int
}
