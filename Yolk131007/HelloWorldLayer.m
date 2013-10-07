//
//  HelloWorldLayer.m
//  Yolk131003
//
//  Created by Sangwon Kim on 13. 10. 3..
//  Copyright Butfollow 2013년. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    //전역변수 불러오기
    AppController *thisapp = [[UIApplication sharedApplication] delegate];
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if(self=[super initWithColor:ccc4(255, 255, 255, 255)]) {
        
        self.touchEnabled = YES;
        

        //현재 소유 노른자 수 라벨
        _havingYolk_lab = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%1.0f", thisapp.havingYolk] fontName:@"Arial" fontSize:32];
        [_havingYolk_lab setPosition:CGPointMake(160, 500)];
        [_havingYolk_lab setColor:ccBLACK];
        [self addChild:_havingYolk_lab];
        
        //현재 소유 노른자 수 갱신
        NSTimer *perSec = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(renewLabel) userInfo:nil repeats:true];
        
        //초당 노른자 수 라벨
        _yolkPerSec_lab = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%1.1f", thisapp.yolkPerSec] fontName:@"Arial" fontSize:32];
        [_yolkPerSec_lab setPosition:CGPointMake(160, 450)];
        [_yolkPerSec_lab setColor:ccBLACK];
        [self addChild:_yolkPerSec_lab];
        
        //노른자 스프라이트
        _yolk = [CCSprite spriteWithFile:@"yolk.png"];
        [_yolk setPosition:CGPointMake(160, 284)];
        [self addChild:_yolk];
        
        
        //--메뉴--//
        //장비 씬 가기
        _inventory = [CCMenuItemFont itemWithString:@"Inventory" target:self selector:@selector(goToInventory:)];
        [_inventory setColor:ccBLACK];
        
        //정보 씬 가기
        _stat = [CCMenuItemFont itemWithString:@"Stat" target:self selector:@selector(goToStat:)];
        [_stat setColor:ccBLACK];
        
        _menu = [CCMenu menuWithItems:_inventory, _stat, nil];
        [_menu alignItemsHorizontally];
        [_menu setPosition:CGPointMake(160, 50)];
        [self addChild:_menu];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	//[super dealloc];
}

//노른자 수 라벨 갱신
-(void)renewLabel
{
    //전역변수 불러오기
    AppController *thisapp = [[UIApplication sharedApplication] delegate];
    
    [_havingYolk_lab setString:[NSString stringWithFormat:@"%1.0f", thisapp.havingYolk]]; //현재 소유 노른자 수 라벨 갱신
}

//스프라이트 내부 값 터치 여부
- (BOOL)isHitWithTarget:(CCSprite *)target touchPoint:(CGPoint)touchPoint {
    
    // target과 touchPoint 간의 거리가 (target의 크기/2) 이면 터치한 것으로 판단하여 YES 값을 반환합니다.
    if(ccpDistance(target.position, touchPoint) < target.contentSize.width /2) return YES;
    
    // 그렇지 않다면 NO 값을 반환합니다.
    return NO;
}

//터치 이벤트
-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //전역변수 불러오기
    AppController *thisapp = [[UIApplication sharedApplication] delegate];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [self convertTouchToNodeSpace:touch];
    
    //노른자 스프라이트 터치
    if ([self isHitWithTarget:_yolk touchPoint:point])
    {
        thisapp.havingYolk += 1; //현재 소유 노른자 수 1증가
        [_havingYolk_lab setString:[NSString stringWithFormat:@"%1.0f", thisapp.havingYolk]]; //현재 소유 노른자 수 라벨 갱신
    }
    
}

//---메뉴 이동 함수---//
//인벤토리 이동
-(void)goToInventory: (CCMenuItem  *) menuItem
{
    CCDirector *director;
    director = [CCDirector sharedDirector];
    [director replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[InventoryLayer scene]]];
}
//정보 이동
-(void)goToStat: (CCMenuItem  *) menuItem
{
    CCDirector *director;
    director = [CCDirector sharedDirector];
    [director replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StatLayer scene]]];
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
