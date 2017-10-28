//
//  OutYetDataStack.m
//  OutYet
//
//  Created by martin on 28.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "OutYetDataStack.h"

@interface OutYetDataStack()

@property (strong, nonatomic, readwrite) NSPersistentContainer *persistentContainer;

@end

@implementation OutYetDataStack

+ (instancetype)sharedInstance {
    
    static OutYetDataStack *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[OutYetDataStack alloc] init];
    });
    return sharedInstance;
}

- (NSPersistentContainer *)persistentContainer {
    
    @synchronized (self) {
        if (_persistentContainer) {
            return _persistentContainer;
        }
        
        NSPersistentContainer *persistentContainer = [NSPersistentContainer persistentContainerWithName:@"OutYetData"];
        [persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
            if (error) {
                NSLog(@"Unresolved Error %@", error);
            }
        }];
        _persistentContainer = persistentContainer;
        return persistentContainer;
    }
}

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    if (context.hasChanges) {
        NSError *error = nil;
        [context save:&error];
        if (error) {
            NSLog(@"Unresolved error %@", error);
        }
    }
}


@end

