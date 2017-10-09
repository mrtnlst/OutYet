//
//  AddEntryViewController.m
//  OutYet
//
//  Created by martin on 07.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "AddEntryViewController.h"

@interface AddEntryViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *formContainerView;
@property (nonatomic, strong) UIView *cancelContainerView;
@property (nonatomic, strong) UIView *saveContainerView;
@property (nonatomic, strong) UIView *buttonContainerView;

@property (nonatomic, strong) UILabel *headingLabel;
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *songLabel;
@property (nonatomic, strong) UILabel *saveButtonLabel;
@property (nonatomic, strong) UILabel *cancelButtonLabel;

@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) UITextField *artistTextField;
@property (nonatomic, strong) UITextField *songTextField;

@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];
    [self setUpViews];
    [self setUpConstraints];
}

- (void)setUpViews {
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Otherwise the highlight state of buttons is 1 second delayed.
    [self.scrollView setDelaysContentTouches:NO];
    [self.view addSubview:self.scrollView];
    
    self.formContainerView = [[UIScrollView alloc] init];
    self.formContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.formContainerView];
    
    self.buttonContainerView = [[UIView alloc] init];
    self.buttonContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.buttonContainerView];
    
    self.saveContainerView = [[UIView alloc] init];
    self.saveContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonContainerView addSubview:self.saveContainerView];
    
    self.cancelContainerView = [[UIView alloc] init];
    self.cancelContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonContainerView addSubview:self.cancelContainerView];
    
    // Create views.
    
    self.headingLabel = [UILabel new];
    self.headingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.headingLabel setText:@"Add new entry"];
    [self.headingLabel setTextColor:[UIColor whiteColor]];
    [self.headingLabel setFont:[UIFont systemFontOfSize:40]];
    [self.scrollView addSubview:self.headingLabel];
    
    self.artistLabel = [UILabel new];
    self.artistLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.artistLabel setText:@"Artist:"];
    [self.artistLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [self.artistLabel setTextColor:[UIColor whiteColor]];
    [self.formContainerView addSubview:self.artistLabel];
    
    self.artistTextField = [UITextField new];
    self.artistTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.artistTextField setBackgroundColor:[UIColor whiteColor]];
    [self.artistTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.formContainerView addSubview:self.artistTextField];
    
    self.songLabel = [UILabel new];
    self.songLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.songLabel setText:@"Song:"];
    [self.songLabel setTextColor:[UIColor whiteColor]];
    [self.formContainerView addSubview:self.songLabel];
    
    self.songTextField = [UITextField new];
    self.songTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.songTextField setBackgroundColor:[UIColor whiteColor]];
    [self.songTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.formContainerView addSubview:self.songTextField];
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.saveButton setImage:[UIImage imageNamed:@"SaveButton"] forState:UIControlStateNormal];
//    [self.saveButton addTarget:self action:@selector(checkEntriesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.saveButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.saveButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.saveButton.layer setShadowOpacity:0.2];
    [self.saveContainerView addSubview:self.saveButton];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cancelButton setImage:[UIImage imageNamed:@"CancelButton"] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.cancelButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.cancelButton.layer setShadowOpacity:0.2];
    [self.cancelContainerView addSubview:self.cancelButton];
    
    self.saveButtonLabel = [UILabel new];
    self.saveButtonLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.saveButtonLabel setText:@"Save Entry"];
    [self.saveButtonLabel setTextColor:[UIColor whiteColor]];
    [self.saveButtonLabel setFont:[UIFont systemFontOfSize:12]];
    [self.saveContainerView addSubview:self.saveButtonLabel];
    
    self.cancelButtonLabel = [UILabel new];
    self.cancelButtonLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cancelButtonLabel setText:@"Cancel"];
    [self.cancelButtonLabel setTextColor:[UIColor whiteColor]];
    [self.cancelButtonLabel setFont:[UIFont systemFontOfSize:12]];
    [self.cancelContainerView addSubview:self.cancelButtonLabel];
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = @{@"artistLabel": self.artistLabel,
                                      @"artistTextField": self.artistTextField,
                                      @"songLabel": self.songLabel,
                                      @"songTextField": self.songTextField,
                                      @"headingLabel": self.headingLabel,
                                      @"saveButton": self.saveButton,
                                      @"cancelButton": self.cancelButton,
                                      @"saveContainer": self.saveContainerView,
                                      @"saveButtonLabel": self.saveButtonLabel,
                                      @"cancelContainer": self.cancelContainerView,
                                      @"cancelButtonLabel": self.cancelButtonLabel,
                                      @"buttonContainerView": self.buttonContainerView,
                                      @"scrollView": self.scrollView,
                                      @"formContainerView": self.formContainerView};
    
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
    
    // Constraints for scrollView.
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    
    // headingLabel.
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.headingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[headingLabel]-(>=1)-|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewsDictionary]];
    // formContainerView.
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.formContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[formContainerView(formContainerWidth)]-(>=1)-|"
                                                                            options:0
                                                                            metrics:metricsDictionary
                                                                              views:viewsDictionary]];
    // buttonContainerView.
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[buttonContainerView(buttonContainerWidth)]-(>=1)-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    // Vertical constraints for scrollView.
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(topGap)-[headingLabel]-[formContainerView(formContainerHeight)][buttonContainerView(buttonContainerHeight)]-|"
                                                                            options:0
                                                                            metrics:metricsDictionary
                                                                              views:viewsDictionary]];
    
    // Constraints for items inside formContainerView.
    [self.formContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[artistLabel]-[artistTextField(textFieldWidth)]-|"
                                                                                   options:NSLayoutFormatAlignAllLastBaseline
                                                                                   metrics:metricsDictionary
                                                                                     views:viewsDictionary]];
    [self.formContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[songLabel]-[songTextField(textFieldWidth)]-|"
                                                                                   options:NSLayoutFormatAlignAllLastBaseline
                                                                                   metrics:metricsDictionary
                                                                                     views:viewsDictionary]];

    [self.formContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[artistTextField]-[songTextField]-|"
                                                                                   options:NSLayoutFormatAlignAllLeading+NSLayoutFormatAlignAllTrailing
                                                                                   metrics:nil
                                                                                     views:viewsDictionary]];

    // Constraints for for buttonContainerView.
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonContainerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[buttonContainerView(buttonContainerWidth)]-(>=1)-|"
                                                                                      options:0
                                                                                      metrics:metricsDictionary
                                                                                        views:viewsDictionary]];
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonContainerSpace)-[cancelContainer(labelContainerWidth)]-(buttonContainerSpace)-[saveContainer(labelContainerWidth)]-(buttonContainerSpace)-|"
                                                                                     options:NSLayoutFormatAlignAllBottom
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[saveContainer(labelContainerHeight)]-|"
                                                                                     options:0
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    [self.buttonContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[cancelContainer(labelContainerHeight)]-|"
                                                                                     options:0
                                                                                     metrics:metricsDictionary
                                                                                       views:viewsDictionary]];
    
    // Constraints for saveContainerView.
    [self.saveContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.saveContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.saveContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[saveButton(buttonWidth)]-(>=1)-|"
                                                                                       options:NSLayoutFormatAlignAllBottom
                                                                                       metrics:metricsDictionary
                                                                                         views:viewsDictionary]];
    
    [self.saveContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.saveButtonLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.saveContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.saveContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[saveButtonLabel]-(>=1)-|"
                                                                                       options:NSLayoutFormatAlignAllBottom
                                                                                       metrics:metricsDictionary
                                                                                         views:viewsDictionary]];
    
    [self.saveContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[saveButton(buttonWidth)][saveButtonLabel]-|"
                                                                                       options:0
                                                                                       metrics:metricsDictionary
                                                                                         views:viewsDictionary]];
    
    // Constraints for cancelContainerView.
    [self.cancelContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cancelContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.cancelContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButtonLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cancelContainerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.cancelContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[cancelButton(buttonWidth)]-(>=1)-|"
                                                                                           options:NSLayoutFormatAlignAllBottom
                                                                                           metrics:metricsDictionary
                                                                                             views:viewsDictionary]];
    [self.cancelContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[cancelButtonLabel]-(>=1)-|"
                                                                                           options:NSLayoutFormatAlignAllBottom
                                                                                           metrics:metricsDictionary
                                                                                             views:viewsDictionary]];
    
    [self.cancelContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[cancelButton(buttonWidth)][cancelButtonLabel]-|"
                                                                                           options:0
                                                                                           metrics:metricsDictionary
                                                                                           views:viewsDictionary]];
    
}

- (void)turnOnColors {
    [self.formContainerView setBackgroundColor:[UIColor blueColor]];
    [self.saveContainerView setBackgroundColor:[UIColor orangeColor]];
    [self.buttonContainerView setBackgroundColor:[UIColor yellowColor]];
    [self.cancelContainerView setBackgroundColor:[UIColor orangeColor]];

}
-(void) cancelButtonClicked:(UIButton*)sender {
    NSLog(@"Going back.");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

