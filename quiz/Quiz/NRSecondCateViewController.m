//
//  NRSecondCateViewController.m
//  Quiz
//
//  Created by User1 on 2014-06-12.
//  Copyright (c) 2014 CestarCollege. All rights reserved.
//

#import "NRSecondCateViewController.h"

@interface NRSecondCateViewController ()
{
    NSMutableArray *newQAlist;
    int curQuest;
    NSMutableDictionary *savedQust;
    NSArray *Qkeys;
    NSMutableArray *questionNumbers;
    int result;
    NSUserDefaults *res;
}


@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UIButton *option1;

@property (weak, nonatomic) IBOutlet UIButton *option2;

@property (weak, nonatomic) IBOutlet UIButton *option3;

@property (weak, nonatomic) IBOutlet UIButton *option4;

- (IBAction)nextButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *resultButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


@end

@implementation NRSecondCateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    curQuest = 0;
    result = 0;
    
    // Do any additional setup after loading the view.
    newQAlist = [NSMutableArray array];
    
    
    NSString *plistDirectory = [[NSBundle mainBundle] pathForResource:@"SportData" ofType:@"plist"];
    
    savedQust = [[NSMutableDictionary alloc] initWithContentsOfFile: plistDirectory];
    Qkeys = [[savedQust allKeys]sortedArrayUsingSelector:@selector(compare:)];
    
    
    [self randomQuest];
    [self displayQuestion];

  
}

-(void) displayQuestion
{
    int number = [questionNumbers[curQuest] intValue];
    
    NSArray *quest = [savedQust objectForKey:Qkeys[number]];
    
    //   NRQuestionManage *curQue = newQAlist[curQuest];
    self.questionLabel.text = quest[0];
    [self.option1 setTitle:quest[1] forState:UIControlStateNormal];
    [self.option2 setTitle:quest[2] forState:UIControlStateNormal];
    [self.option3 setTitle:quest[3] forState:UIControlStateNormal];
    [self.option4 setTitle:quest[4] forState:UIControlStateNormal];
}


-(void)randomQuest
{
    questionNumbers = [NSMutableArray array];
    int i;
    while ([questionNumbers count] < 5) {
        i = arc4random() % 10;
        if (![questionNumbers containsObject:[NSNumber numberWithInt:i]]) {
            [questionNumbers addObject:[NSNumber  numberWithInt:i]];
        }
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)nextButton:(UIButton *)sender {
    curQuest++;
    [self displayQuestion];
    
    if(curQuest == 4)
    {
        self.nextButton.hidden = TRUE;
        
        self.resultButton.hidden = FALSE;
        
    }
    
}
- (IBAction)AnsClickButton:(UIButton *)sender {
    
    int number = [questionNumbers[curQuest] intValue];
    
    NSArray *quest = [savedQust objectForKey:Qkeys[number]];
    
    NSString *ans = quest[5];
    
    NSString *value = sender.currentTitle;
    
    if(value == ans)
    {
        result++;
        [[NSUserDefaults standardUserDefaults] setInteger:result forKey:@"userResult"];
        
        //[res setObject:result forKey:@"userResult"];
        
    }
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
