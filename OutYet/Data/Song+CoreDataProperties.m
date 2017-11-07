//
//  Song+CoreDataProperties.m
//  OutYet
//
//  Created by martin on 15.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//
//

#import "Song+CoreDataProperties.h"

@implementation Song (CoreDataProperties)

+ (NSFetchRequest<Song *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Song"];
}

@dynamic artistName;
@dynamic trackName;
@dynamic albumName;
@dynamic year;
@dynamic status;

@end
