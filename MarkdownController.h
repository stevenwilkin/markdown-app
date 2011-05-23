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

	IBOutlet NSTextView *textInput;
	IBOutlet WebView *htmlOutput;

}

@property (assign) IBOutlet NSTextView *textInput;
@property (assign) IBOutlet WebView *htmlOutput;

- (IBAction)preview:(id)sender;

@end