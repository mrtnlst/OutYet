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
@property (nonatomic, strong) UIView *showListContainerView;

@property (nonatomic, strong) UILabel *headingLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *addEntryButtonLabel;
@property (nonatomic, strong) UILabel *showListButtonLabel;

@property (nonatomic, strong) UIButton *showListButton;
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

#pragma mark - Views and Constraints

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
    
    self.showListContainerView = [[UIView alloc] init];
    self.showListContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonContainerView addSubview:self.showListContainerView];
    
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
    
    self.showListButtonLabel = [UILabel new];
    self.showListButtonLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.showListButtonLabel setText:@"Show Entries"];
    [self.showListButtonLabel setTextColor:[UIColor whiteColor]];
    [self.showListButtonLabel setFont:[UIFont systemFontOfSize:12]];
    [self.showListContainerView addSubview:self.showListButtonLabel];
    
    self.showListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.showListButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.showListButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.showListButton setImage:[UIImage imageNamed:@"ListButton"] forState:UIControlStateNormal];
    [self.showListButton addTarget:self action:@selector(showListButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.showListButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.showListButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.showListButton.layer setShadowOpacity:0.2];
    [self.showListContainerView addSubview:self.showListButton];
    
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
                                      @"showListButton": self.showListButton,
                                      @"headingLabel": self.headingLabel,
                                      @"descriptionLabel": self.descriptionLabel,
                                      @"addEntryLabelContainer": self.addEntryContainerView,
                                      @"showListLabelContainer": self.showListContainerView,
                                      @"addEntryButtonLabel": self.addEntryButtonLabel,
                                      @"showListButtonLabel": self.showListButtonLabel,};
    
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
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonContainerSpace)-[addEntryLabelContainer(labelContainerWidth)]-(buttonContainerSpace)-[showListLabelContainer(labelContainerWidth)]-(buttonContainerSpace)-|"
                                                                                      options:NSLayoutFormatAlignAllBottom
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[addEntryLabelContainer(labelContainerHeight)]-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[showListLabelContainer(labelContainerHeight)]-|"
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
    
    // Constraints for showListLabelContainerView.
    [self.showListContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.showListButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.showListContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.showListContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.showListButtonLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.showListContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.showListContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[showListButton(buttonWidth)]-(>=1)-|"
                                                                                            options:NSLayoutFormatAlignAllBottom
                                                                                            metrics:metricsDictionary
                                                                                              views:viewsDictionary]];
    [self.showListContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[showListButtonLabel]-(>=1)-|"
                                                                                                options:NSLayoutFormatAlignAllBottom
                                                                                                metrics:metricsDictionary
                                                                                                  views:viewsDictionary]];
    
    [self.showListContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[showListButton(buttonWidth)][showListButtonLabel]-|"
                                                                                            options:0
                                                                                            metrics:metricsDictionary
                                                                                              views:viewsDictionary]];
    
}

#pragma mark - UIButton Actions

-(void) showListButtonClicked:(UIButton*)sender {
    ShowEntriesViewController *destinationController = [[ShowEntriesViewController alloc] init];
    [self presentViewController:destinationController animated:YES completion:nil];
}

-(void) addEntryButtonClicked:(UIButton*)sender {
    NSLog(@"New entry.");
    
    AddEntryViewController *destinationController = [[AddEntryViewController alloc] init];
    
    [self presentViewController:destinationController animated:YES completion:nil];
}

#pragma mark - Helper

-(void)turnOnColors {
    [self.showListContainerView setBackgroundColor:[UIColor orangeColor]];
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

