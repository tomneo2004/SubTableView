//
//  TableViewCell.m
//  SubTableView
//
//  Created by User on 26/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell{
    
    BOOL _isComplete;
}

@synthesize titleLabel = _titleLabel;
@synthesize completeLabel = _completeLabel;
@synthesize deleteLabel = _deleteLabel;

- (void)awakeFromNib{
    
    _completeLabel.text = @"\u2713";
    _deleteLabel.text = @"\u2717";


}

- (BOOL)isComplete{
    
    return _isComplete;
}

- (void)setIsComplete:(BOOL)isComplete{
    
    _isComplete = isComplete;
    
    if(isComplete){
        
        self.backgroundColor = [UIColor greenColor];
    }
    else{
        
        self.backgroundColor = [UIColor clearColor];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
