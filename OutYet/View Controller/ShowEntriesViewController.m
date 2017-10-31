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
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *checkEntriesButton;

@end

@implementation ShowEntriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    [self setUpConstraints];
    
}

- (void)setUpViews {
    self.content = @[@"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    [self.view addSubview:self.table];
    [self.table setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];
    
    
    self.navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [self.navigationBar setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];
    [self.view addSubview:self.navigationBar];
    
    //    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    //    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
    //
    //    [self.view addSubview:myNav];
    //    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Entries"];
    //    UIImage *cancelImage = [UIImage imageNamed:@"CancelButton"];
    //    cancelImage = [cancelImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithImage:cancelImage style:UIBarButtonItemStylePlain target:nil action:@selector(cancelButtonClicked:)];
    //
    //
    //    [item setRightBarButtonItem:cancelButton];
    //    [myNav setItems:[NSArray arrayWithObject:item] animated:NO];
    //
    [self.table setContentInset:UIEdgeInsetsMake(70, 0, 0, 0)];
    
    self.checkEntriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkEntriesButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkEntriesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkEntriesButton setImage:[UIImage imageNamed:@"CheckButton"] forState:UIControlStateNormal];
    [self.checkEntriesButton addTarget:self action:@selector(checkEntriesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.checkEntriesButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.checkEntriesButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.checkEntriesButton.layer setShadowOpacity:0.2];
    [self.navigationBar addSubview:self.checkEntriesButton];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cancelButton setImage:[UIImage imageNamed:@"CancelButton"] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.cancelButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.cancelButton.layer setShadowOpacity:0.2];
    [self.navigationBar addSubview:self.cancelButton];
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = @{@"navigationBar": self.navigationBar,
                                      @"cancelButton": self.cancelButton,
                                      @"checkEntriesButton": self.checkEntriesButton};
    
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
    
//    // headingLabel.
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.headingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[headingLabel]-(>=1)-|"
//                                                                            options:0
//                                                                            metrics:nil
//                                                                              views:viewsDictionary]];
    // formContainerView.
    // Constraints for for buttonContainerView.
    
    [self.navigationBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[cancelButton(buttonWidth)]-[checkEntriesButton(buttonWidth)]-|"
                                                                            options:0
                                                                            metrics:metricsDictionary
                                                                              views:viewsDictionary]];
    [self.navigationBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[cancelButton(buttonWidth)]-|"
                                                                               options:0
                                                                               metrics:metricsDictionary
                                                                                 views:viewsDictionary]];
    [self.navigationBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[checkEntriesButton(buttonWidth)]-|"
                                                                               options:0
                                                                               metrics:metricsDictionary
                                                                                 views:viewsDictionary]];
    
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.textLabel.text =  [_content objectAtIndex:indexPath.row];
    
    NSLog(@"title of cell %@", [_content objectAtIndex:indexPath.row]);
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.content.count;
}

-(void) cancelButtonClicked:(UIButton*)sender {
    NSLog(@"Going back.");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

