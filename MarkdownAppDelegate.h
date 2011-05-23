//
//  MarkdownAppDelegate.h
//  Markdown
//
//  Created by Steven Wilkin on 23/05/2011.
//  Copyright 2011 NullTheory Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MarkdownAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
