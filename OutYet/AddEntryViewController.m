//
//  AddEntryViewController.m
//  OutYet
//
//  Created by martin on 07.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "AddEntryViewController.h"

@interface AddEntryViewController ()
//@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *songLabel;

//@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UITextField *artistTextField;
@property (nonatomic, strong) UITextField *songTextField;
//@property (nonatomic, strong) UIButton *checkButton;

@end

@implementation AddEntryViewController

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
    //    [self.contentView addSubview:self.artistLabel];
    
        self.artistTextField = [UITextField new];
        self.artistTextField.translatesAutoresizingMaskIntoConstraints = NO;
        [self.artistTextField setBackgroundColor:[UIColor whiteColor]];
        [self.artistTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.view addSubview:self.artistTextField];
    //    [self.contentView addSubview:self.artistTextField];
    
        self.songLabel = [UILabel new];
        self.songLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.songLabel setText:@"Song:"];
        [self.songLabel setTextColor:[UIColor whiteColor]];
        [self.view addSubview:self.songLabel];
    //    [self.contentView addSubview:self.songLabel];
    
        self.songTextField = [UITextField new];
        self.songTextField.translatesAutoresizingMaskIntoConstraints = NO;
        [self.songTextField setBackgroundColor:[UIColor whiteColor]];
        [self.songTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.view addSubview:self.songTextField];
    //    [self.contentView addSubview:self.songTextField];
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = @{@"artistLabel": self.artistLabel,
                                      @"artistTextField": self.artistTextField,
                                      @"songLabel": self.songLabel,
                                      @"songTextField": self.songTextField,
//                                      @"resultLabel": self.resultLabel,
                                      /*@"scrollView": self.scrollView,
                                       @"contentView": self.contentView*/};
    
    
    // Constraints for headingLabel.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.artistLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[artistLabel]-(>=1)-|"
                                                                                      options:0
                                                                                      metrics:nil
                                                                                        views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[artistLabel]-|"
                                                                                      options:0
                                                                                      metrics:nil
                                                                                        views:viewsDictionary]];

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
