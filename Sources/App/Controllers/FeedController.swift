import Vapor

struct FeedController {
    var dataBase = [FeedItemModel]()

    mutating func createFeedItem(_ feedItem: FeedItemModel) throws {
        dataBase.append(feedItem)
    }

    func readFeedItens() throws -> [FeedItemModel] {
        self.dataBase
    }

    mutating func updateFeedItem(id: String, newItem: FeedItemModel) throws {
        if let index = dataBase.firstIndex(where: {$0.id == id}) {
            dataBase[index] = newItem
        } else {
            throw Abort(.badRequest, reason: "Item not exists")
        }
    }

    mutating func deleteFeedItem(id: String) throws {
        if let index = dataBase.firstIndex(where: {$0.id == id}) {
            dataBase.remove(at: index)
        } else {
            throw Abort(.badRequest, reason: "Item not exists")
        }
    }
}
