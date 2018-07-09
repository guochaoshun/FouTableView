//
//  UIButton+BlockAction.m
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/21星期四.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "UIButton+BlockAction.h"
#import <objc/runtime.h>

@interface UIButton ()
@property(nonatomic,copy) blockAction block ;
@end


@implementation UIButton (BlockAction)

- (void)addBlockActionForControlEvents:(UIControlEvents)controlEvents withBlock:(blockAction)block {
    
    self.block = block ;
    [self addTarget:self action:@selector(gcs_blockAction) forControlEvents:controlEvents];
    
    
}


- (void)gcs_blockAction {
    
    if (self.block) {
        self.block();
    }
    
}

- (void)setBlock:(blockAction)block {
    objc_setAssociatedObject(self, @"gcs_block", block , OBJC_ASSOCIATION_COPY_NONATOMIC) ;

}
- (blockAction)block {
    return  objc_getAssociatedObject(self, @"gcs_block") ;

}








@end
