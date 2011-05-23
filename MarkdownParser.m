//
//  MarkdownParser.m
//  Markdown
//
//  Created by Steven Wilkin on 23/05/2011.
//  Copyright 2011 NullTheory Ltd. All rights reserved.
//

#import "MarkdownParser.h"


@implementation MarkdownParser

+ (NSString *)htmlFromMarkdown:(NSString *)input {

	const char * prose = [input UTF8String];  
	struct buf *ib, *ob;       

	int length = input.length + 1;

	ib = bufnew(length);
	bufgrow(ib, length);
	memcpy(ib->data, prose, length);
	ib->size = length;

	ob = bufnew(64);
	markdown(ob, ib, &mkd_xhtml);

	NSString *html = [NSString stringWithUTF8String: ob->data];

	bufrelease(ib);
	bufrelease(ob);
	
	return html;
}

@end