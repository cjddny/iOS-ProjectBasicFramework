//
//  AFURLConnectionOperation+RACSupport.m
//  Reactive AFNetworking Example
//
//  Created by Robert Widmann on 3/28/13.
//  Copyright (c) 2013 CodaFi. All rights reserved.
//

#import "AFURLConnectionOperation+RACSupport.h"
#import "AFHTTPRequestOperation.h"

@implementation AFURLConnectionOperation (RACSupport)

- (RACSignal *)rac_start {
	[self start];
	return [self rac_overrideHTTPCompletionBlock];
}

- (RACSignal *)rac_overrideHTTPCompletionBlock {
	RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
	[subject setNameWithFormat:@"-rac_start: %@", self.request.URL];
	
	if ([self respondsToSelector:@selector(setCompletionBlockWithSuccess:failure:)]) {
		
#ifdef RAFN_MAINTAIN_COMPLETION_BLOCKS
		void (^oldCompBlock)() = self.completionBlock;
#endif
		[(AFHTTPRequestOperation*)self setCompletionBlockWithSuccess:^(id operation, id responseObject)
          {
			[subject sendNext:responseObject];
			[subject sendCompleted];
#ifdef RAFN_MAINTAIN_COMPLETION_BLOCKS
			if (oldCompBlock) {
				oldCompBlock();
			}
#endif
		} failure:^(id operation, NSError *error)
        {
            AFHTTPRequestOperation *responesObj=(AFHTTPRequestOperation*)operation;
            
            if ([[[responesObj.responseObject objectForKey:@"error"] objectForKey:@"code"] isEqualToString:@"0x010103"])
            {
//                NSString *tt =[[responesObj.responseObject objectForKey:@"message"] objectForKey:@"descript"];
                
                [subject sendNext:responesObj.responseObject];
                [subject sendCompleted];
                return ;
            }
            
            NSError *errorNew;
            if (responesObj.responseObject)
            {
                NSInteger code =[responesObj.responseObject[@"code"] integerValue];
                NSString *messageInfo=responesObj.responseObject[@"message"];
                errorNew = [NSError errorWithDomain:@"SeverResponseObject" code:code userInfo:@{@"message": messageInfo}];
            }else
            {
                errorNew=error;
            }
            
            
			[subject sendError:errorNew];
#ifdef RAFN_MAINTAIN_COMPLETION_BLOCKS
			if (oldCompBlock) {
				oldCompBlock();
			}
#endif
		}];
		
		return subject;
	}
	
	return subject;
}


@end
