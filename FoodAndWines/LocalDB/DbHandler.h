//
//  DbHandler.h
//  Bible
//
//  Created by MaDdy on 19/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define DbName @"dbsonomaracquets.sqlite"

@interface DbHandler : NSObject {
    
}


+(void)createEditableCopyOfDatabaseIfNeeded;
+(NSString *) dataFilePath:(NSString *)path;
+(void)openDatabase;
+(BOOL)deletenotification:(NSString *)rid;
+(void)closeDatabase;
+(BOOL)isDatabaseOpened;
+(NSMutableArray *)fetchnotification;
+(BOOL)deleteDatafromtable:(NSString *)query;
+(NSMutableArray *)Fetchtempuserdetail;
+(BOOL)Insertuser:(NSString *)_memberid membertype:(NSString *)_membertype  username:(NSString *)_username email:(NSString *)_email phone:(NSString *)_phone password:(NSString *)_password token:(NSString *)_token profilepicture:(NSString *)_profilepicture;
+(NSString *)checkuserexist;
+(NSString *)checkusertype;
+(NSMutableArray *)Fetchusertoken;
+(BOOL)Insertnotification:(NSString *)_propertyname priority:(int)_priority  title:(NSString *)_title type:(int )_type typename:(NSString *)_typename mid:(int)_mid  name:(NSString *)_name houseno:(NSString *)_houseno email:(NSString *)_email mobile:(NSString *)_mobile message:(NSString *)_message;
+(NSString *)GetId:(NSString *)strqry;
+(NSMutableArray *)Fetchuserdetail;
+(BOOL)updateuseremail:(NSString *)_userid  email:(NSString *)_email;
+(BOOL)updatepassword:(NSString *)userid password:(NSString *)_password;
+(BOOL)updateuserimage:(NSString *)_userid  image:(NSString *)_image;
+(BOOL)Inserttempuser:(NSString *)_username email:(NSString *)_email phone:(NSString *)_phone password:(NSString *)_password firstname:(NSString *)_firstname middlename:(NSString *)_middlename lastname:(NSString *)_lastname;
+(BOOL)updateusertype:(NSString *)_userid  utype:(NSString *)_utype;
+(BOOL)updatetemptable:(NSString *)streetno streetname:(NSString *)_streetname ste:(NSString *)_ste state:(NSString *)_state city:(NSString *)_city zipcode:(NSString *)_zipcode;
+(BOOL)updateuseraddress:(NSString *)streetno streetname:(NSString *)_streetname ste:(NSString *)_ste state:(NSString *)_state city:(NSString *)_city zipcode:(NSString *)_zipcode;
+(NSString *)getstringvalue:(NSString *)strqry;
+(BOOL)updatejobstatus:(NSString *)userid jobstatus:(NSString *)_jobstatus;
+(BOOL)Insertlocation:(NSString *)_lat lng:(NSString *)_lng datetime:(NSString *)_datetime;
@end
