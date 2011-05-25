//
//  MarkdownController.m
//  Markdown
//
//  Created by Steven Wilkin on 23/05/2011.
//  Copyright 2011 NullTheory Ltd. All rights reserved.
//

#import "MarkdownController.h"


@implementation MarkdownController

@synthesize timer;
@synthesize textInput;
@synthesize htmlOutput;


/**
 * Convert markdown to html and display it with the webview
 */
- (void)preview { 
	NSString *html = [MarkdownParser htmlFromMarkdown:[textInput string]];
	[[htmlOutput mainFrame] loadHTMLString:html baseURL:nil];
}


#pragma mark Event handlers

/**
 * Call preview when the timer fires
 */
- (void)fireTimer:(NSTimer *)aTimer {
	[self preview];
	self.timer = nil;
}


/**
 * Delegate method called when text contents have been changed
 */
- (void)textDidChange:(NSNotification *)notification {
	
	// update the preview *after* the user has stopped changing the contents of
	// the text	so cancel the timer if it is set
	if((self.timer != nil) && [self.timer isValid]) {
		[self.timer invalidate];
		self.timer = nil;
	}
	
	// update the html preview after a delay
	self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
		target: self
		selector: @selector(fireTimer:)
		userInfo: nil
		repeats: NO];
}

@end