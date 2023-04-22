import Vapor

var controller = FeedController()

func routes(_ app: Application) throws {
    app.group("feed") { feed in
        feed.get { req -> [FeedItemModel] in
            try controller.readFeedItens()
        }

        feed.post { req in
            let useItem = try req.content.decode(FeedItemUserModel.self)
            try controller.createFeedItem(useItem.makeModel())

            return HTTPStatus.created
        }

        feed.put { req in
            if let id: String = req.query["id"] {
                let userItem = try req.content.decode(FeedItemUserModel.self)
                try controller.updateFeedItem(id: id, newItem: userItem.makeModel(id: id))
            } else {
                throw Abort(.badRequest, reason: "invalid query")
            }

            return HTTPStatus.ok
        }

        feed.delete { req in
            if let id: String = req.query["id"] {
                try controller.deleteFeedItem(id: id)
            } else {
                throw Abort(.badRequest, reason: "invalid query")
            }

            return HTTPStatus.ok
        }
    }
}
