//
//  LongPressMove.m
//  SubTableViewDemo
//
//  Created by User on 29/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import "LongPressMove.h"

@implementation LongPressMove

- (id)initWithTableView:(ParentTableView *)tableView WithPriority:(NSInteger)priority{
    
    if(self = [super initWithTableView:tableView WithPriority:priority]){
        
        UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
        [self addGestureRecognizer:recognizer WithDelegate:self];
    }
    
    return self;
}

- (void)onLongPress:(UILongPressGestureRecognizer *)recognizer{
    
}

@end
