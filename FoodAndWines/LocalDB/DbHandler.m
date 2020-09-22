//
//  DbHandler.m
//  Bible
//
//  Created by MaDdy on 19/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DbHandler.h"



@implementation DbHandler

static sqlite3 *database = nil;

#pragma mark - DB Setup Functions -

+(void)createEditableCopyOfDatabaseIfNeeded {
    // First, test for existence.
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"see >>>%@",[paths objectAtIndex:0]);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:DbName];
    NSLog(@"%@",writableDBPath);
    success = [fileManager fileExistsAtPath:writableDBPath];
     if (success) {
		NSLog(@"Database file already exist, so returning...");
        [DbHandler openDatabase];
		return;
	}
    
	NSLog(@"CREATING A NEW COPY OF THE DATABASE...");
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DbName];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
		//Some serious problem...
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
    [DbHandler openDatabase];
}

+(NSString *) dataFilePath:(NSString *)path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:path];
}

+(NSString *)GetId:(NSString *)strqry
{
    NSString *result2;
    
    if (database != nil)
    {
        NSString *selectSql =strqry;
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                result2=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    else
    {
        NSLog(@"Database not opening");
    }
    
    return result2 ;
}

+(NSString *)getstringvalue:(NSString *)strqry
{
    NSString *result2;
    
    if (database != nil)
    {
        NSString *selectSql =strqry;
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                result2=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    else
    {
        NSLog(@"Database not opening");
    }
    
    return result2 ;
}


+(void)openDatabase
{
	NSString *dbpath = [DbHandler dataFilePath:DbName];
    
	if (sqlite3_open([dbpath UTF8String], &database) == SQLITE_OK)
	{
        NSLog(@"Databse opened");
    }
}
+(void)closeDatabase
{
    sqlite3_close(database);
}
+(BOOL)isDatabaseOpened
{
    return (database != nil);
}

+(NSMutableArray *)FetchCountry
{
    NSMutableArray *result2=[[NSMutableArray alloc] init];
    
    if (database != nil)
    {
        NSString *selectSql =[NSString stringWithFormat:@"SELECT country_name from countrymaster"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                NSString *winetype=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                
                [result2 addObject:[NSString stringWithFormat:@"%@", winetype]];
                
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    else
    {
        NSLog(@"Database not opening");
    }
    NSLog(@"%d",[result2 count]);
    
    return result2 ;
}


+(BOOL)deleteDatafromtable:(NSString *)query
{
    BOOL  result = NO;
    if (database != nil)
    {
        NSString *selectSql = query;
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                NSLog(@"Data deleted from table");
                result = YES;
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
        
    }
    else
    {
        NSLog(@"Database not opening");
    }
    return result;
}




+(BOOL)Insertnotification:(NSString *)_propertyname priority:(int)_priority  title:(NSString *)_title type:(int )_type typename:(NSString *)_typename mid:(int)_mid  name:(NSString *)_name houseno:(NSString *)_houseno email:(NSString *)_email mobile:(NSString *)_mobile message:(NSString *)_message

{
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql = [NSString stringWithFormat:@"INSERT INTO tblnotification(propertyname,priority,title,type,typename,mid,name,houseno,email,mobile,message)values('%@','%d','%@','%d','%@','%d','%@','%@','%@','%@','%@')",_propertyname,_priority,_title,_type,_typename,_mid,_name,_houseno,_email,_mobile,_message];
        
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"notification inserted successful");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}
+(BOOL)deletenotification:(NSString *)rid
{
    BOOL  result = NO;
    if (database != nil)
    {
        NSString *selectSql = [NSString stringWithFormat:@"delete from tblnotification where id ='%@'",rid];
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                NSLog(@"Data deleted from table");
                result = YES;
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
        
    }
    else
    {
        NSLog(@"Database not opening");
    }
    return result;
}
+(BOOL)Insertuser:(NSString *)_memberid membertype:(NSString *)_membertype  username:(NSString *)_username email:(NSString *)_email phone:(NSString *)_phone password:(NSString *)_password token:(NSString *)_token profilepicture:(NSString *)_profilepicture

{
    
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql = [NSString stringWithFormat:@"INSERT INTO tbluser (memberid, membertype, username, email,phone,password,token,profilepicture)values('%@','%@','%@','%@','%@','%@','%@','%@')", _memberid,_membertype,_username,_email,_phone,_password,_token,_profilepicture];
        
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"user inserted successful");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}

// insert temp location data
+(BOOL)Insertlocation:(NSString *)_lat lng:(NSString *)_lng datetime:(NSString *)_datetime
{   
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        
        
        selectSql = [NSString stringWithFormat:@"INSERT INTO tbllocation (lat, lng,datetime)values('%@','%@','%@')", _lat,_lng , _datetime];
        
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"location user inserted successful");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}

// insert into temp table

+(BOOL)Inserttempuser:(NSString *)_username email:(NSString *)_email phone:(NSString *)_phone password:(NSString *)_password firstname:(NSString *)_firstname middlename:(NSString *)_middlename lastname:(NSString *)_lastname
{
    
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql = [NSString stringWithFormat:@"INSERT INTO tblreguser (username, email, phone,password,firstname,lastname,middlename)values('%@','%@','%@','%@','%@','%@','%@')", _username,_email,_phone,_password,_firstname,_lastname,_middlename];
        
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"temp user inserted successful");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}

+(BOOL)updatetemptable:(NSString *)streetno streetname:(NSString *)_streetname ste:(NSString *)_ste state:(NSString *)_state city:(NSString *)_city zipcode:(NSString *)_zipcode
{
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql= [NSString stringWithFormat:@"update tblreguser set streetnumber='%@' , streetname='%@', sta ='%@' , state='%@' , city='%@', zipcode='%@'", streetno, _streetname, _ste, _state, _city, _zipcode];
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"user updated successfully");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}
+(BOOL)updateuseraddress:(NSString *)streetno streetname:(NSString *)_streetname ste:(NSString *)_ste state:(NSString *)_state city:(NSString *)_city zipcode:(NSString *)_zipcode
{
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql= [NSString stringWithFormat:@"update tbluser set streetnumber='%@' , streetname='%@', sta ='%@' , state='%@' , city='%@', zipcode='%@'", streetno, _streetname, _ste, _state, _city, _zipcode];
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"user updated successfully");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}

+(BOOL)updatejobstatus:(NSString *)userid jobstatus:(NSString *)_jobstatus
    {
        bool result = NO;
        
        if (database != nil)
        {
            NSString *selectSql;
            sqlite3_stmt *statement1;
            
            selectSql= [NSString stringWithFormat:@"update tbluser set jobstatus='%@' where memberid='%@'",_jobstatus,userid];
            
            if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
            {
                if (sqlite3_step(statement1) == SQLITE_DONE)
                {
                    result = YES;
                    NSLog(@"user updated successfully");
                }
                sqlite3_finalize(statement1);
            }
            else
            {
                NSLog(@"Sql Preparing Error");
            }
        }
        return result;
    }
    
+(BOOL)updatepassword:(NSString *)userid password:(NSString *)_password
{
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql= [NSString stringWithFormat:@"update tbluser set password='%@' where memberid='%@'",_password,userid];
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"user updated successfully");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}
+(BOOL)updateuseremail:(NSString *)_userid  email:(NSString *)_email

{
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql= [NSString stringWithFormat:@"update tbluser set email='%@' where memberid='%@'",_email,_userid];
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"user updated successfully");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}

+(BOOL)updateusertype:(NSString *)_userid  utype:(NSString *)_utype

{
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
        
        selectSql= [NSString stringWithFormat:@"update tbluser set utype='%@' where memberid='%@'",_utype,_userid];
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"user updated successfully");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}


+(BOOL)updateuserimage:(NSString *)_userid  image:(NSString *)_image

{
    bool result = NO;
    
    if (database != nil)
    {
        NSString *selectSql;
        sqlite3_stmt *statement1;
    
        selectSql= [NSString stringWithFormat:@"update tbluser set profilepicture='%@' where memberid='%@'",_image,_userid];
        
        if (sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &statement1, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement1) == SQLITE_DONE)
            {
                result = YES;
                NSLog(@"user updated successfully");
            }
            sqlite3_finalize(statement1);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return result;
}


+(NSMutableArray *)Fetchtempuserdetail
{
    NSMutableArray *result2=[[NSMutableArray alloc] init];
    
    if (database != nil)
    {
        NSString *selectSql=[NSString stringWithFormat:@"select  username, email, phone,password,firstname,lastname,middlename,streetnumber,streetname,sta,state,city,zipcode from tblreguser "];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSMutableDictionary *result=[NSMutableDictionary dictionary];
             
                [result  setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"username"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"email"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"phone"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"password"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)] forKey:@"firstname"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)] forKey:@"lastname"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)] forKey:@"middlename"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)] forKey:@"streetnumber"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)] forKey:@"streetname"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 9)] forKey:@"sta"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 10)] forKey:@"state"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 11)] forKey:@"city"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 12)] forKey:@"zipcode"];
                [result2 addObject:result];
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error While Fetching  Data");
        }
    }
    else
    {
        NSLog(@"Database not opening");
    }
    //NSLog(@"%d",[result2 count]);
    
    return result2 ;
}

+(NSMutableArray *)Fetchuserdetail
{
    NSMutableArray *result2=[[NSMutableArray alloc] init];
    
    if (database != nil)
    {
        NSString *selectSql=[NSString stringWithFormat:@"select memberid, membertype, email, phone,password,ismobileverified,token,profilepicture,vehiclepicture,vehiclenumber,jobapply, locationupdate,jobstatus,applycount,notificationcount,username from tbluser"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSMutableDictionary *result=[NSMutableDictionary dictionary];
                
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"memberid"];
                [result  setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"membertype"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"email"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"phone"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)] forKey:@"password"];
                  [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)] forKey:@"ismobileverified"];
                 [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)] forKey:@"token"];
                 [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)] forKey:@"profilepicture"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)] forKey:@"vehiclepicture"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 9)] forKey:@"vehiclenumber"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 10)] forKey:@"jobapply"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 11)] forKey:@"locationupdate"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 12)] forKey:@"jobstatus"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 13)] forKey:@"applycount"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 14)] forKey:@"notificationcount"];
                  [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 15)] forKey:@"username"];
                [result2 addObject:result];
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error While Fetching  Data");
        }
    }
    else
    {
        NSLog(@"Database not opening");
    }
    //NSLog(@"%d",[result2 count]);
    
    return result2 ;
}
+(NSMutableArray *)fetchnotification
{
    NSMutableArray *result2=[[NSMutableArray alloc] init];
    
    if (database != nil)
    {
        NSString *selectSql =[NSString stringWithFormat:@"SELECT * from tblnotification order by id desc"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSMutableDictionary *result=[NSMutableDictionary dictionary];
                
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"id"];
                [result  setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"propertyname"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"priority"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"title"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)] forKey:@"type"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)] forKey:@"typename"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)] forKey:@"mid"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)] forKey:@"name"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)] forKey:@"houseno"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 9)] forKey:@"email"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 10)] forKey:@"mobile"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 11)] forKey:@"message"];
                [result2 addObject:result];
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    else
    {
        NSLog(@"Database not opening");
    }
    NSLog(@"%d",[result2 count]);
    
    return result2 ;
}


+(NSString *)checkusertype
{
    NSString *usertype;
    
    if (database != nil)
    {
        NSString *selectSql;
        selectSql = [NSString stringWithFormat:@"select membertype from tbluser"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                usertype=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return usertype;
}

+(NSMutableArray *)Fetchusertoken
{
    NSMutableArray *result2=[[NSMutableArray alloc] init];
    
    if (database != nil)
    {
        NSString *selectSql=[NSString stringWithFormat:@"select membertype, token from tbluser"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSMutableDictionary *result=[NSMutableDictionary dictionary];
                
                [result  setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"membertype"];
                [result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"token"];
                [result2 addObject:result];
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error While Fetching  Data");
        }
    }
    else
    {
        NSLog(@"Database not opening");
    }
    //NSLog(@"%d",[result2 count]);
    
    return result2 ;
}
+(NSString *)checkuserexist
{
    NSString *userid = @"";
    
    if (database != nil)
    {
        NSString *selectSql;
        selectSql = [NSString stringWithFormat:@"select memberid from tbluser"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database,[selectSql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                userid=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Sql Preparing Error");
        }
    }
    return userid;
}


@end
