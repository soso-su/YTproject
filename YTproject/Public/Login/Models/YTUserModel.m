//
//  YTUserModel.m
//  YTproject
//
//  Created by suhuahao on 2018/7/30.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTUserModel.h"

static YTUserModel* _instance = nil;
@implementation YTUserModel

+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+(instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    YTUserModel *model = [YTUserModel share];
    model.type = [dictionary[@"type"] integerValue];
    model.token = dictionary[@"token"];
    model.account_type = [dictionary[@"account_type"] integerValue];
    model.person = [Person modelWithDictionary:dictionary[@"person"]];
    return model;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [YTUserModel share] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [YTUserModel share] ;
}


@end

@implementation Person

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    Person *person = [[Person alloc]init];
    person.appId = [dictionary[@"id"] integerValue];
    person.iD_number = dictionary[@"ID_number"];
    person.avatar_url = dictionary[@"avatar_url"];
    person.birthday = dictionary[@"birthday"];
    person.created_time = dictionary[@"created_time"];
    person.email = dictionary[@"email"];
    person.img = dictionary[@"img"];
    person.integral = [dictionary[@"integral"] integerValue];
    person.name = dictionary[@"name"];
    person.nick_name = dictionary[@"nick_name"];
    person.phone = dictionary[@"phone"];
    person.sex = dictionary[@"sex"];
    person.state = [dictionary[@"state"] integerValue];
    person.u_id = [dictionary[@"u_id"] integerValue];
    return person;
}

@end
