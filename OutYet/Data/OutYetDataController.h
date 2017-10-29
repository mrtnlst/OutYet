//
//  OutYetDataController.h
//  OutYet
//
//  Created by martin on 26.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song+CoreDataProperties.h"
#import <CoreData/CoreData.h>
#import "OutYetDataStack.h"

@interface OutYetDataController : NSObject

+ (void)loadHardcodedDatabaseIfNeccessary;
+ (void)insertSongWithTrackName:(NSString *)trackName artistName:(NSString *)artistName context:(NSManagedObjectContext *)context;
+ (NSArray<Song *> *)fetchAllSamplesWithContext:(NSManagedObjectContext *)context;

@end
