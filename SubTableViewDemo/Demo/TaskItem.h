//
//  TaskItem.h
//  SubTableViewDemo
//
//  Created by User on 29/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskItem : NSObject

@property (assign, nonatomic) BOOL isComplete;
@property (copy, nonatomic) NSString *itemName;

+ (id)newItemWithName:(NSString *)name;

@end
