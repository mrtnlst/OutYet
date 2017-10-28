//
//  OutYetDataStack.h
//  OutYet
//
//  Created by martin on 28.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface OutYetDataStack : NSObject

@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

+ (instancetype)sharedInstance;
- (void)saveContext;

@end
