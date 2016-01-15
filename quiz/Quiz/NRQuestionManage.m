//
//  NRQuestionManage.m
//  Quiz
//
//  Created by User1 on 2014-06-09.
//  Copyright (c) 2014 CestarCollege. All rights reserved.
//

#import "NRQuestionManage.h"

@implementation NRQuestionManage


@synthesize  question,option1,option2,option3,optoin4,answer;


-(NRQuestionManage *) setData :(NSString*)que andop1 :(NSString*)op1 andop2 : (NSString*)op2 andop3 : (NSString*)op3 andop4 : (NSString*)op4 andans :(NSString*)ans
{
    NRQuestionManage *QuestM = [[NRQuestionManage alloc]init];
    
    QuestM.question = que;
    
    QuestM.option1 = op1;
    QuestM.option2 = op2;
    QuestM.option3 = op3;
    QuestM.optoin4 = op4;
    QuestM.answer = ans;
    
    return QuestM;
    
}

@end

