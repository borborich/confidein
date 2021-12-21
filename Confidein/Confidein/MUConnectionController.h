//
//  MUConnectionController.h
//  Confidein
//
//  Created by Shestakov Boris on 13/12/21.
//

extern NSString *MUConnectionOpenedNotification;
extern NSString *MUConnectionClosedNotification;

@interface MUConnectionController : NSObject
+ (MUConnectionController *) sharedController;
- (void) connetToHostname:(NSString *)hostName port:(NSUInteger)port withUsername:(NSString *)userName andPassword:(NSString *)password;
- (BOOL) isConnected;
- (void) disconnectFromServer;
@end
