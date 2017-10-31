//
//  HomeViewViewController.m
//  OutYet
//
//  Created by martin on 04.09.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong) UIView *buttonContainerView;
@property (nonatomic, strong) UIView *contentContainerView;
@property (nonatomic, strong) UIView *addEntryContainerView;
@property (nonatomic, strong) UIView *checkEntriesContainerView;

@property (nonatomic, strong) UILabel *headingLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *addEntryButtonLabel;
@property (nonatomic, strong) UILabel *checkEntriesButtonLabel;

@property (nonatomic, strong) UIButton *checkEntriesButton;
@property (nonatomic, strong) UIButton *addEntryButton;

@property (nonatomic, strong) NSArray<Song *> *songArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];
    [self setUpViews];
    [self setUpConstraints];
    
}

- (void)setUpViews {
    
    // Create container views.
    self.contentContainerView = [[UIView alloc] init];
    self.contentContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.contentContainerView];
    
    self.buttonContainerView = [[UIView alloc] init];
    self.buttonContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentContainerView addSubview:self.buttonContainerView];
    
    self.addEntryContainerView = [[UIView alloc] init];
    self.addEntryContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonContainerView addSubview:self.addEntryContainerView];
    
    self.checkEntriesContainerView = [[UIView alloc] init];
    self.checkEntriesContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonContainerView addSubview:self.checkEntriesContainerView];
    
    self.headingLabel = [UILabel new];
    self.headingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.headingLabel setText:@"OutYet"];
    [self.headingLabel setTextColor:[UIColor whiteColor]];
    [self.headingLabel setFont:[UIFont systemFontOfSize:80]];
    [self.contentContainerView addSubview:self.headingLabel];
    
    self.descriptionLabel = [UILabel new];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.descriptionLabel setText:@"Check availability of tracks on iTunes."];
    [self.descriptionLabel setTextColor:[UIColor whiteColor]];
    [self.contentContainerView addSubview:self.descriptionLabel];
    
    self.addEntryButtonLabel = [UILabel new];
    self.addEntryButtonLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addEntryButtonLabel setText:@"New Entry"];
    [self.addEntryButtonLabel setTextColor:[UIColor whiteColor]];
    [self.addEntryButtonLabel setFont:[UIFont systemFontOfSize:12]];
    [self.addEntryContainerView addSubview:self.addEntryButtonLabel];
    
    self.checkEntriesButtonLabel = [UILabel new];
    self.checkEntriesButtonLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkEntriesButtonLabel setText:@"Check Entries"];
    [self.checkEntriesButtonLabel setTextColor:[UIColor whiteColor]];
    [self.checkEntriesButtonLabel setFont:[UIFont systemFontOfSize:12]];
    [self.checkEntriesContainerView addSubview:self.checkEntriesButtonLabel];
    
    self.checkEntriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkEntriesButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkEntriesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkEntriesButton setImage:[UIImage imageNamed:@"CheckButton"] forState:UIControlStateNormal];
    [self.checkEntriesButton addTarget:self action:@selector(checkEntriesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.checkEntriesButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.checkEntriesButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.checkEntriesButton.layer setShadowOpacity:0.2];
    [self.checkEntriesContainerView addSubview:self.checkEntriesButton];
    
    self.addEntryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addEntryButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addEntryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.addEntryButton setImage:[UIImage imageNamed:@"PlusButton"] forState:UIControlStateNormal];
    [self.addEntryButton addTarget:self action:@selector(addEntryButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.addEntryButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.addEntryButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.addEntryButton.layer setShadowOpacity:0.2];
    [self.addEntryContainerView addSubview:self.addEntryButton];
}

- (void) setUpConstraints {

    // Create a dictionaries for VFL.
    NSDictionary *viewsDictionary = @{@"addEntryButton": self.addEntryButton,
                                      @"buttonContainerView": self.buttonContainerView,
                                      @"contentContainerView": self.contentContainerView,
                                      @"checkEntriesButton": self.checkEntriesButton,
                                      @"headingLabel": self.headingLabel,
                                      @"descriptionLabel": self.descriptionLabel,
                                      @"addEntryLabelContainer": self.addEntryContainerView,
                                      @"checkEntriesLabelContainer": self.checkEntriesContainerView,
                                      @"addEntryButtonLabel": self.addEntryButtonLabel,
                                      @"checkEntriesButtonLabel": self.checkEntriesButtonLabel,};
    
    NSDictionary *metricsDictionary = @{@"gap": @0,
                                        @"topGap": @10,
                                        @"buttonWidth": @52,
                                        @"labelContainerWidth": @100,
                                        @"labelContainerHeight": @90,
                                        @"buttonContainerSpace": @28,
                                        @"buttonContainerWidth": @284,
                                        @"buttonContainerHeight": @106,
                                        @"contentContainerHeight": @250,
                                        @"contentContainerWidth": @300};
    
    // Create constraints for contentContainer.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[contentContainerView(contentContainerWidth)]-(>=1)-|"
                                                                      options:0
                                                                      metrics:metricsDictionary
                                                                        views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=1)-[contentContainerView(contentContainerHeight)]-(>=1)-|"
                                                                      options:0
                                                                      metrics:metricsDictionary
                                                                        views:viewsDictionary]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[headingLabel]-[descriptionLabel]-(gap)-[buttonContainerView(buttonContainerHeight)]-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    // Constraints for headingLabel.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.headingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[headingLabel]-(>=1)-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    // Constraints for descriptionLabel.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[descriptionLabel]-(>=1)-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    // Constraints for for buttonContainerView.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[buttonContainerView(buttonContainerWidth)]-(>=1)-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonContainerSpace)-[addEntryLabelContainer(labelContainerWidth)]-(buttonContainerSpace)-[checkEntriesLabelContainer(labelContainerWidth)]-(buttonContainerSpace)-|"
                                                                                      options:NSLayoutFormatAlignAllBottom
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[addEntryLabelContainer(labelContainerHeight)]-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[checkEntriesLabelContainer(labelContainerHeight)]-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    // Constraints for addEntryLabelContainerView.
    [self.addEntryContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.addEntryButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.addEntryContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.addEntryContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[addEntryButton(buttonWidth)]-(>=1)-|"
                                                                                     options:NSLayoutFormatAlignAllBottom
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
    [self.addEntryContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.addEntryButtonLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.addEntryContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.addEntryContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[addEntryButtonLabel]-(>=1)-|"
                                                                                            options:NSLayoutFormatAlignAllBottom
                                                                                            metrics:metricsDictionary
                                                                                              views:viewsDictionary]];
    
    [self.addEntryContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[addEntryButton(buttonWidth)][addEntryButtonLabel]-|"
                                                                                     options:0
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
    // Constraints for checkEntriesLabelContainerView.
    [self.checkEntriesContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.checkEntriesButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.checkEntriesContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.checkEntriesContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.checkEntriesButtonLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.checkEntriesContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.checkEntriesContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[checkEntriesButton(buttonWidth)]-(>=1)-|"
                                                                                            options:NSLayoutFormatAlignAllBottom
                                                                                            metrics:metricsDictionary
                                                                                              views:viewsDictionary]];
    [self.checkEntriesContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[checkEntriesButtonLabel]-(>=1)-|"
                                                                                                options:NSLayoutFormatAlignAllBottom
                                                                                                metrics:metricsDictionary
                                                                                                  views:viewsDictionary]];
    
    [self.checkEntriesContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[checkEntriesButton(buttonWidth)][checkEntriesButtonLabel]-|"
                                                                                            options:0
                                                                                            metrics:metricsDictionary
                                                                                              views:viewsDictionary]];
    
}

-(void) checkEntriesButtonClicked:(UIButton*)sender {
//    NSLog(@"Initiating request.");

//    NSManagedObjectContext *context = [OutYetDataStack sharedInstance].persistentContainer.viewContext;
//
//    self.songArray = [OutYetDataController fetchAllSamplesWithContext:context];
//
//    NSLog(@"Fetched songArray length: %lu", self.songArray.count);
//    NSLog(@"------------------------------");
//
//    if (self.songArray.count != 0) {
//        for (Song *song in self.songArray) {
//            __unused RequestiTunes *iTunesRequest = [[RequestiTunes alloc] initWithArtistName:song.artistName withTrackName:song.trackName];
//        }
    
    
//        for (Song *song in self.songArray) {
//            NSLog(@"------------------------------");
//            NSLog(@"Track Name: %@", song.trackName);
//            NSLog(@"Artist Name: %@", song.trackName);
//            NSLog(@"------------------------------");
//        }
//    }
    ShowEntriesViewController *destinationController = [[ShowEntriesViewController alloc] init];
    [self presentViewController:destinationController animated:YES completion:nil];
}

-(void) addEntryButtonClicked:(UIButton*)sender {
    NSLog(@"New entry.");
    
    AddEntryViewController *destinationController = [[AddEntryViewController alloc] init];
    
    [self presentViewController:destinationController animated:YES completion:nil];
}

-(void)turnOnColors {
    [self.checkEntriesContainerView setBackgroundColor:[UIColor orangeColor]];
    [self.addEntryContainerView setBackgroundColor:[UIColor orangeColor]];
    [self.buttonContainerView setBackgroundColor:[UIColor yellowColor]];
    [self.contentContainerView setBackgroundColor:[UIColor blueColor]];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

