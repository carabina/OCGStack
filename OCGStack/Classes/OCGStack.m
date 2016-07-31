/*
 * OCGStack.h
 *
 * Created by Oguzhan Cansin Gungor on 31/07/16.
 *
 * Copyright (c) 2016 Aslan-Apps. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *       This product includes software developed by Aslan-Apps.
 * 4. The name of the author may not be used to endorse or promote
 *    products derived from this software without specific prior written
 *    permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "OCGStack.h"

@interface OCGStack()
@property (nonatomic) NSMutableArray *elements;
@end

@implementation OCGStack


+ (instancetype)stackWithObjects:(id)obj, ... {
    OCGStack *stack = [[self alloc] init];

    va_list ap;
    va_start(ap, obj);
    while (obj) {
        [stack.elements addObject: obj];
        obj = va_arg(ap, id);
    }
    va_end(ap);

    return stack;
}

- (instancetype)init {
    if (!(self = [super init]))
        return nil;
    if (!(self.elements = [NSMutableArray new])) {
        return nil;
    }
    return self;
}

- (void)pushObject:(id)object {
    [self.elements addObject:object];
}

- (id)popObject {
    id object = [self peekObject];
    [self.elements removeObjectAtIndex:self.elements.count - 1];
    return object;
}

- (id)peekObject {
    return self.elements[self.elements.count - 1];
}

- (void)swapTopMostObjects {
    NSUInteger count = self.elements.count;
    [self.elements exchangeObjectAtIndex:count-1 withObjectAtIndex:count-2];
}

- (BOOL)isEmpty {
    return self.elements.count == 0;
}

@end