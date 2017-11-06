//
//  OutYetTableViewCell.m
//  OutYet
//
//  Created by martin on 05.11.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "OutYetTableViewCell.h"

@interface OutYetTableViewCell ()
@property (nonatomic, strong) UIView *labelView;
@end

@implementation OutYetTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.labelView = [[UIView alloc] init];
        self.labelView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.labelView];
        
        self.trackName = [[UILabel alloc] init/*WithFrame:CGRectMake(gap, 0, labelWidth, labelHeight)*/];
        [self.trackName setTextColor:[UIColor whiteColor]];
//        [self.trackName setBackgroundColor:[UIColor blueColor]];
        [self.trackName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.labelView addSubview:self.trackName];

        self.artistName = [[UILabel alloc] init/*WithFrame:CGRectMake(gap, label2Y, labelWidth, labelHeight)*/];
        [self.artistName setTextColor:[UIColor whiteColor]];
//        [self.artistName setBackgroundColor:[UIColor greenColor]];
        [self.artistName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.artistName setFont:[UIFont systemFontOfSize:12.0f]];
        [self.labelView addSubview:self.artistName];

        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:97.0/255.0 alpha:1.0]];

        self.statusImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UnknownSymbol"]];
        [self.statusImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.statusImage];
        
        NSDictionary *viewsDictionary = @{@"trackName": self.trackName,
                                          @"artistName": self.artistName,
                                          @"statusImage": self.statusImage,
                                          @"labelView": self.labelView,
                                          };
        
        NSDictionary *metricsDictionary = @{@"topGap": @20,
                                            @"labelHeight": @18,
                                            @"imageHeight": @30,
                                            @"imageWidth": @30,
                                            @"imageGapTop": @(self.frame.size.height / 2 - 10),
                                            };

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[labelView]-[statusImage(imageHeight)]-|"
                                                                                 options: 0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[labelView]|"
                                                                                 options: 0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(imageGapTop)-[statusImage(imageWidth)]"
                                                                                 options: 0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];
        
        [self.labelView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(topGap)-[trackName]-|"
                                                                                 options: 0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];
        [self.labelView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(topGap)-[artistName]-|"
                                                                                 options: 0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];
        
        [self.labelView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[trackName(labelHeight)][artistName(labelHeight)]-|"
                                                                                 options: 0
                                                                                 metrics:metricsDictionary
                                                                                   views:viewsDictionary]];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
