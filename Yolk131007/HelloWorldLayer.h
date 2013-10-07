//
//  HelloWorldLayer.h
//  Yolk131003
//
//  Created by Sangwon Kim on 13. 10. 3..
//  Copyright Butfollow 2013년. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "AppDelegate.h"
#import "InventoryLayer.h"
#import "StatLayer.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

@property (nonatomic, retain) CCSprite *title; //로고
@property (nonatomic, retain) CCLabelTTF *havingYolk_lab; //현재 소유 노른자수 라벨
@property (nonatomic, retain) CCLabelTTF *yolkPerSec_lab; //초당 획득 노른자 수 라벨
@property (nonatomic, retain) CCSprite *yolk; //노른자

@property (nonatomic, retain) CCMenu *menu; //메뉴
@property (nonatomic, retain) CCMenuItemImage *inventory; //장비 목록 씬 가기
@property (nonatomic, retain) CCMenuItemImage *stat; //정보 씬 가기

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
