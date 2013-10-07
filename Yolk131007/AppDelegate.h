//
//  AppDelegate.h
//  Yolk131003
//
//  Created by Sangwon Kim on 13. 10. 3..
//  Copyright Butfollow 2013년. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"

// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;

//---전역 변수---//
@property (nonatomic) float havingYolk; //현재 소유 노른자 수
@property (nonatomic) float yolkPerSec; //초당 획득 노른자 수
@property (nonatomic) int yolkPerTouch; //터치당 획득 노른자 수

@end
