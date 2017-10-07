//
//  HomeViewViewController.m
//  OutYet
//
//  Created by martin on 04.09.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "HomeViewController.h"
#import "Helper.h"

@interface HomeViewController ()
@property (nonatomic, strong) UIView *buttonContainerView;
@property (nonatomic, strong) UIView *contentContainerView;
@property (nonatomic, strong) UILabel *headingLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIButton *checkEntriesButton;
@property (nonatomic, strong) UIButton *addEntryButton;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];
    [self setUpViews];
    [self setUpConstraints];
   
}

- (void)setUpViews {
    
//    self.scrollView = [[UIScrollView alloc] init];
//    self.contentView = [[UIView alloc] init];
    
    // Create container views.
    self.contentContainerView = [[UIView alloc] init];
    self.contentContainerView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentContainerView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.contentContainerView];
    
    self.buttonContainerView = [[UIView alloc] init];
    self.buttonContainerView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.buttonContainerView setBackgroundColor:[UIColor yellowColor]];
    [self.contentContainerView addSubview:self.buttonContainerView];

    self.headingLabel = [UILabel new];
    self.headingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.headingLabel setText:@"OutYet"];
    [self.headingLabel setTextColor:[UIColor whiteColor]];
    [self.headingLabel setFont:[UIFont systemFontOfSize:80]];
    [self.contentContainerView addSubview:self.headingLabel];
//    [self.contentView addSubview:self.headingLabel];
    
    self.descriptionLabel = [UILabel new];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.descriptionLabel setText:@"Check availability of tracks on iTunes."];
    [self.descriptionLabel setTextColor:[UIColor whiteColor]];
    [self.contentContainerView addSubview:self.descriptionLabel];
//    [self.contentView addSubview:self.descriptionLabel];
    
//    self.resultLabel = [UILabel new];
//    self.resultLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.resultLabel setText:@"~Results~"];
//    [self.resultLabel setTextColor:[UIColor whiteColor]];
//    [self.resultLabel setNumberOfLines:4];
//    [self.view addSubview:self.resultLabel];
////    [self.contentView addSubview:self.resultLabel];
    
    self.checkEntriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkEntriesButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkEntriesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkEntriesButton setImage:[UIImage imageNamed:@"CheckButton"] forState:UIControlStateNormal];
    [self.checkEntriesButton addTarget:self action:@selector(checkEntriesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.checkEntriesButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.checkEntriesButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.checkEntriesButton.layer setShadowOpacity:0.2];
    
    [self.buttonContainerView addSubview:self.checkEntriesButton];
    
    self.addEntryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addEntryButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addEntryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.addEntryButton setImage:[UIImage imageNamed:@"PlusButton"] forState:UIControlStateNormal];
    [self.addEntryButton addTarget:self action:@selector(addEntryButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.addEntryButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.addEntryButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.addEntryButton.layer setShadowOpacity:0.2];
    [self.buttonContainerView addSubview:self.addEntryButton];
}

- (void) setUpConstraints {
    
//    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Create a dictionaries for VFL.
    NSDictionary *viewsDictionary = @{@"addEntryButton": self.addEntryButton,
                                      @"buttonContainerView": self.buttonContainerView,
                                      @"contentContainerView": self.contentContainerView,
                                      @"checkEntriesButton": self.checkEntriesButton,
                                      @"headingLabel": self.headingLabel,
                                      @"descriptionLabel": self.descriptionLabel,
//                                      @"resultLabel": self.resultLabel,
                                      /*@"scrollView": self.scrollView,
                                      @"contentView": self.contentView*/};
    
    NSDictionary *metricsDictionary = @{@"gap": @20,
                                        @"topGap": @10,
                                        @"buttonWidth": @52,
                                        @"buttonContainerSpace": @60,
                                        @"buttonContainerWidth": @284,
                                        @"buttonContainerHeight": @68,
                                        @"contentContainerHeight": @250,
                                        @"contentContainerWidth": @300};
    
    // setup scrollview constraints
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:viewsDictionary]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:viewsDictionary]];
//
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:nil views:viewsDictionary]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:nil views:viewsDictionary]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    

    
    // Create container with anchors.
//    UILayoutGuide *container = [UILayoutGuide new];
//    [self.view addLayoutGuide:container];
//    [container.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
//    [self.artistTextField.topAnchor constraintEqualToAnchor:container.topAnchor].active = YES;
//    [self.songTextField.bottomAnchor constraintEqualToAnchor:container.bottomAnchor].active = YES;
    
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
    
    // Constraints for headingLabel.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.headingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[headingLabel]-(>=1)-|"
                                                                                   options:0
                                                                                   metrics:metricsDictionary
                                                                                     views:viewsDictionary]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[headingLabel]-(gap)-[descriptionLabel]-(gap)-[buttonContainerView(buttonContainerHeight)]-|"
                                                                                 options:0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];

    // Constraints for descriptionLabel.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[descriptionLabel]-(>=1)-|"
                                                                                       options:0
                                                                                       metrics:metricsDictionary
                                                                                         views:viewsDictionary]];
    
    // Create constraints for buttonContainerView.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[buttonContainerView(buttonContainerWidth)]-|"
                                                                                           options:0
                                                                                           metrics:metricsDictionary
                                                                                             views:viewsDictionary]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonContainerSpace)-[addEntryButton(checkEntriesButton)]-(buttonContainerSpace)-[checkEntriesButton(buttonWidth)]-(buttonContainerSpace)-|"
                                                                                  options:NSLayoutFormatAlignAllBottom
                                                                                  metrics:metricsDictionary
                                                                                    views:viewsDictionary]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[checkEntriesButton(buttonWidth)]-|"
                                                                                options:0
                                                                                metrics:metricsDictionary
                                                                                  views:viewsDictionary]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[addEntryButton(buttonWidth)]-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];

    // Result.
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.resultLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
//     [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.resultLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
//    NSArray *constraintResultHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[resultLabel]-(>=1)-|"
//                                                                                       options:0
//                                                                                       metrics:nil
//                                                                                         views:viewsDictionary];
//    NSArray *constraintResultVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[checkButton]-[resultLabel]"
//                                                                                     options:0
//                                                                                     metrics:metricsDictionary
//                                                                                       views:viewsDictionary];
//

}

-(void) checkEntriesButtonClicked:(UIButton*)sender {
    NSLog(@"Initiating request.");
//    NSLog(@"Artist: %@, Song: %@", [self.artistTextField text], [self.songTextField text]);
//    [self.resultLabel setText:@"Checking for results.."];
//
//    // Create query string.
//    NSArray *array = [Helper createQueryStringWithArtist:[self.artistTextField text] withSong:[self.songTextField text]];
//
//    // Create iTunes request.
//    RequestiTunes  *itunesRequest = [[RequestiTunes alloc] initWithArtistName:[array objectAtIndex:0]
//
//                                                                withTrackName:[array objectAtIndex:1]];
//    if (itunesRequest.album != nil) {
//        [self.resultLabel setText:[NSString stringWithFormat:@"It's already out yet!\nArtist: %@\nSong: %@\nAlbum: %@", [itunesRequest artist], [itunesRequest track], [itunesRequest album]]];
//    }
//    else {
//        [self.resultLabel setText:@"Not found."];
//    }
}

-(void) addEntryButtonClicked:(UIButton*)sender {
    NSLog(@"New entry.");

    AddEntryViewController *destinationController = [[AddEntryViewController alloc] init];
                                                    
     [self presentViewController:destinationController animated:YES completion:nil];
    
    
}



- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
