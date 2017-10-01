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
}

- (void) setUpConstraints {
    
    // Create a dictionary for VFL.
    NSDictionary *viewsDictionary = @{@"artistLabel": self.artistLabel,
                                      @"artistTextField": self.artistTextField,
                                      @"songLabel": self.songLabel,
                                      @"songTextField": self.songTextField};
    
    // Create container with anchors.
    UILayoutGuide *container = [UILayoutGuide new];
    [self.view addLayoutGuide:container];
    [container.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.artistTextField.topAnchor constraintEqualToAnchor:container.topAnchor].active = YES;
    [self.songTextField.bottomAnchor constraintEqualToAnchor:container.bottomAnchor].active = YES;
    
    // Create constraints for each row of Label and TextField.
    NSArray *constraintArtist = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[artistLabel]-[artistTextField]-|"
                                                                        options:NSLayoutFormatAlignAllFirstBaseline
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraintSong = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[songLabel]-[songTextField]-|"
                                                                      options:NSLayoutFormatAlignAllFirstBaseline
                                                                      metrics:nil
                                                                        views:viewsDictionary];
    
    // Create vertical constraints. No | for superview needed, because anchors for TextFields are set.
    NSArray *constraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[artistTextField]-[songTextField]"
                                                                          options:NSLayoutFormatAlignAllLeading+ NSLayoutFormatAlignAllTrailing
                                                                          metrics:nil
                                                                            views:viewsDictionary];
    [self.view addConstraints:constraintArtist];
    [self.view addConstraints:constraintSong];
    [self.view addConstraints:constraintVertical];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
