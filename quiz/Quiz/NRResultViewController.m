//
//  NRResultViewController.m
//  Quiz
//
//  Created by User1 on 2014-06-10.
//  Copyright (c) 2014 CestarCollege. All rights reserved.
//

#import "NRResultViewController.h"

@interface NRResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *tryButton;
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation NRResultViewController

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
    // Do any additional setup after loading the view.
    NSInteger B = [[NSUserDefaults standardUserDefaults] integerForKey:@"userResult"];
    
    NSString *string1 = [NSString stringWithFormat:@"Your Score: %i", B];
    self.scoreLabel.text = string1;
    
    if(B <=2){
        self.resultLabel.text = @"Please try again!";
        self.tryButton.hidden = FALSE;
        self.exitButton.hidden = TRUE;
    }else if(B == 3){
        self.resultLabel.text = @"Good job!";
    }
    else if(B == 4){
        self.resultLabel.text = @"Excellent work!";
    }
    else if(B == 5){
        self.resultLabel.text = @"You are a genius!";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)exitButton:(id)sender {
    
    exit(0);
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
