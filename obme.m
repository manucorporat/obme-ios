/*
 * OBME: OBfuscated MEmory
 *
 * Copyright (c) 2011-2013 FORZEFIELD Studios S.L.
 * Copyright (c) 2013 Manuel Martínez-Almeida
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import <Security/Security.h>
#include "obme.h"


obme_t* _OBME_MASK = NULL;

void obme_init(void)
{
    // Allocates the mask in the heap because of security reasons.
    size_t size = sizeof(obme_t);
    _OBME_MASK = malloc(size);
    *_OBME_MASK = 0;

    do {
        SecRandomCopyBytes(kSecRandomDefault, size, (uint8_t*)_OBME_MASK);
		// almost impossible, 5.42 * 10^-20
    } while(*_OBME_MASK == 0);
}

void obme_free(void)
{
    if(_OBME_MASK != NULL) {
        free(_OBME_MASK);
        _OBME_MASK = NULL;
    }
}
