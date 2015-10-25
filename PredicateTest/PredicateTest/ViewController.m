//
//  ViewController.m
//  PredicateTest
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *names = @[@"jack"  , @"tom" , @"rose"];
    
    NSArray *titles = @[@"yuwen" ,  @"shuxue" , @"wuli"];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (int i = 0 ; i < 20; i++) {
        Student *stu = [[Student alloc]init];
        
        stu.name = names[arc4random_uniform(3)];
        stu.title = titles[arc4random_uniform(3)];
        
        stu.age = 18 + arc4random_uniform(20);
        
        [arrM addObject:stu];
    }
    
//    NSLog(@"%@" , arrM);
    
    // 需求，过滤出数组中，包含 人名 `jack` 年龄 > 30 title `yuwen`
    // 谓词
    // 注意：key 也可以传值，但是需要用 %K
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS %@ AND age > 20 AND title CONTAINS 'yuwen'" , @"name" , @"jack"];
    
    NSArray *result = [arrM  filteredArrayUsingPredicate:predicate];
    
    NSLog(@"%@" , result);
    
    //调用谓词的 evaluateWithObject 方法判断指定条件是否满足
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BOOL flag = [self isCharWithString:@"[A-Za-z]+"];
    
    NSLog(@" ----%d" , flag);

}

//在练习一个实例
- (void) predicateDemo {
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (int i = 0 ; i < 50; i++) {
        [arrM addObject:[NSString stringWithFormat:@"tsz - %05d" , arc4random_uniform(100000)]];
    }
    
    //过滤出数组中包含88 的人名 tsz
    
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"self CONTAINS '888'"];

    NSArray *result = [arrM filteredArrayUsingPredicate:pre];
    
    NSLog(@"%@" , result);
    
}

#pragma 判断字符串首字母是否为字母
- (BOOL)isCharWithString:(NSString *) str{
    
//    NSString *string = @"[Aw121233@]";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , str];
    
    if ([predicate evaluateWithObject:@"hu"]) {
        
        return  true;
    }
    return  false;
}

@end
