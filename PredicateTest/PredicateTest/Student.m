//
//  Student.m
//  PredicateTest
//
//  Created by Tsz on 15/10/24.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "Student.h"

@implementation Student

//重写nslog的方法
- (NSString *)description {
    
    return  [NSString stringWithFormat:@"%@ - %@ - %d" ,_name ,_title , _age];
}
@end
