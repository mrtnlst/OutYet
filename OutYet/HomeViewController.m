//
//  ViewController.m
//  OutYet
//
//  Created by martin on 04.09.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "HomeViewController.h"
#import "Helper.h"

@interface HomeViewController ()
//@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *buttonContainerView;
@property (nonatomic, strong) UIView *contentContainerView;

//@property (nonatomic, strong) UILabel *artistLabel;
//@property (nonatomic, strong) UILabel *songLabel;
@property (nonatomic, strong) UILabel *headingLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
//@property (nonatomic, strong) UILabel *resultLabel;
//@property (nonatomic, strong) UITextField *artistTextField;
//@property (nonatomic, strong) UITextField *songTextField;
//@property (nonatomic, strong) UIButton *checkButton;
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
    
  
//
//    [self.scrollView addSubview:self.contentView];
//    [self.view addSubview:self.scrollView];
    
//    // Create views.
//    self.artistLabel = [UILabel new];
//    self.artistLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.artistLabel setText:@"Artist:"];
//    [self.artistLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
//    [self.artistLabel setTextColor:[UIColor whiteColor]];
//    [self.view addSubview:self.artistLabel];
////    [self.contentView addSubview:self.artistLabel];

//    self.artistTextField = [UITextField new];
//    self.artistTextField.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.artistTextField setBackgroundColor:[UIColor whiteColor]];
//    [self.artistTextField setBorderStyle:UITextBorderStyleRoundedRect];
//    [self.view addSubview:self.artistTextField];
////    [self.contentView addSubview:self.artistTextField];

//    self.songLabel = [UILabel new];
//    self.songLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.songLabel setText:@"Song:"];
//    [self.songLabel setTextColor:[UIColor whiteColor]];
//    [self.view addSubview:self.songLabel];
////    [self.contentView addSubview:self.songLabel];

//    self.songTextField = [UITextField new];
//    self.songTextField.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.songTextField setBackgroundColor:[UIColor whiteColor]];
//    [self.songTextField setBorderStyle:UITextBorderStyleRoundedRect];
//    [self.view addSubview:self.songTextField];
////    [self.contentView addSubview:self.songTextField];

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
    
    self.checkEntriesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.checkEntriesButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkEntriesButton setBackgroundColor:[UIColor colorWithRed:92.0/255.0 green:247.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.checkEntriesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkEntriesButton setTitle:@"Check Entries" forState:UIControlStateNormal];
    [self.checkEntriesButton addTarget:self action:@selector(checkEntriesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonContainerView addSubview:self.checkEntriesButton];
//    [self.contentView addSubview:self.checkEntriesButton];
    
    self.addEntryButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.addEntryButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addEntryButton setBackgroundColor:[UIColor colorWithRed:92.0/255.0 green:247.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.addEntryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.addEntryButton setTitle:@"New Entry" forState:UIControlStateNormal];
//    [self.newEntryButton addTarget:self action:@selector(checkEntriesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonContainerView addSubview:self.addEntryButton];
    //    [self.contentView addSubview:self.newEntryButton];
}

- (void) setUpConstraints {
    
//    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Create a dictionaries for VFL.
    NSDictionary *viewsDictionary = @{/*@"artistLabel": self.artistLabel,*/
//                                      @"artistTextField": self.artistTextField,
//                                      @"songLabel": self.songLabel,
//                                      @"songTextField": self.songTextField,
                                      @"addEntryButton": self.addEntryButton,
                                      @"buttonContainerView": self.buttonContainerView,
                                      @"contentContainerView": self.contentContainerView,
                                      @"checkEntriesButton": self.checkEntriesButton,
                                      @"headingLabel": self.headingLabel,
                                      @"descriptionLabel": self.descriptionLabel,
//                                      @"resultLabel": self.resultLabel,
                                      /*@"scrollView": self.scrollView,
                                      @"contentView": self.contentView*/};
    
    NSDictionary *metricsDictionary = @{@"gap": @20, @"topGap": @200};
    
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
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[contentContainerView(300)]-(>=1)-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=1)-[contentContainerView(300)]-(>=1)-|"
                                                                                          options:0
                                                                                          metrics:nil
                                                                                            views:viewsDictionary]];
    
    // Constraints for headingLabel.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.headingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[headingLabel]-(>=1)-|"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:viewsDictionary]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[headingLabel]-[descriptionLabel]-[buttonContainerView(116)]-|"
                                                                                 options:0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];

    // Constraints for descriptionLabel.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[descriptionLabel]-(>=1)-|"
                                                                                       options:0
                                                                                       metrics:nil
                                                                                         views:viewsDictionary]];
    
    // Create constraints for buttonContainerView.
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[buttonContainerView(224)]-(>=1)-|"
                                                                                           options:NSLayoutFormatAlignAllBottom
                                                                                           metrics:nil
                                                                                             views:viewsDictionary]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[addEntryButton(checkEntriesButton)]-8-[checkEntriesButton(100)]-|"
                                                                                  options:NSLayoutFormatAlignAllBottom
                                                                                  metrics:nil
                                                                                    views:viewsDictionary]];
    
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[checkEntriesButton(100)]-|"
                                                                                options:0
                                                                                metrics:metricsDictionary
                                                                                  views:viewsDictionary]];
    [self.contentContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[addEntryButton(100)]-|"
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
    [self.view endEditing:YES];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
