//
//  ViewController.m
//  SubTableView
//
//  Created by User on 26/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "SubTableCell.h"
#import "ChildTableCell.h"
#import "TaskItem.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ParentTableView *tableView;

@end

@implementation ViewController{
    
    NSMutableArray *dataArray;
    CGFloat parentCellHeight;
    CGFloat subCellHeight;
    CGFloat childCellHeight;
}

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray = [[NSMutableArray alloc] initWithObjects:
                 [TaskItem newItemWithName:@"a"],
                 [TaskItem newItemWithName:@"aiiiiq"],
                 [TaskItem newItemWithName:@"bnmmhh"],
                 [TaskItem newItemWithName:@"pooooop"],
                 [TaskItem newItemWithName:@"qyyyyyyy"],
                 [TaskItem newItemWithName:@"cccccccc"],
                 [TaskItem newItemWithName:@"mm"],
                 [TaskItem newItemWithName:@"gggggg"],
                 [TaskItem newItemWithName:@"iuiuia"],
                 [TaskItem newItemWithName:@"rttttttr"],
                 [TaskItem newItemWithName:@"a2222333"],
                 [TaskItem newItemWithName:@"iiiuuuyyyttt"],
                 [TaskItem newItemWithName:@"dsdddddd"],
                 [TaskItem newItemWithName:@"xxxxxxxx"],
                 [TaskItem newItemWithName:@"zzzzzzzzz"],
                 [TaskItem newItemWithName:@"cpppppp"],
                 [TaskItem newItemWithName:@"ddsddddd"],
                 [TaskItem newItemWithName:@"eeeerrrrrrr"],
                 [TaskItem newItemWithName:@"yyyyyyyyy"],
                 [TaskItem newItemWithName:@"ahhhhhhh"],
                 [TaskItem newItemWithName:@"jjkjkkkkkkk"],
                 [TaskItem newItemWithName:@"lllllalllllallll"],
                 [TaskItem newItemWithName:@"tttttttt"],
                 nil];
    
    _tableView.theDelegate = self;
    
    PanLeftRight *panLeftRight = [[PanLeftRight alloc] initWithTableView:_tableView WithPriority:0];
    panLeftRight.panRightSnapBackAnim = YES;
    panLeftRight.panLeftSnapBackAnim = YES;
    panLeftRight.delegate = self;
    [_tableView addGestureComponent:panLeftRight];
    
    SingleTap *singleTap = [[SingleTap alloc] initWithTableView:_tableView WithPriority:0];
    singleTap.delegate = self;
    [_tableView addGestureComponent:singleTap];
    
    /*
    DoubleTap *doubleTap = [[DoubleTap alloc] initWithTableView:_tableView WithPriority:0];
    doubleTap.delegate = self;
    [_tableView addGestureComponent:doubleTap];
    
    [singleTap requireGestureComponentToFail:doubleTap];
     */
    
    DoubleTapEdit *doubleTapEdit = [[DoubleTapEdit alloc] initWithTableView:_tableView WithPriority:0];
    doubleTapEdit.delegate = self;
    [_tableView addGestureComponent:doubleTapEdit];
    
    [singleTap requireGestureComponentToFail:doubleTapEdit];
    
    /*
    LongPress *longPress = [[LongPress alloc] initWithTableView:_tableView WithPriority:0];
    longPress.delegate = self;
    [_tableView addGestureComponent:longPress];
     */
    LongPressMove *longPressMove = [[LongPressMove alloc] initWithTableView:_tableView WithPriority:0];
    longPressMove.delegate= self;
    [_tableView addGestureComponent:longPressMove];
    
    PullDownAddNew *pullAddNew = [[PullDownAddNew alloc] initWithTableView:_tableView WithPriority:0];
    pullAddNew.delegate = self;
    [_tableView addGestureComponent:pullAddNew];
    
    TableViewCell *pCell = (TableViewCell *)[_tableView cellViewFromNib:@"TableViewCell" atViewIndex:0];
    parentCellHeight = pCell.bounds.size.height;
    
    SubTableCell *sCell = (SubTableCell *)[_tableView cellViewFromNib:@"SubTableCell" atViewIndex:0];
    subCellHeight = sCell.bounds.size.height;
    
    ChildTableCell *cCell = (ChildTableCell *)[_tableView cellViewFromNib:@"ChildTableCell" atViewIndex:0];
    childCellHeight = cCell.bounds.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ParentTableView delegate
- (NSInteger)numberOfParentCellIsInTableView:(ParentTableView *)tableView{
    
    return [dataArray count];
}

- (UITableViewCell *)tableView:(ParentTableView *)tableView parentCellForRowAtIndex:(NSInteger)index{
    
    static NSString *cellId = @"TableViewCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(!cell){
        
        cell = (TableViewCell *)[tableView cellViewFromNib:@"TableViewCell" atViewIndex:0];
    }
    
    TaskItem *item = [dataArray objectAtIndex:index];
    
    cell.titleLabel.text = item.itemName;
    
    cell.isComplete = item.isComplete;
    
    
    return cell;
    
}

- (BOOL)tableView:(ParentTableView *)tableView canExpandSubCellForRowAtIndex:(NSInteger)index{
    
    TaskItem *item = [dataArray objectAtIndex:index];
    
    if(item.isComplete)
        return NO;
    
    return YES;
}

- (UITableViewCell *)tableView:(ParentTableView *)tableView subCellRowUnderParentIndex:(NSInteger)parentIndex{
    
    static NSString *subCellId = @"SubTableCell";
    
    SubTableCell *cell = [tableView dequeueReusableCellWithIdentifier:subCellId];
    
    if(!cell){
        
        cell = (SubTableCell *)[tableView cellViewFromNib:@"SubTableCell" atViewIndex:0];
    }
    
    return cell;
}

- (CGFloat)tableView:(ParentTableView *)tableView parentCellHeightForRowAtIndex:(NSInteger)index{
    
    /*
    TableViewCell *cell = (TableViewCell *)[tableView cellViewFromNib:@"TableViewCell" atViewIndex:0];
    
    return cell.bounds.size.height;
     */
    
    return parentCellHeight;
}

- (CGFloat)tableView:(ParentTableView *)tableView subCellHeightForRowAtIndex:(NSInteger)index underParentIndex:(NSInteger)parentIndex{
    
    /*
    SubTableCell *cell = (SubTableCell *)[tableView cellViewFromNib:@"SubTableCell" atViewIndex:0];
    
    return cell.bounds.size.height;
     */
    return subCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView childCellHeightForRowAtChildIndex:(NSInteger)childIndex underParentIndex:(NSInteger)parentIndex{
    
    /*
    ChildTableCell *cell = (ChildTableCell *)[_tableView cellViewFromNib:@"ChildTableCell" atViewIndex:0];
    
    return cell.bounds.size.height;
     */
    return childCellHeight;
}

- (NSInteger)numberOfChildrenCellUnderParentIndex:(NSInteger)parentIndex{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView childCellForRowAtIndex:(NSInteger)childIndex underParentIndex:(NSInteger)parentIndex{
    
    static NSString *childCellId = @"ChildTableCell";
    
    ChildTableCell *cell = [tableView dequeueReusableCellWithIdentifier:childCellId];
    
    if(!cell){
        
        cell = (ChildTableCell *)[_tableView cellViewFromNib:@"ChildTableCell" atViewIndex:0];
    }
    
    cell.titleLabel.text = @"Menu cell";
    
    return cell;
}


- (void)tableView:(ParentTableView *)tableView didExpandForParentCellAtIndex:(NSInteger)index withSubCellIndex:(NSInteger)subIndex{
    
    //do special stuff here
}

- (void)tableView:(ParentTableView *)tableView didCollapseForParentCellAtIndex:(NSInteger)index withSubCellIndex:(NSInteger)subIndex{
 
    //do special stuff here
}

#pragma mark - PanleftRight delegate
//handle panning left
- (void)onPanningLeftWithDelta:(CGFloat)delta AtCellIndex:(NSInteger)index{
    
    TableViewCell *cell = (TableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    
    
    [cell.deleteLabel setHidden:NO];
    
    cell.deleteLabel.alpha = delta;
    
    if(delta >= 1){
        
        cell.deleteLabel.textColor = [UIColor redColor];
    }
    else{
        
        cell.deleteLabel.textColor = [UIColor blackColor];
    }
     
}

//handle panning right
- (void)onPanningRightWithDelta:(CGFloat)delta AtCellIndex:(NSInteger)index{
    
    TableViewCell *cell = (TableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    
    
    [cell.completeLabel setHidden:NO];
    
    
    cell.completeLabel.alpha = delta;
    
    if(delta >= 1){
        
        cell.completeLabel.textColor = [UIColor greenColor];
    }
    else{
        
        cell.completeLabel.textColor = [UIColor blackColor];
    }
}

- (BOOL)canPanLeftAtCellIndex:(NSInteger)index{
    
    return YES;
}

- (BOOL)canPanRightAtCellIndex:(NSInteger)index{
    
    TaskItem *item = [dataArray objectAtIndex:index];
    
    if(item.isComplete){
        
        return NO;
    }
    
    return YES;
}

- (void)onPanLeftAtCellIndex:(NSInteger)index{
    
    
    
    TaskItem *item = [dataArray objectAtIndex:index];
    
    if(item.isComplete){
        
        NSLog(@"recover at index %li", (long)index);
        
        item.isComplete = NO;
        
        [dataArray removeObjectAtIndex:index];
        
        [dataArray insertObject:item atIndex:0];
        
        TableViewCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        cell.isComplete = NO;
        
        [_tableView moveRowAtIndex:index toIndex:0];
    }
    else{
        
        NSLog(@"delete at index %li", (long)index);
        
        [dataArray removeObjectAtIndex:index];
        [_tableView deleteRowAtIndex:index withAnimation:UITableViewRowAnimationFade];
    }
    
}

- (void)onPanRightAtCellIndex:(NSInteger)index{
    
    NSLog(@"complete at index %li", (long)index);
    
    id obj = [dataArray objectAtIndex:index];
    ((TaskItem *)obj).isComplete = YES;
    [dataArray removeObjectAtIndex:index];
    [dataArray addObject:obj];
    
    TableViewCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    cell.isComplete = YES;
    
    
    [_tableView moveRowAtIndex:index toIndex:[dataArray count]-1];
    
}

#pragma mark - SingleTap delegate
- (void)onSingleTapAtCellIndex:(NSInteger)index{
    
    NSLog(@"on tap on index %li", (long)index);
}

#pragma mark - DoubleTap delegate
- (void)onDoubleTapAtCellIndex:(NSInteger)index{
    
    NSLog(@"on double tap on index %li", (long)index);
}

#pragma mark - LongPress delegate
- (void)onLongPressAtCellIndex:(NSInteger)index{
    
    NSLog(@"on long press on index %li", (long)index);
}

#pragma mark - LongPressMove delegate
- (BOOL)canMoveItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    TaskItem *fromItem = [dataArray objectAtIndex:fromIndex];
    TaskItem *toItem = [dataArray objectAtIndex:toIndex];
    
    if(fromItem.isComplete == toItem.isComplete)
        return YES;
    else
        return NO;
}

- (void)willMoveItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    [dataArray exchangeObjectAtIndex:toIndex withObjectAtIndex:fromIndex];
}

#pragma mark - PullDownAddNew delegate
- (void)addNewItemWithText:(NSString *)text{
    
    NSLog(@"add new item %@", text);
    [dataArray insertObject:[TaskItem newItemWithName:text] atIndex:0];
    
    [_tableView insertNewRowAtIndex:0 withAnimation:UITableViewRowAnimationTop];
}

#pragma mark - DoubleTapEdit delegate
- (BOOL)canStartEditAtIndex:(NSInteger)index{
    
    TaskItem *item = [dataArray objectAtIndex:index];
    
    return !item.isComplete;
}
- (NSString *)nameForItemAtIndex:(NSInteger)index{
    
    return ((TaskItem *)[dataArray objectAtIndex:index]).itemName;
}

- (void)onDoubleTapEditCompleteAtIndex:(NSInteger)index withItemName:(NSString *)name{
    
    TaskItem *item = [dataArray objectAtIndex:index];
    item.itemName = name;
    
    TableViewCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    
    cell.titleLabel.text = name;
}

@end
