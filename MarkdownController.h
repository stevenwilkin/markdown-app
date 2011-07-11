//
//  MarkdownController.h
//  Markdown
//
//  Created by Steven Wilkin on 23/05/2011.
//  Copyright 2011 NullTheory Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

#import "MarkdownParser.h"

@interface MarkdownController : NSObject {
	
	NSTimer *timer;
	NSPoint scrollPoint;
	IBOutlet NSTextView *textInput;
	IBOutlet WebView *htmlOutput;
	IBOutlet NSView *urlView;
	IBOutlet NSTextField *urlLabel;

}

@property (assign) NSTimer *timer;
@property (assign) IBOutlet NSTextView *textInput;
@property (assign) IBOutlet WebView *htmlOutput;

@property (assign) NSTimer *urlTimer;
@property (assign) IBOutlet NSView *urlView;
@property (assign) IBOutlet NSTextField *urlLabel;

- (void)preview;
- (void)fireTimer:(NSTimer *)aTimer;
- (void)textDidChange:(NSNotification *)notification;

@end