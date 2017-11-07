//
//  Song+CoreDataProperties.h
//  OutYet
//
//  Created by martin on 15.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//
//

#import "Song+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Song (CoreDataProperties)

+ (NSFetchRequest<Song *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *artistName;
@property (nullable, nonatomic, copy) NSString *trackName;
@property (nullable, nonatomic, copy) NSString *albumName;
@property (nonatomic) int16_t year;
@property (nonatomic) int16_t status;

@end

NS_ASSUME_NONNULL_END
