#import <Foundation/Foundation.h>
#import "/Users/Daniel/Dropbox/Projects/Hacks/Boop/osx/Boop/vendor/Pods/Headers/libqrencode/qrencode.h"

@interface QRGen: NSObject

+ (NSImage *)quickResponseImageForString:(NSString *)dataString withDimension:(NSNumber *)dimension;

@end