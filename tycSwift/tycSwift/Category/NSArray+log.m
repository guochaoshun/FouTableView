//
//  NSArray+log.m
//  demo1
//
//  Created by ly on 16/9/1.
//  Copyright © 2016年 ly. All rights reserved.
//

#import "NSArray+log.h"

/**
 *  集合类型打log
 */
@implementation NSArray (log)

- (NSString *)description{
    return [self descriptionWithLocale:nil];
}

- (NSString *)descriptionWithLocale:(id)locale{
    NSMutableString * string = [[NSMutableString alloc]init];
    [string appendString:@"[\n"];
    for (int i = 0; i < self.count; i++) {
        [string appendFormat:@"\t第%d个 -- %@ \n",i,self[i] ];
    }
    [string stringByAppendingString:@"]\n"];
    
    return string;

}


@end



@implementation NSDictionary (Log)

- (NSString *)jsonDescription {
    // 参考了此博客 https://www.jianshu.com/p/f14b4cb1435b .
    // NSString默认使用的是UTF-16,转出UTF-8就能打印了
    NSError * error = nil ;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    if (error) {
        NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [strM appendFormat:@"\t%@ = %@ ;\n", key, obj];
        }];
        [strM appendString:@"}\n"];
        return strM;
        
    }
    
    NSString *newString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    newString = [newString stringByReplacingOccurrencesOfString:@"\\" withString:@""] ;
    return newString ;
}

- (NSString *)description{
    return [self descriptionWithLocale:nil];
}

- (NSString *)descriptionWithLocale:(id)locale
{

    return [self jsonDescription];
    // 原来的写法,格式上有点问题,但是转中文是没问题的
//    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
//
//    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        [strM appendFormat:@"\t%@ = %@ ;\n", key, obj];
//    }];
//
//    [strM appendString:@"}\n"];
//
//    return strM;
}

@end


