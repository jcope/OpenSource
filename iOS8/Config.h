//
//  Config.h
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#ifndef iOS8_Config_h
#define iOS8_Config_h

//Screen Sizes
#define SCREEN_HEIGHT ([[ UIScreen mainScreen ] bounds ].size.height)
#define SCREEN_WIDTH ([[ UIScreen mainScreen ] bounds ].size.width)

//Device
#define IS_IPHONE35 ([[ UIScreen mainScreen ] bounds ].size.height < 568)
#define IS_IPHONE   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPAD     ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#endif
