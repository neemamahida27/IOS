//
//  NRQuestionManage.h
//  Quiz
//
//  Created by User1 on 2014-06-09.
//  Copyright (c) 2014 CestarCollege. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRQuestionManage : NSObject

@property NSString *question,*option1,*option2,*option3,*optoin4,*answer;

-(NRQuestionManage *) setData :(NSString*)que andop1 :(NSString*)op1 andop2 : (NSString*)op2 andop3 : (NSString*)op3 andop4 : (NSString*)op4 andans :(NSString*)ans ;

@end