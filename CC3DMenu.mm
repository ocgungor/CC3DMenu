//
//  Box.m
//  CC3DMenu
//
//  Created by Oguzhan Gungor on 8/05/13.
//  Copyright 2013 Aslan-Apps. All rights reserved.
//

#import "CC3DMenu.h"
#import "OpenGLCommon.h"
#import "Glu.h"

@interface CC3DMenu ()

- (CCTexture2D *) createTopTextureWithRed: (GLfloat)r andGreen: (GLfloat) g andBlue: (GLfloat) b andImageName:(NSString*) image;
- (CCTexture2D *) createSideTexture;
@end


@implementation CC3DMenu

+ threeDMenuWithSize:(Vector3D) asize andPosition:(Vector3D) aposition andCamera:(Vector3D) acamera andImageName:(NSString*) name {
    return [[[CC3DMenu alloc] initBoxWithSizeAndPosition:asize withPos:aposition withCam:acamera withImageName:name] autorelease];
}


-  initBoxWithSizeAndPosition: (Vector3D) asize withPos: (Vector3D) aposition withCam: (Vector3D) acamera withImageName: (NSString*) name
{
    if( (self=[super init])) {
        [self setPosition:aposition];
        [self setSize:asize];
        [self setCamera:acamera];
        
        [self setSelectedValue:false];
        
        [self setTop: [self createTopTextureWithRed:.0 andGreen:.4 andBlue:.9 andImageName:name] ];
        [self setTopSelected:  [self createTopTextureWithRed:1.0 andGreen:1.0 andBlue:.2 andImageName:name] ];
        [self setSide:[self createSideTexture]];
    }
    return self;
}

- (CCTexture2D *) createTopTextureWithRed: (GLfloat)r andGreen: (GLfloat) g andBlue: (GLfloat) b andImageName:(NSString*) image
{
    float textureSize = 256;
    
    
    CCRenderTexture *renderTexture = [CCRenderTexture renderTextureWithWidth:textureSize height:textureSize];
    [renderTexture beginWithClear:r g:g b:b a:1.0];
    
    NSString *file = [NSString stringWithFormat:@"%@.png", image];
        
    CCSprite *levelImage = [CCSprite spriteWithFile:file];
    [levelImage setBlendFunc:(ccBlendFunc){GL_ONE, GL_ONE_MINUS_SRC_ALPHA}];
    [levelImage setPosition:ccp(textureSize/2, textureSize/2)];
    [levelImage visit];
    
    CCSprite *frame = [CCSprite spriteWithFile:@"frame.png"];
    [frame setBlendFunc:(ccBlendFunc){GL_ONE, GL_ONE_MINUS_SRC_ALPHA}];
    [frame setPosition:ccp(textureSize/2, textureSize/2)];
    [frame visit];
    
    [renderTexture end];

    return renderTexture.sprite.texture;
}


- (CCTexture2D *) createSideTexture
{
    float textureSize = 256;
    
    CCRenderTexture *renderTexture = [CCRenderTexture renderTextureWithWidth:textureSize height:textureSize];
    [renderTexture beginWithClear:.6 g:.6 b:.6 a:1.0];

    CCSprite *pattern = [CCSprite spriteWithFile:@"metal.jpg"];
    [pattern setBlendFunc:(ccBlendFunc){GL_ONE, GL_ONE_MINUS_SRC_ALPHA}];
    [pattern setPosition:ccp(textureSize/2, textureSize/2)];
    [pattern visit];
    
    [renderTexture end];

    return renderTexture.sprite.texture;
}


- (void) setTop:(CCTexture2D*)texture;
{
    boxTop = [CCSprite spriteWithTexture:texture];

}

- (void) setSide:(CCTexture2D*)texture;
{
    boxSide = [CCSprite spriteWithTexture:texture];
}

- (void) setTopSelected:(CCTexture2D*)texture;
{
    boxTopSelected = [CCSprite spriteWithTexture:texture];
}

- (void) setPosition:(Vector3D)vector;
{
    position = vector;
}

- (void) setSize:(Vector3D)vector
{
    size = vector;
}

- (void) setCamera:(Vector3D)vector
{
    camera = vector;
}

- (void) setSelectedValue:(BOOL)value
{
    selected = value;
}

- (void) setHeight:(GLfloat)value
{
    size.z = value;
}

- (BOOL) getSelected
{
    return selected;
}

- (float) getHeight;
{
    return size.z;
}

- (Vector3D) getSize;
{
    return size;
}


- (CGPoint) getTopLeft;
{
    return screenTopLeft;
}

- (CGPoint) getBottomRight;
{
    return screenBottomRight;
}


- (void) draw
{
    
    GLfloat maxX = size.x / 2.0f;
    GLfloat minX = maxX * -1;
    
    GLfloat maxY = size.y / 2.0f;
    GLfloat miny = maxY * -1;
    
    const GLfloat frontVertices[] = {
		minX, miny, size.z,
        maxX, miny, size.z,
        minX, maxY, size.z,
        maxX, maxY, size.z,
	};
	const GLfloat backVertices[] = {
		minX, miny, 0.0f,
        minX, maxY, 0.0f,
        maxX, miny, 0.0f,
        maxX, maxY, 0.0f,
	};
	const GLfloat leftVertices[] = {
		minX, miny, size.z,
        minX, maxY, size.z,
        minX, miny, 0.0f,
        minX, maxY, 0.0f,
	};
	const GLfloat rightVertices[] = {
		maxX, miny, 0.0f,
        maxX, maxY, 0.0f,
        maxX, miny, size.z,
        maxX, maxY, size.z,
	};
	const GLfloat topVertices[] = {
		minX, maxY, size.z,
        maxX, maxY, size.z,
        minX, maxY, 0.0f,
        maxX, maxY, 0.0f,
	};
	const GLfloat bottomVertices[] = {
		minX, miny, size.z,
        minX, miny, 0.0f,
        maxX, miny, size.z,
        maxX, miny, 0.0f,
	};
    
    const GLfloat textureCoordinates[] = {
		0, 0,
        1, 0,
        0, 1,
        1, 1,
	};
	
	glEnableClientState(GL_COLOR_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnable(GL_TEXTURE_2D);
    
    
	glLoadIdentity();
    
    gluLookAt(camera.x, camera.y, camera.z, 0, 0, 0, 0, 1, 0); //OK
    
    
    GLfloat modelview[16];
    GLfloat projection[16];
    GLint viewport[4];
    
    glGetFloatv( GL_MODELVIEW_MATRIX, modelview );
    glGetFloatv( GL_PROJECTION_MATRIX, projection );
    glGetIntegerv( GL_VIEWPORT, viewport );
    
    
    float winZ;
    
    gluProject(frontVertices[6]+position.x, frontVertices[7]+position.y, frontVertices[8], modelview, projection, viewport, &screenTopLeft.x, &screenTopLeft.y, &winZ);
    gluProject(frontVertices[3]+position.x, frontVertices[4]+position.y, frontVertices[5], modelview, projection, viewport, &screenBottomRight.x, &screenBottomRight.y, &winZ);
    
	glTranslatef(position.x, position.y, position.z);
    
    
    //if(selected)
    //    glBindTexture(GL_TEXTURE_2D, boxTopSelected.texture.name);
    //else
      //  glBindTexture(GL_TEXTURE_2D, boxTop.texture.name);
        
    
    glTexCoordPointer(2, GL_FLOAT, 0,  textureCoordinates);
    
    glVertexPointer(3, GL_FLOAT, 0, frontVertices);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
    glBindTexture(GL_TEXTURE_2D, boxSide.texture.name);
    

    glTexCoordPointer(2, GL_FLOAT, 0,  textureCoordinates);
    
    glVertexPointer(3, GL_FLOAT, 0, backVertices);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
    
    glVertexPointer(3, GL_FLOAT, 0, leftVertices);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    glVertexPointer(3, GL_FLOAT, 0, rightVertices);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    glVertexPointer(3, GL_FLOAT, 0, topVertices);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    glVertexPointer(3, GL_FLOAT, 0, bottomVertices);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
	
	glEnableClientState(GL_COLOR_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnable(GL_TEXTURE_2D);  
    
}

@end
