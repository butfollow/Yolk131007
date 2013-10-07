//
//  InventoryLayer.h
//  Yolk131003
//
//  Created by Sangwon Kim on 13. 10. 4..
//  Copyright 2013년 Butfollow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "AppDelegate.h"
#import "HelloWorldLayer.h"

@interface InventoryLayer : CCLayerColor <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    
}

@property (nonatomic, retain) CCLabelTTF *havingYolk_lab; //현재 소유 노른자수 라벨

+(CCScene *) scene;

@end
