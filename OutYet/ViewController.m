//
//  ViewController.m
//  OutYet
//
//  Created by martin on 04.09.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *songLabel;
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
    
    self.checkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.checkButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkButton setBackgroundColor:[UIColor colorWithRed:92.0/255.0 green:247.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkButton setTitle:@"Check" forState:UIControlStateNormal];
    [self.view addSubview:_checkButton];
}

- (void) setUpConstraints {
    
    // Create a dictionaries for VFL.
    NSDictionary *viewsDictionary = @{@"artistLabel": self.artistLabel,
                                      @"artistTextField": self.artistTextField,
                                      @"songLabel": self.songLabel,
                                      @"songTextField": self.songTextField,
                                      @"checkButton": self.checkButton};
    
    NSDictionary *metricsDictionary = @{@"bottomGap": @20, @"topGap": @100};
    
    // Create container with anchors.
//    UILayoutGuide *container = [UILayoutGuide new];
//    [self.view addLayoutGuide:container];
//    [container.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
//    [self.artistTextField.topAnchor constraintEqualToAnchor:container.topAnchor].active = YES;
//    [self.songTextField.bottomAnchor constraintEqualToAnchor:container.bottomAnchor].active = YES;

    // Create constraints for Labels and TextFields.
    NSArray *constraintArtist = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[artistLabel]-[artistTextField]-|"
                                                                        options:NSLayoutFormatAlignAllFirstBaseline
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraintSong = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[songLabel]-[songTextField]-|"
                                                                      options:NSLayoutFormatAlignAllFirstBaseline
                                                                      metrics:nil
                                                                        views:viewsDictionary];
    
    // No | for superview needed, because anchors for TextFields are set.
    NSArray *constraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(topGap)-[artistTextField]-[songTextField]"
                                                                          options:NSLayoutFormatAlignAllLeading+ NSLayoutFormatAlignAllTrailing
                                                                          metrics:metricsDictionary
                                                                            views:viewsDictionary];
    
    // Create constraints for button.
    
    // Center button horizontally in row.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.checkButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    NSArray *constraintButtonHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[checkButton(100)]-(>=1)-|"
                                                                      options:NSLayoutFormatAlignAllBottom
                                                                      metrics:nil
                                                                        views:viewsDictionary];
    NSArray *constraintButtonVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[songTextField]-[checkButton]"
                                                                                options:0
                                                                                metrics:metricsDictionary
                                                                                  views:viewsDictionary];
    
    [self.view addConstraints:constraintArtist];
    [self.view addConstraints:constraintSong];
    [self.view addConstraints:constraintVertical];
    [self.view addConstraints:constraintButtonVertical];
    [self.view addConstraints:constraintButtonHorizontal];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
