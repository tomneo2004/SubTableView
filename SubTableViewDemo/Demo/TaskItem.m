//
//  TaskItem.m
//  SubTableViewDemo
//
//  Created by User on 29/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import "TaskItem.h"

@implementation TaskItem

@synthesize isComplete = _isComplete;
@synthesize itemName = _itemName;

+ (id)newItemWithName:(NSString *)name{
    
    TaskItem * item = [[TaskItem alloc] init];
    item.isComplete = NO;
    item.itemName = name;
    
    return item;
}

@end
