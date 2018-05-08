//
//  Utils.m
//  KZ_AutoHeightTableView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "Utils.h"

static NSString *content = @"赵丽颖，1987年10月16日出生于河北省廊坊市，中国内地影视女演员。2006年，因获得雅虎搜星比赛冯小刚组冠军而进入演艺圈；同年，在冯小刚执导的广告片《跪族篇》中担任女主角。2007年，参演个人首部电影《镖行天下之牡丹阁》。2011年，因在古装剧《新还珠格格》中饰演晴儿一角而被观众认识。2013年，凭借古装剧《陆贞传奇》获得更多关注。2014年10月，在第10届金鹰电视艺术节举办的投票活动中被选为“金鹰女神”；12月，凭借都市爱情剧《杉杉来了》获得第5届国剧盛典内地最具人气女演员奖；同年，成立海润传媒赵丽颖工作室。2015年，主演的仙侠剧《花千骨》打破中国内地周播剧收视纪录，而其个人则凭借该剧先后获得第6届澳门国际电视节金莲花最佳女主角奖、第6届国剧盛典最具收视号召力演员奖、第22届上海电视节白玉兰奖最佳女主角奖提名、第28届中国电视金鹰奖观众喜爱的女演员奖。2017年，其主演的古装剧《楚乔传》成为中国内地首部在播期间网络播放量突破400亿次的电视剧。";

@implementation Utils

+ (NSString *)radomText {
    return [content substringToIndex:(arc4random() % (int)(content.length + 1))];
}

@end