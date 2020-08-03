//
//  ObjectiveCTestController.m
//  Demo
//
//  Created by Chandresh on 3/8/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

#import "ObjectiveCTestController.h"

@interface ObjectiveCTestController ()

@end

@implementation ObjectiveCTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSArray *) getMinimumDifference:(NSArray *)a b:(NSArray *)b {
    // Write your code here
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0; i < a.count; i++) {
        NSString *str = [[NSString alloc] initWithFormat:@"%d",[self PrepareForArragrams:[a objectAtIndex:i] SecondString:[b objectAtIndex:i]]];
        [result addObject: str];
    }
    return result;
}
-(int)PrepareForArragrams:(NSString *)a SecondString:(NSString *)b {
    if (a.length != b.length) {
        return  -1;
    } else if (a == b) {
        return 0;
    }
    NSCountedSet *aSet = [[NSCountedSet alloc] init];
    NSCountedSet *bSet = [[NSCountedSet alloc] init];
    NSCountedSet *CSet = [[NSCountedSet alloc] init];
    
    for (int i = 0; i < a.length; i++) {
        [aSet addObject:[NSString stringWithFormat:@"%c",[a characterAtIndex:i]]];
        [CSet addObject:[NSString stringWithFormat:@"%c",[a characterAtIndex:i]]];
    }
    
    for (int i = 0; i < b.length; i++) {
        [bSet addObject:[NSString stringWithFormat:@"%c",[b characterAtIndex:i]]];
    }
    
     [aSet minusSet:bSet];
     [bSet minusSet:CSet];
    int result = 0;
    NSArray *array = [bSet allObjects];
    for (int i = 0; i < array.count; i++) {
        result += [bSet countForObject:[array objectAtIndex:i]];
    }
    return  result;
}
@end

