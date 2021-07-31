//
//  ManagedFeedImage.swift
//  FeedStoreChallenge
//
//  Created by Ankit on 30/07/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedFeedImage)
final class ManagedFeedImage: NSManagedObject {
	@NSManaged var id: UUID
	@NSManaged var feed_description: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: ManagedCache

	var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: feed_description, location: location, url: url)
	}

	static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map { item in
			let managed = ManagedFeedImage(context: context)
			managed.id = item.id
			managed.feed_description = item.description
			managed.location = item.location
			managed.url = item.url

			return managed
		})
	}
}
