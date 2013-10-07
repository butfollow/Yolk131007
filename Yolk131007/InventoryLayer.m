//
//  InventoryLayer.m
//  Yolk131003
//
//  Created by Sangwon Kim on 13. 10. 4..
//  Copyright 2013년 Butfollow. All rights reserved.
//

#import "InventoryLayer.h"

#define SCREEN [[CCDirector sharedDirector] winSize]

@implementation InventoryLayer

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    
    InventoryLayer *layer = [InventoryLayer node];
    
    [scene addChild: layer];
    
    return scene;
}


-(id) init
{
    //전역변수 불러오기
    AppController *thisapp = [[UIApplication sharedApplication] delegate];
    
    if(self=[super initWithColor:ccc4(255, 255, 255, 255)]) {
        
        self.touchEnabled = YES;
        
        //현재 소유 노른자 수 라벨
        _havingYolk_lab = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%1.0f", thisapp.havingYolk] fontName:@"Arial" fontSize:32];
        [_havingYolk_lab setPosition:CGPointMake(100, 500)];
        [_havingYolk_lab setColor:ccBLACK];
        [self addChild:_havingYolk_lab];
        
        //현재 소유 노른자 수 갱신
        NSTimer *perSec = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(renewLabel) userInfo:nil repeats :true];
        
        
        //back 메뉴
        CCMenuItemLabel *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene]]];
        }];
        [back setColor:ccBLACK];
        CCMenu *backMenu;
        backMenu = [CCMenu menuWithItems:back, nil];
        [backMenu setPosition:CGPointMake(50, 50)];
        [self addChild:backMenu];
    }
    return self;
}

- (void) dealloc
{
    //[super dealloc];
}


//노른자 수 라벨 갱신
-(void)renewLabel
{
    //전역변수 불러오기
    AppController *thisapp = [[UIApplication sharedApplication] delegate];
    
    [_havingYolk_lab setString:[NSString stringWithFormat:@"%1.0f", thisapp.havingYolk]]; //현재 소유 노른자 수 라벨 갱신
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
