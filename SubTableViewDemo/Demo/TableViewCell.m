//
//  TableViewCell.m
//  SubTableView
//
//  Created by User on 26/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize titleLabel = _titleLabel;
@synthesize completeLabel = _completeLabel;
@synthesize deleteLabel = _deleteLabel;

- (void)awakeFromNib{
    
    _completeLabel.text = @"\u2713";
    _deleteLabel.text = @"\u2717";


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
