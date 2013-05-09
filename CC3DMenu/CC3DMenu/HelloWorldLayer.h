//
//  HelloWorldLayer.h
//  CC3DMenu
//
//  Created by Oguzhan Gungor on 9/05/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "CC3DMenu.h"
#include <math.h>
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    NSMutableSet *set;
    Vector3D cameraAngle;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
