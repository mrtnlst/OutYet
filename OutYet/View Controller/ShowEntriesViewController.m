//
//  ShowEntriesViewController.m
//  OutYet
//
//  Created by martin on 31.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "ShowEntriesViewController.h"

@interface ShowEntriesViewController ()

@property (nonatomic, strong) UIView *navigationBar;
@property (nonatomic, strong) UIView *checkEntriesButtonContainerView;
@property (nonatomic, strong) UIView *cancelButtonContainerView;
@property (nonatomic, strong) UIView *buttonContainerView;

@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *checkEntriesButton;

@property (nonatomic, strong) UILabel *headingLabel;
@property (nonatomic, strong) UILabel *checkEntriesButtonLabel;
@property (nonatomic, strong) UILabel *cancelButtonLabel;

@property (nonatomic, strong) NSMutableArray<Song *> *songArray;
@property (nonatomic, strong) UIColor *red;


@end

@implementation ShowEntriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    [self setUpConstraints];
    [self loadData];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(triggerAction:) name:@"NotificationMessageEvent" object:nil];

    
//    [self turnOnColors];
}

#pragma mark - Views and Constraints

- (void)setUpViews {
    // View.
    self.red = [UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0];
    [self.view setBackgroundColor:self.red];

    // tableView.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundColor:self.red];
    [self.view addSubview:self.tableView];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:211.0/255.0 green:84.0/255.0 blue:78.0/255.0 alpha:1.0]];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];

    
    // Container views.
    self.navigationBar = [[UIView alloc] init];
    self.navigationBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.navigationBar];
    
    self.buttonContainerView = [[UIView alloc] init];
    self.buttonContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.navigationBar addSubview:self.buttonContainerView];
    
    self.checkEntriesButtonContainerView = [[UIView alloc] init];
    self.checkEntriesButtonContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonContainerView addSubview:self.checkEntriesButtonContainerView];
    
    self.cancelButtonContainerView = [[UIView alloc] init];
    self.cancelButtonContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonContainerView addSubview:self.cancelButtonContainerView];
    
    // Buttons.
    self.checkEntriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkEntriesButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkEntriesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkEntriesButton setImage:[UIImage imageNamed:@"CheckButton"] forState:UIControlStateNormal];
    [self.checkEntriesButton addTarget:self action:@selector(checkEntriesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.checkEntriesButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.checkEntriesButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.checkEntriesButton.layer setShadowOpacity:0.2];
    [self.checkEntriesButtonContainerView addSubview:self.checkEntriesButton];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cancelButton setImage:[UIImage imageNamed:@"BackButton"] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.cancelButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.cancelButton.layer setShadowOpacity:0.2];
    [self.cancelButtonContainerView addSubview:self.cancelButton];
    
    // Labels.
    self.headingLabel = [UILabel new];
    self.headingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.headingLabel setText:@"Check Entries"];
    [self.headingLabel setTextColor:[UIColor whiteColor]];
    [self.headingLabel setFont:[UIFont systemFontOfSize:40]];
    [self.navigationBar addSubview:self.headingLabel];
    
    self.checkEntriesButtonLabel = [UILabel new];
    self.checkEntriesButtonLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkEntriesButtonLabel setText:@"Check"];
    [self.checkEntriesButtonLabel setTextColor:[UIColor whiteColor]];
    [self.checkEntriesButtonLabel setFont:[UIFont systemFontOfSize:12]];
    [self.checkEntriesButtonContainerView addSubview:self.checkEntriesButtonLabel];
    
    self.cancelButtonLabel = [UILabel new];
    self.cancelButtonLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cancelButtonLabel setText:@"Back"];
    [self.cancelButtonLabel setTextColor:[UIColor whiteColor]];
    [self.cancelButtonLabel setFont:[UIFont systemFontOfSize:12]];
    [self.cancelButtonContainerView addSubview:self.cancelButtonLabel];
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = @{@"navigationBar": self.navigationBar,
                                      @"cancelButton": self.cancelButton,
                                      @"checkEntriesButton": self.checkEntriesButton,
                                      @"cancelButtonLabel": self.cancelButtonLabel,
                                      @"cancelButtonContainerView": self.cancelButtonContainerView,
                                      @"checkEntriesButtonLabel": self.checkEntriesButtonLabel,
                                      @"checkEntriesButtonContainerView": self.checkEntriesButtonContainerView,
                                      @"headingLabel": self.headingLabel,
                                      @"table": self.tableView,
                                      @"buttonContainerView": self.buttonContainerView,
                                      @"navigationBar": self.navigationBar,
                                      };
    
    NSDictionary *metricsDictionary = @{@"gap": @50,
                                        @"topGap": @30,
                                        @"textFieldWidth": @220,
                                        @"buttonWidth": @52,
                                        @"labelContainerWidth": @100,
                                        @"labelContainerHeight": @90,
                                        @"formContainerWidth": @300,
                                        @"formContainerHeight": @88,
                                        @"buttonContainerSpace": @28,
                                        @"buttonContainerWidth": @284,
                                        @"buttonContainerHeight": @106};
    
    
    // View.
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[navigationBar]-[table]-|"
                                                                               options:0
                                                                               metrics:metricsDictionary
                                                                                 views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|"
                                                                      options:0
                                                                      metrics:metricsDictionary
                                                                        views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[navigationBar]|"
                                                                      options:0
                                                                      metrics:metricsDictionary
                                                                        views:viewsDictionary]];
    
    
    // navigationBar.
    [self.navigationBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[headingLabel]-[buttonContainerView(buttonContainerHeight)]-|"
                                                                            options:0
                                                                            metrics:metricsDictionary
                                                                              views:viewsDictionary]];
    
    // headingLabel.
    [self.navigationBar addConstraint:[NSLayoutConstraint constraintWithItem:self.headingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.navigationBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.navigationBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[headingLabel]-(>=1)-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary]];
    
    // buttonContainerView.
    [self.navigationBar addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.navigationBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.navigationBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[buttonContainerView(buttonContainerWidth)]-(>=1)-|"
                                                                            options:0
                                                                            metrics:metricsDictionary
                                                                              views:viewsDictionary]];
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonContainerSpace)-[cancelButtonContainerView(labelContainerWidth)]-(buttonContainerSpace)-[checkEntriesButtonContainerView(labelContainerWidth)]-(buttonContainerSpace)-|"
                                                                                     options:NSLayoutFormatAlignAllBottom
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[checkEntriesButtonContainerView(labelContainerHeight)]-|"
                                                                                     options:0
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[cancelButtonContainerView(labelContainerHeight)]-|"
                                                                                     options:0
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
    // checkEntriesButtonContainerView.
    [self.checkEntriesButtonContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.checkEntriesButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.checkEntriesButtonContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.checkEntriesButtonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[checkEntriesButton(buttonWidth)]-(>=1)-|"
                                                                                   options:NSLayoutFormatAlignAllBottom
                                                                                   metrics:metricsDictionary
                                                                                     views:viewsDictionary]];
    
    [self.checkEntriesButtonContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.checkEntriesButtonLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.checkEntriesButtonContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.checkEntriesButtonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[checkEntriesButtonLabel]-(>=1)-|"
                                                                                   options:NSLayoutFormatAlignAllBottom
                                                                                   metrics:metricsDictionary
                                                                                     views:viewsDictionary]];
    
    [self.checkEntriesButtonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[checkEntriesButton(buttonWidth)][checkEntriesButtonLabel]-|"
                                                                                   options:0
                                                                                   metrics:metricsDictionary
                                                                                     views:viewsDictionary]];
    
    // cancelButtonContainerView.
    [self.cancelButtonContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cancelButtonContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.cancelButtonContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButtonLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cancelButtonContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.cancelButtonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[cancelButton(buttonWidth)]-(>=1)-|"
                                                                                     options:NSLayoutFormatAlignAllBottom
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    [self.cancelButtonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[cancelButtonLabel]-(>=1)-|"
                                                                                     options:NSLayoutFormatAlignAllBottom
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
    [self.cancelButtonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[cancelButton(buttonWidth)][cancelButtonLabel]-|"
                                                                                     options:0
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
}

#pragma mark - UITableView DataSource Methods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";

    OutYetTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[OutYetTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    if (self.songArray.count != 0) {
        Song *song = [self.songArray objectAtIndex:indexPath.row];
        cell.trackName.text = song.trackName;
        cell.artistName.text = song.artistName;
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songArray.count;
}

- (void)loadData {
    NSManagedObjectContext *context = [OutYetDataStack sharedInstance].persistentContainer.viewContext;
    self.songArray = [OutYetDataController fetchAllSamplesWithContext:context];
}

#pragma mark - UITableView Delegate Methods

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Disable able showing delete button.
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Allow to swipe.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Remove object from core data.
        NSManagedObjectContext *context = [OutYetDataStack sharedInstance].persistentContainer.viewContext;
        [OutYetDataController deleteWithContext:context WithArtistName:[self.songArray objectAtIndex:indexPath.row].artistName WithTrackName:[self.songArray objectAtIndex:indexPath.row].trackName];
        
        // Remove object from tableView.
        [self.songArray  removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView reloadData];
    }
}

#pragma mark - UIButton Actions

-(void) cancelButtonClicked:(UIButton*)sender {
    NSLog(@"Going back.");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) checkEntriesButtonClicked:(UIButton*)sender {
    NSLog(@"Initiating request.");
    
    for (OutYetTableViewCell *cell in self.tableView.visibleCells) {
        __unused RequestiTunes *iTunesRequest = [[RequestiTunes alloc] initWithArtistName:cell.artistName.text withTrackName:cell.trackName.text];
    }
}

#pragma mark - NSNotification Action

-(void) triggerAction:(NSNotification *) notification {
    NSDictionary *dict = notification.userInfo;
    NSArray *message = [dict valueForKey:@"message"];
    if (message != nil) {
        for (OutYetTableViewCell *cell in self.tableView.visibleCells) {
            if ([cell.artistName.text isEqualToString:message[0]]) {
                if ([[message objectAtIndex:2] boolValue]) {
                    cell.statusImage.image = [UIImage imageNamed:@"SuccessSymbol"];
                }
                else {
                    cell.statusImage.image = [UIImage imageNamed:@"FailedSymbol"];
                }
            }
        }
    }
}

#pragma mark - Helper

- (void)turnOnColors {
    [self.navigationBar setBackgroundColor:[UIColor blueColor]];
    [self.checkEntriesButtonContainerView setBackgroundColor:[UIColor orangeColor]];
    [self.buttonContainerView setBackgroundColor:[UIColor yellowColor]];
    [self.cancelButtonContainerView setBackgroundColor:[UIColor orangeColor]];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end

