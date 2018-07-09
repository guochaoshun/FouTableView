//
//  UIButton+BlockAction.h
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/21星期四.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^blockAction)(void);

@interface UIButton (BlockAction)

- (void)addBlockActionForControlEvents:(UIControlEvents)controlEvents withBlock:(blockAction)block ;

@end
