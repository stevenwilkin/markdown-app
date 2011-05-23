//
//  MarkdownController.m
//  Markdown
//
//  Created by Steven Wilkin on 23/05/2011.
//  Copyright 2011 NullTheory Ltd. All rights reserved.
//

#import "MarkdownController.h"


@implementation MarkdownController

@synthesize textInput;
@synthesize htmlOutput;


- (IBAction)preview:(id)sender {
	// convert markdown to html and display it with the webview
	NSString *html = [MarkdownParser htmlFromMarkdown:[textInput string]];
	[[htmlOutput mainFrame] loadHTMLString:html baseURL:nil];
}

@end