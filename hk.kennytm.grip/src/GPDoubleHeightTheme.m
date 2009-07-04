/*

FILE_NAME ... DESCRIPTION
 
Copyright (c) 2009, KennyTM~
All rights reserved.
 
Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, 
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 * Neither the name of the KennyTM~ nor the names of its contributors may be
   used to endorse or promote products derived from this software without
   specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
*/

#import <GriP/GPRawThemeHelper.h>
#import <Foundation/Foundation.h>
#import <GriP/common.h>
#import <UIKit/UIKit.h>
#import <UIKit3/UIUtilities.h>

__attribute__((visibility("hidden")))
@interface SBStatusBarController : NSObject
+(SBStatusBarController*)sharedStatusBarController;
@property(retain) NSString* customText;
@property(assign) BOOL isInWorkOut;
@property(readonly) UIWindow* statusBarWindow;
@end


@interface GPDoubleHeightTheme : NSObject {
	GPRawThemeHelper* helper;
	int i;
}
-(id)initWithBundle:(NSBundle*)bundle;
-(void)display:(NSDictionary*)message;
@end
@implementation GPDoubleHeightTheme
-(id)initWithBundle:(NSBundle*)bundle {
	if ((self = [super init])) {
		// helper = [[GPRawThemeHelper alloc] init];
	}
	return self;
}
-(void)dealloc {
	// [helper release];
	[super dealloc];
}
-(void)display:(NSDictionary*)message {
	SBStatusBarController* ctrler = [objc_getClass("SBStatusBarController") sharedStatusBarController];
	ctrler.isInWorkOut = !ctrler.isInWorkOut;
	UILogViewHierarchy(ctrler.statusBarWindow);
	// ctrler.customText = [message objectForKey:GRIP_TITLE];
}
@end
