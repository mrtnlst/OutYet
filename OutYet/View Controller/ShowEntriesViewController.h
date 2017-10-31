//
//  ShowEntriesViewController.h
//  OutYet
//
//  Created by martin on 31.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShowEntriesViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray     *content;

@end
