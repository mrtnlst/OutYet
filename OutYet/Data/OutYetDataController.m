//
//  OutYetDataController.m
//  OutYet
//
//  Created by martin on 26.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "OutYetDataController.h"

@implementation OutYetDataController

+ (void)loadHardcodedDatabaseIfNeccessary {
    
    OutYetDataStack *sharedDataStack = [OutYetDataStack sharedInstance];
    NSManagedObjectContext *context = sharedDataStack.persistentContainer.viewContext;
    
    NSArray<Song *> *allSamples = [self fetchAllSamplesWithContext:context];
    if (allSamples && allSamples.count > 0) {
        return;
    }
    
    [context performBlockAndWait:^{
        
        [sharedDataStack saveContext];
    }];
}

+ (void)insertSongWithTrackName:(NSString *)trackName artistName:(NSString *)artistName context:(NSManagedObjectContext *)context {
    
    Song *song = [[Song alloc] initWithContext:context];
    song.artistName = artistName;
    song.trackName = trackName;
}


+ (NSArray<Song *> *)fetchAllSamplesWithContext:(NSManagedObjectContext *)context {
    
    __block NSArray<Song *> *result = nil;
    [context performBlockAndWait:^{
        
        NSFetchRequest *request = [Song fetchRequest];
        NSSortDescriptor *trackNameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"trackName" ascending:YES];
        NSSortDescriptor *artistNameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"artistName" ascending:YES];
        request.sortDescriptors = @[trackNameSortDescriptor];
        request.sortDescriptors = @[artistNameSortDescriptor];
        
        NSError *error = nil;
        
        result = [context executeFetchRequest:request error:&error];
        if (error) {
            NSLog(@"Unresolved Error: %@", error);
        }
    }];
    return result;
}

@end
