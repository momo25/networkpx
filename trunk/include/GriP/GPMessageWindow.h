/*

GPMessageWindow.h ... Message Window for typical GriP styles.
 
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

#import <UIKit/UIKit.h>

typedef struct GPGap {
	CGFloat y;
	CGFloat h;
} GPGap;


@interface GPMessageWindow : UIWindow {
	GPGap currentGap;
	NSTimer* hideTimer;
	UIView* view;
	BOOL sticky;
	NSString* pid;
	NSObject* context;
	BOOL isURL;
}
+(GPMessageWindow*)windowWithView:(UIView*)view_ message:(NSDictionary*)message;
-(void)layoutSubviews;	// in additional to resizing the subviews, this method will also adopt the subview's boundary.

@property(retain,readonly) NSString* pid;
@property(retain,readonly) NSObject* context;

-(void)hide:(BOOL)ignored;

-(void)stopTimer;
-(void)restartTimer;
-(void)dealloc;
@end

@interface GPMessageWindow ()
+(void)_initialize;
+(void)_cleanup;

-(id)initWithView:(UIView*)view_ message:(NSDictionary*)message;
+(void)_removeGap:(GPGap)gap;
+(GPGap)_createGapWithHeight:(CGFloat)height;
-(void)_layoutWithAnimation:(BOOL)animate;
-(void)_releaseMyself;
@end