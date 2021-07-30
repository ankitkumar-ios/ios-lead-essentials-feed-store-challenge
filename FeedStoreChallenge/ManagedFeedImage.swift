//
//  ManagedFeedImage.swift
//  FeedStoreChallenge
//
//  Created by Ankit on 30/07/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedFeedImage)
internal class ManagedFeedImage: NSManagedObject {
	@NSManaged internal var id: UUID
	@NSManaged internal var feed_description: String?
	@NSManaged internal var location: String?
	@NSManaged internal var url: URL
	@NSManaged internal var cache: ManagedCache

	var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: feed_description, location: location, url: url)
	}

	internal static func image(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
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
