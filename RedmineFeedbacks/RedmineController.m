//
//  RedmineController.m
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 15/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import "RedmineController.h"
#import "TBXML.h"

@implementation RedmineController

-(void)addIssueWithTitle:(NSString*)title Author:(NSString*)author AuthorMail:(NSString*)mail andDescription:(NSString*)desc toEndPoint:(NSURL*)endpoint
{
	host = [[NSString alloc] initWithString:[endpoint host]];
	issuetitle = [[NSString alloc] initWithString:title];
	
	NSString *msg = [NSString stringWithFormat:@"<?xml version=\"1.0\"?>\n<issue>\n<subject>%@</subject>\n<description>%@\n\nreported by %@ (%@)</description>\n</issue>",title,desc,author,mail];
		
	const char *bytes = [msg UTF8String];
	
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:endpoint];
	
	[request setValue:@"text/xml" forHTTPHeaderField:@"Content-type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[NSData dataWithBytes:bytes length:strlen(bytes)]];
	
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response 
{
	int status = [((NSHTTPURLResponse *)response) statusCode];
	if( status >= 400) {
		[connection cancel];
		
		if ( [delegate respondsToSelector:@selector(issueDidFailWithHTTPReturnCode:)] )
		{
			[delegate issueDidFailWithHTTPReturnCode:status];
		}
	}
	else
		connectionData = [[NSMutableData alloc] init];
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
	[connectionData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
	//do something with connectionData
	
	NSString *str = [[NSString alloc] initWithData:connectionData encoding:NSUTF8StringEncoding];
	
	TBXML * tbxml = [[TBXML tbxmlWithXMLString:str] retain];
		
	if ([[TBXML textForElement:[TBXML childElementNamed:@"subject" parentElement:tbxml.rootXMLElement]] isEqualToString:issuetitle]) {
		if ( [delegate respondsToSelector:@selector(issueDidSendWithID:)] )
		{
			[delegate issueDidSendWithID:[[TBXML textForElement:[TBXML childElementNamed:@"id" parentElement:tbxml.rootXMLElement]] intValue]];
		}
	}
	
	
	[tbxml release];
					 
	[str release];
	[connectionData release];
	
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"error : %@",error);
		
	[connectionData release];
}

- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
	return [protectionSpace.authenticationMethod
			isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	if ([challenge.protectionSpace.authenticationMethod
		 isEqualToString:NSURLAuthenticationMethodServerTrust])
	{
		// we only trust our own domain
		if ([challenge.protectionSpace.host isEqualToString:host])
		{
			NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
			[challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
		}
	}
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void) dealloc
{
	[host release];
	[issuetitle release];
	[super dealloc];
}


#pragma mark delegate getter and setter
- (void)setDelegate:(id)val
{
    delegate = val;
}

- (id)delegate
{
    return delegate;
}
#pragma mark -

@end
