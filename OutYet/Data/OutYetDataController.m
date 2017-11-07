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
    
    NSMutableArray<Song *> *allSamples = [self fetchAllSamplesWithContext:context];
    if (allSamples && allSamples.count > 0) {
        return;
    }
    
//    [context performBlockAndWait:^{
//        
//        [sharedDataStack saveContext];
//    }];
}

+ (void)insertSongWithTrackName:(NSString *)trackName artistName:(NSString *)artistName context:(NSManagedObjectContext *)context WithStatus:(NSInteger)status{
    
    Song *song = [[Song alloc] initWithContext:context];
    song.artistName = artistName;
    song.trackName = trackName;
    song.status = status;
    
    [context performBlockAndWait:^{
         OutYetDataStack *sharedDataStack = [OutYetDataStack sharedInstance];
        [sharedDataStack saveContext];
    }];
}

+ (void)deleteWithContext:(NSManagedObjectContext *)context WithArtistName:(NSString *)artistName WithTrackName:(NSString *)trackName {
    
    NSFetchRequest *request = [Song fetchRequest];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Song" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"artistName like %@ AND trackName like %@", artistName, trackName];
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray<Song *> *song = [context executeFetchRequest:request error:&error];
    
    [context deleteObject:song[0]];
//    for (NSManagedObject *managedObject in song) {
//        ;
//    }
    error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
    }
}

+ (NSMutableArray<Song *> *)fetchAllSamplesWithContext:(NSManagedObjectContext *)context {
    
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
    NSMutableArray *resultArray = [result mutableCopy];
    return resultArray;
}

@end
