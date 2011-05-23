//
//  MarkdownParser.h
//  Markdown
//
//  Created by Steven Wilkin on 23/05/2011.
//  Copyright 2011 NullTheory Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// following 4 files comprise libupskirt v1.1
// http://fossil.instinctive.eu/libupskirt/index

#import "markdown.h"
#import "renderers.h"
#import "buffer.h"
#import "array.h"

@interface MarkdownParser : NSObject {

}

+ (NSString *)htmlFromMarkdown:(NSString *)input;

@end