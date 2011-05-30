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

	// preserve scrolled-to position of webview
	NSView *docView = [[[htmlOutput mainFrame] frameView] documentView];
	NSRect bounds = [docView bounds];			// positon/size of full html content
	NSRect visibleRect = [docView visibleRect];	// position/size of visible html content
	
	// TODO: take into consideration x co-ord of visibleRect?
	if(NSMaxY(bounds) <= NSMaxY(visibleRect)) {
		// webview either doesn't need scrollbars or has been scrolled to the bottom
		float y;
		if(visibleRect.origin.y == 0) {	// no scrollbars
			y = 0;
		} else {	// scrolled to bottom
			y = CGFLOAT_MAX;
		}
		scrollPoint = NSMakePoint(visibleRect.origin.x, y);
	} else {
		// just use existing position
		scrollPoint = visibleRect.origin;
	}

	// set the webview content
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


/**
 * Delegate method called when contents of webview have finished loading
 *
 * Restore previous scrolled-to position
 */
- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
	NSView *docView = [[[htmlOutput mainFrame] frameView] documentView];
	[docView scrollPoint:scrollPoint];
}


/**
 * Disable webview context menu via WebUIDelegate protocol method
 */
- (NSArray *)webView:(WebView *)sender contextMenuItemsForElement:(NSDictionary *)element 
    defaultMenuItems:(NSArray *)defaultMenuItems {
    // disable right-click context menu
    return nil;
}


/**
 * Prevent any action as a result of clicking on links in rendered html via WebFrameLoadDelegate protocol method
 */
- (void)webView:(WebView *)webView decidePolicyForNavigationAction:(NSDictionary *)actionInformation
	request:(NSURLRequest *)request frame:(WebFrame *)frame
	decisionListener:(id < WebPolicyDecisionListener >)listener {

	if([[[request URL] absoluteString] isEqualToString:@"about:blank"]) {
		[listener use];
	} else {
		[listener ignore];
	}
}

@end