//
//  ViewController.m
//  线程状态了解
//
//  Created by YiGuo on 2017/10/18.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

-(void)run{
    NSLog(@"-------");
    //    [NSThread sleepForTimeInterval:2]; // 让线程睡眠2秒（阻塞2秒）
    //未来的某个时间
    //    [NSThread sleepUntilDate:[NSDate distantFuture]];
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    NSLog(@"-------");
}
//强制退出
-(void)run2{
    for (NSInteger i = 0; i<100; i++) {
        NSLog(@"-----%zd", i);
        
        if (i == 49) {
//            break;
            //直接退出线程
            [NSThread exit];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
