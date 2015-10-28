//
//  ParentTableView.h
//  SubTableView
//
//  Created by User on 26/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubTableViewCell.h"

@class ParentTableView;
@class GestureComponent;
@class ParentTableViewCell;

@protocol ParentTableViewDelegate <NSObject>

@required
- (NSInteger)numberOfParentCellIsInTableView:(ParentTableView *)tableView;
- (UITableViewCell *)tableView:(ParentTableView *)tableView parentCellForRowAtIndex:(NSInteger)index;
- (UITableViewCell *)tableView:(ParentTableView *)tableView subCellRowUnderParentIndex:(NSInteger)parentIndex;

- (NSInteger)numberOfChildrenCellUnderParentIndex:(NSInteger)parentIndex;
- (UITableViewCell *)tableView:(UITableView *)tableView childCellForRowAtIndex:(NSInteger)childIndex underParentIndex:(NSInteger)parentIndex;


@optional
- (CGFloat)tableView:(ParentTableView *)tableView parentCellHeightForRowAtIndex:(NSInteger )index;
- (CGFloat)tableView:(ParentTableView *)tableView subCellHeightForRowAtIndex:(NSInteger)index underParentIndex:(NSInteger)parentIndex;

/**
 * Return YES to allow parent cell to be expand otherwise NO
 */
- (BOOL)tableView:(ParentTableView *)tableView canExpandSubCellForRowAtIndex:(NSInteger)index;
//- (void)tableView:(ParentTableView *)tableView didSelectRowAtIndex:(NSInteger)index;
- (void)tableView:(ParentTableView *)tableView didExpandForParentCellAtIndex:(NSInteger)index withSubCellIndex:(NSInteger)subIndex;
- (void)tableView:(ParentTableView *)tableView didCollapseForParentCellAtIndex:(NSInteger)index withSubCellIndex:(NSInteger)subIndex;

//- (void)tableView:(UITableView *)tableView didSelectRowAtChildIndex:(NSInteger)childIndex underParentIndex:(NSInteger)parentIndex;
- (CGFloat)tableView:(UITableView *)tableView childCellHeightForRowAtChildIndex:(NSInteger)childIndex underParentIndex:(NSInteger)parentIndex;

@end

@interface ParentTableView : UITableView<UITableViewDataSource, UITableViewDelegate, SubTableViewCellDelegate>{

    NSMutableArray *_expansionStates;
}

@property (weak, nonatomic) IBOutlet id<ParentTableViewDelegate> theDelegate;
@property (assign, nonatomic) NSInteger selectedRow;

/**
 * All gesture components
 */
@property (getter=getGestureComponents, nonatomic) NSArray *allGestureComponents;

/**
 * Determine whether tableView is in editing mode or not
 */
@property (getter=getIsOnEdit, nonatomic) BOOL isOnEdit;
@property (setter=setInteractionEnable:, nonatomic) BOOL interactionEnable;

- (void)collapseAllRows;
- (BOOL)expandForParentCellAtIndex:(NSInteger)index;
- (BOOL)canExpandParentCellAtIndex:(NSInteger)index;
- (UITableViewCell *)cellViewFromNib:(NSString *)nibName atViewIndex:(NSUInteger)viewIndex;

/**
 * Add listener and listen UIScrollViewDelegate event
 * If you add listener then you are responsible to remove
 * when no longer want to listen event
 */
- (void)addListenerForScrollViewDelegate:(id<UIScrollViewDelegate>)listener;

/**
 * Remove listener for UIScrollViewDelegate event
 */
- (void)removeListenerForScrollViewDelegate:(id<UIScrollViewDelegate>)listener;

/**
 * Add gesture component
 */
- (void)addGestureComponent:(GestureComponent *)component;

/**
 * Remove gesture component
 */
- (void)removeGestureComponent:(GestureComponent *)component;

/**
 * Remove gesture component by class
 */
- (void)removeGestureComponentByClass:(Class)componentClass;

/**
 * Find gesture Component by class
 */
- (id)findGestureComponentByClass:(Class)componentClass;

/**
 * Return parent cell if found otherwise nil
 */
- (ParentTableViewCell *)findCellByTouchPoint:(CGPoint)point;

/**
 * Insert new parent cell at index
 * You must insert new data into your data source before calling this method
 */
- (void)insertNewRowAtIndex:(NSInteger)index withAnimation:(UITableViewRowAnimation)anim;

/**
 * Delete parent cell at index
 * You must delete data from your data source before calling this method
 */
- (void)deleteRowAtIndex:(NSInteger)index withAnimation:(UITableViewRowAnimation)anim;
@end
