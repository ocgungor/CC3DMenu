//
//  Box.h
//  CC3DMenu
//
//  Created by Oguzhan Gungor on 8/05/13.
//  Copyright 2013 Aslan-Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#include "cocos2d.h"
#include "OpenGLCommon.h"

@interface CC3DMenu : CCNode {
    Vector3D position;
    Vector3D size;
    Vector3D camera;
    
    CCSprite* boxTop;
    CCSprite* boxTopSelected;
    CCSprite* boxSide;
    
    CGPoint screenTopLeft;
    CGPoint screenBottomRight;
    BOOL selected;

}

+ threeDMenuWithSize:(Vector3D) asize andPosition:(Vector3D) aposition andCamera:(Vector3D) acamera andImageName:(NSString*) name;

- initBoxWithSizeAndPosition: (Vector3D) asize withPos: (Vector3D) aposition withCam: (Vector3D) acamera withImageName: (NSString*) name;

- (void) draw;

- (void) setPosition:(Vector3D)vector;
- (void) setSize:(Vector3D)vector;
- (void) setCamera:(Vector3D)vector;

- (void) setTop:(CCTexture2D*)texture;
- (void) setSide:(CCTexture2D*)texture;
- (void) setTopSelected:(CCTexture2D*)texture;

- (void) setSelectedValue:(BOOL)value;
- (void) setHeight:(GLfloat)value;



- (Vector3D) getSize;
- (float) getHeight;
- (BOOL) getSelected;
- (CGPoint) getTopLeft;
- (CGPoint) getBottomRight;





@end
