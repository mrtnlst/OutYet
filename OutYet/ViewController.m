//
//  ViewController.m
//  OutYet
//
//  Created by martin on 04.09.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "ViewController.h"
#import "Helper.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *songLabel;
@property (nonatomic, strong) UILabel *headingLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UITextField *artistTextField;
@property (nonatomic, strong) UITextField *songTextField;
@property (nonatomic, strong) UIButton *checkButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];
    
    [self setUpViews];
    [self setUpConstraints];
   
}

- (void)setUpViews {
    
    // Create views.
    self.artistLabel = [UILabel new];
    self.artistLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.artistLabel setText:@"Artist:"];
    [self.artistLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [self.artistLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.artistLabel];
    
    self.artistTextField = [UITextField new];
    self.artistTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.artistTextField setBackgroundColor:[UIColor whiteColor]];
    [self.artistTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.artistTextField];
    
    self.songLabel = [UILabel new];
    self.songLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.songLabel setText:@"Song:"];
    [self.songLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.songLabel];
    
    self.songTextField = [UITextField new];
    self.songTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.songTextField setBackgroundColor:[UIColor whiteColor]];
    [self.songTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.songTextField];
    
    self.headingLabel = [UILabel new];
    self.headingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.headingLabel setText:@"OutYet"];
    [self.headingLabel setTextColor:[UIColor whiteColor]];
    [self.headingLabel setFont:[UIFont systemFontOfSize:40]];
    [self.view addSubview:self.headingLabel];
    
    self.descriptionLabel = [UILabel new];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.descriptionLabel setText:@"Check availability of tracks on iTunes."];
    [self.descriptionLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.descriptionLabel];
    
    self.resultLabel = [UILabel new];
    self.resultLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.resultLabel setText:@"~Results~"];
    [self.resultLabel setTextColor:[UIColor whiteColor]];
    [self.resultLabel setNumberOfLines:4];
    [self.view addSubview:self.resultLabel];
    
    self.checkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.checkButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkButton setBackgroundColor:[UIColor colorWithRed:92.0/255.0 green:247.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkButton setTitle:@"Check" forState:UIControlStateNormal];
    [self.checkButton addTarget:self action:@selector(checkButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_checkButton];
}

- (void) setUpConstraints {
    
    // Create a dictionaries for VFL.
    NSDictionary *viewsDictionary = @{@"artistLabel": self.artistLabel,
                                      @"artistTextField": self.artistTextField,
                                      @"songLabel": self.songLabel,
                                      @"songTextField": self.songTextField,
                                      @"checkButton": self.checkButton,
                                      @"headingLabel": self.headingLabel,
                                      @"descriptionLabel": self.descriptionLabel,
                                      @"resultLabel": self.resultLabel};
    
    NSDictionary *metricsDictionary = @{@"bottomGap": @20, @"topGap": @30};
    
    // Create container with anchors.
//    UILayoutGuide *container = [UILayoutGuide new];
//    [self.view addLayoutGuide:container];
//    [container.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
//    [self.artistTextField.topAnchor constraintEqualToAnchor:container.topAnchor].active = YES;
//    [self.songTextField.bottomAnchor constraintEqualToAnchor:container.bottomAnchor].active = YES;
    
    // Heading.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    NSArray *constraintHeadingHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[headingLabel]-(>=1)-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraintHeadingVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(topGap)-[headingLabel]-[descriptionLabel]"
                                                                                options:0
                                                                                metrics:metricsDictionary
                                                                                  views:viewsDictionary];
    // Description.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    NSArray *constraintDescriptionHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[descriptionLabel]-(>=1)-|"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:viewsDictionary];
    NSArray *constraintDescriptionVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[headingLabel]-[descriptionLabel]-[artistTextField]"
                                                                                 options:0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary];
    // Artist and song TextFields and Labels.
    NSArray *constraintArtist = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[artistLabel]-[artistTextField]-|"
                                                                        options:NSLayoutFormatAlignAllFirstBaseline
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraintSong = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[songLabel]-[songTextField]-|"
                                                                      options:NSLayoutFormatAlignAllFirstBaseline
                                                                      metrics:nil
                                                                        views:viewsDictionary];
    
    NSArray *constraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[artistTextField]-[songTextField]"
                                                                          options:NSLayoutFormatAlignAllLeading+ NSLayoutFormatAlignAllTrailing
                                                                          metrics:metricsDictionary
                                                                            views:viewsDictionary];
    // Create constraints for button.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.checkButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    NSArray *constraintButtonHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[checkButton(100)]-(>=1)-|"
                                                                      options:NSLayoutFormatAlignAllBottom
                                                                      metrics:nil
                                                                        views:viewsDictionary];
    NSArray *constraintButtonVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[songTextField]-[checkButton]"
                                                                                options:0
                                                                                metrics:metricsDictionary
                                                                                  views:viewsDictionary];
    // Result.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.resultLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    NSArray *constraintResultHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[resultLabel]-(>=1)-|"
                                                                                       options:0
                                                                                       metrics:nil
                                                                                         views:viewsDictionary];
    NSArray *constraintResultVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[checkButton]-[resultLabel]"
                                                                                     options:0
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary];
    
    // Adding views to superview.
    [self.view addConstraints:constraintResultHorizontal];
    [self.view addConstraints:constraintResultVertical];
    [self.view addConstraints:constraintDescriptionHorizontal];
    [self.view addConstraints:constraintDescriptionVertical];
    [self.view addConstraints:constraintHeadingHorizontal];
    [self.view addConstraints:constraintHeadingVertical];
    [self.view addConstraints:constraintArtist];
    [self.view addConstraints:constraintSong];
    [self.view addConstraints:constraintVertical];
    [self.view addConstraints:constraintButtonVertical];
    [self.view addConstraints:constraintButtonHorizontal];
}

-(void) checkButtonClicked:(UIButton*)sender {
    [self.view endEditing:YES];
    NSLog(@"Initiating request.");
    NSLog(@"Artist: %@, Song: %@", [self.artistTextField text], [self.songTextField text]);
    [self.resultLabel setText:@"Checking for results.."];
    
    // Create query string.
    NSArray *array = [Helper createQueryStringWithArtist:[self.artistTextField text] withSong:[self.songTextField text]];
    
    // Create iTunes request.
    RequestiTunes  *itunesRequest = [[RequestiTunes alloc] initWithArtistName:[array objectAtIndex:0]
                                     
                                                                withTrackName:[array objectAtIndex:1]];
    if (itunesRequest.album != nil) {
        [self.resultLabel setText:[NSString stringWithFormat:@"It's already out yet!\nArtist: %@\nSong: %@\nAlbum: %@", [itunesRequest artist], [itunesRequest track], [itunesRequest album]]];
    }
    else {
        [self.resultLabel setText:@"Not found."];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
