//
//  RequestiTunes.m
//  OutYet
//
//  Created by martin on 03.09.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "RequestiTunes.h"

@implementation RequestiTunes

@synthesize album;
@synthesize track;
@synthesize artist;

- (id)initWithArtistName:(NSString *)a withTrackName:(NSString *)t {
    // Call the NSObject's init method.
    self = [super init];

    // Did it return something non-nil?
    if (self) {
        
        // Set the artist and track name.
        artist = [NSMutableString stringWithString: a];
        track = [NSMutableString stringWithString: t];
        
        // Create query string.
        NSString *queryURL = [self createQueryURL];
        [self getDataFrom:queryURL];
        
    }
    
    // Return a pointer to the new object.
    return self;
}

- (NSString*)createQueryURL {
    
    // Append artist and track names.
    NSMutableString *query = [[NSMutableString alloc] initWithString:self.artist];
    [query appendString:@"+"];
    [query appendString:self.track];
    
    // Repace whitespaces by '+' and return array.
    NSString *queryString = [query stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    // Append query string to iTunes URL.
    NSMutableString *queryURL = [NSMutableString stringWithFormat:@"https://itunes.apple.com/search?term="];
    [queryURL appendString:queryString];
    
    return queryURL;
}

- (void)getDataFrom:(NSString *)queryURL {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:queryURL]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:queryURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                if(error == nil) {
                    [self analyseContentOf:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSArray *message = [[NSArray alloc] initWithObjects:self.artist, self.track, [NSNumber numberWithInteger:self.status], nil];
                        
                        NSDictionary *dict = [NSDictionary dictionaryWithObject:message forKey:@"message"];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationMessageEvent" object:nil userInfo:dict];
                    });
                }
                else {
                    NSLog(@"Error getting %@, HTTP status code %li", queryURL, (long)[error code]);
                }
                
            }] resume];
    
    
}

- (void)analyseContentOf:(NSString *)response {
    // Parse json data.
    NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    
    NSNumber *resultCount = [dict objectForKey:@"resultCount"];
    if (![resultCount isEqualToNumber:@0]) {
        BOOL alreadyOut = NO;
        NSArray *results = [dict objectForKey:@"results"];
        for (NSDictionary *result in results) {
            
            // Check if results match the input.
            if ([[result objectForKey:@"artistName"] localizedStandardContainsString:[self artist]] && [[result objectForKey:@"trackName"] localizedStandardContainsString:[self track]]) {
                alreadyOut = YES;
                track = [result objectForKey:@"trackName"];
                artist = [result objectForKey:@"artistName"];
                album = [result objectForKey:@"collectionName"];
                self.status = 2;
                
                [self printResults];
                break;
            }
            self.status = 2;
        }
        if (!alreadyOut) {
            NSLog(@"No track/artist match found on iTunes.");
            self.status = 1;
        }
    }
    else {
        NSLog(@"No results on iTunes.");
        self.status = 1;
    }
}

- (void)printResults {
    NSLog(@"It's already out on iTunes!");
    NSLog(@"- - - - -");
    NSLog(@"Artist: %@", artist);
    NSLog(@"Track: %@", track);
    NSLog(@"Album: %@", album);
    NSLog(@"- - - - -");
}

@end
