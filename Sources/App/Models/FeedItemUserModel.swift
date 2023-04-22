import Vapor

struct FeedItemUserModel: Content {
    var author: String
    var content: String
    var numberOfLikes: Int

    func makeModel() -> FeedItemModel {
        .init(
            id: UUID().uuidString,
            author: self.author,
            content: self.content,
            numberOfLikes: self.numberOfLikes
        )
    }

    func makeModel(id: String) -> FeedItemModel {
        .init(
            id: id,
            author: self.author,
            content: self.content,
            numberOfLikes: self.numberOfLikes
        )
    }
}
