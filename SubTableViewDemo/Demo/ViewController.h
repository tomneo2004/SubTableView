//
//  ViewController.h
//  SubTableView
//
//  Created by User on 26/10/15.
//  Copyright © 2015 ArcTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentTableView.h"
#import "PanLeftRight.h"
#import "SingleTap.h"
#import "DoubleTap.h"
#import "DoubleTapEdit.h"
#import "LongPress.h"
#import "PullDownAddNew.h"

@interface ViewController : UIViewController<ParentTableViewDelegate, PanLeftRightDelegate, SingleTapDelegate, DoubleTapDelegate, LongPressDelegate, PullDownAddNewDelegate, DoubleTapEditDelegate>


@end

