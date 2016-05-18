//
//  WZNetInterface.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/4.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#ifndef _____WZNetInterface_h
#define _____WZNetInterface_h

//画报项目接口：
//第一：主页部分接口：
//1.1主页上部图片翻转接口
// http://www.duitang.com/napi/ad/banner/week/?platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&adid=ANA001&app_code=nayutas
#define BANNER_URL @"http://www.duitang.com/napi/ad/banner/week/?platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&adid=ANA001&app_code=nayutas"


//上部翻转详情页面上部接口：

//http://www.duitang.com/napi/album/detail/?include_fields=share_links_2%2Ccovers%2Cmembers%2Cmember_count%2Cmanagers&platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&app_version=57&album_id=64054110&platform_name=Android&locale=zh&app_code=nayutas

#define BANNERDETAILUP_UPL @"http://www.duitang.com/napi/album/detail/?include_fields=share_links_2%%2Ccovers%%2Cmembers%%2Cmember_count%%2Cmanagers&platform_version=4.2.2&device_platform=YUSUN%%2BLA2-W&__dtac=%%257B%%2522_r%%2522%%253A%%2520%%2522316784%%2522%%257D&screen_width=720&screen_height=1280&app_version=57&album_id=%@&platform_name=Android&locale=zh&app_code=nayutas"

//上部翻转详情页面下部接口：
// http://www.duitang.com/napi/blog/list/by_album/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count%2Ctop_comments%2Ctop_like_users&platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&start=0&app_version=57&album_id=64054110&platform_name=Android&locale=zh&app_code=nayutas
#define BANNERDETAILDOWN_URL @"http://www.duitang.com/napi/blog/list/by_album/?include_fields=sender%%2Calbum%%2Cicon_url%%2Creply_count%%2Clike_count%%2Ctop_comments%%2Ctop_like_users&platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&start=%d&app_version=57&album_id=%@&platform_name=Android&locale=zh&app_code=nayutas"


//1.2主页面下部瀑布流接口
//http://www.duitang.com/napi/index/hot/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count&platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas

#define MAIN_URL @"http://www.duitang.com/napi/index/hot/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count&platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas"

//主页面下部瀑布流详情接口
// http://www.duitang.com/napi/blog/detail/?include_fields=share_links_2%2Ctags%2Crelated_albums%2Crelated_albums.covers%2Ctop_like_users%2Ctop_comments%2Cextra_html&platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522297074%2522%257D&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&blog_id=419748700&app_code=nayutas
#define MAINDETAIL_URL @"http://www.duitang.com/napi/blog/detail/?include_fields=share_links_2Ctags%%2Crelated_albums%%2Crelated_albums.covers%%2Ctop_like_users%%2Ctop_comments&blog_id=%@"



//第二：分类页面接口
//2.1分类页面上部翻转接口
//http://www.duitang.com/napi/index/groups/?platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&app_code=nayutas
#define CATEGORY_URL @"http://www.duitang.com/napi/index/groups/?platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&app_code=nayutas"

//分类页面详情接口http://www.duitang.com/napi/theme/detail/?&theme_id=554c8abaa310def67913c5c0
//滚动视图详情：
//
#define CATEGORYBANNERDETAIL_URL @"http://www.duitang.com/napi/theme/detail/?&theme_id=%@"
// top详情:http://www.duitang.com/mobp/top_blogs/?from=app&__urlopentype=pageweb

//top:http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%2Calbum%2Cicon_url%2Clike_count%2Creply_count&platform_version=4.1.2&device_platform=8295&filter_id=%E4%BB%8A%E6%97%A5TOP%E6%A6%9C&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas
#define CATEGOTYDOWNDETAIL_URL @"http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%%2Calbum%%2Cicon_url%%2Clike_count%%2Creply_count&platform_version=4.1.2&device_platform=8295&filter_id=%@&screen_width=540&screen_height=960&start=%d&app_version=57&platform_name=Android&locale=zh&app_code=nayutas"

//2.2下面接口
//http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%2Calbum%2Cicon_url%2Clike_count%2Creply_count&platform_version=4.1.2&filter_id=%E4%BB%8A%E6%97%A5TOP%E6%A6%9C&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522297074%2522%257D&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas

#define CATEGORDOWN_URL @"http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%2Calbum%2Cicon_url%2Clike_count%2Creply_count&platform_version=4.1.2&filter_id=%E4%BB%8A%E6%97%A5TOP%E6%A6%9C&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522297074%2522%257D&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas"
//下面上部详情接口
//http://www.duitang.com/napi/category/detail/?category_id=5459e65e586df57518d70ff6
#define CATEGORDOWNUPDETAIL_URL @"http://www.duitang.com/napi/category/detail/?category_id=%@"

//下面上部详情中详情页接口
//http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%2Calbum%2Cicon_url%2Clike_count%2Creply_count&platform_version=4.2.2&filter_id=%E8%89%AF%E5%93%81%E8%B4%AD_%E6%96%B0%E5%93%81%E9%80%9F%E9%80%92&device_platform=YUSUN%2BLA2-W&screen_width=720&screen_height=1280&app_version=57&start=0&platform_name=Android&locale=zh&app_code=nayutas
#define CATEDETAILUPDETAIL_URL @"http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%%2Calbum%%2Cicon_url%%2Clike_count%%2Creply_count&platform_version=4.2.2&filter_id=%@&device_platform=YUSUN%%2BLA2-W&screen_width=720&screen_height=1280&app_version=57&start=%d&platform_name=Android&locale=zh&app_code=nayutas"

//下部下面详情口
//http://www.duitang.com/napi/blog/list/by_category/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count&platform_version=4.2.2&path=&device_platform=YUSUN%2BLA2-W&__dtac=%257B%2522_r%2522%253A%2520%2522316784%2522%257D&screen_width=720&screen_height=1280&app_version=57&start=0&platform_name=Android&locale=zh&app_code=nayutas&cate_key=5459e65e586df57518d70ff6
#define CATEDOWNDETAILDOWN_URL @"http://www.duitang.com/napi/blog/list/by_category/?include_fields=sender%%2Calbum%%2Cicon_url%%2Creply_count%%2Clike_count&platform_version=4.2.2&path=&device_platform=YUSUN%%2BLA2-W&__dtac=%%257B%%2522_r%%2522%%253A%%2520%%2522316784%%2522%%257D&screen_width=720&screen_height=1280&app_version=57&start=%d&platform_name=Android&locale=zh&app_code=nayutas&cate_key=%@"

//选做接口

//第三：club页面接口
//3.1 club页面左侧抽屉接口
//http://www.duitang.com/napi/theme/detail/?platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&app_version=57&theme_id=54fd220117c26bb6fc3137e0&platform_name=Android&locale=zh&app_code=nayutas
#define CLUBLEFT_URL @"http://www.duitang.com/napi/theme/detail/?platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&app_version=57&theme_id=54fd220117c26bb6fc3137e0&platform_name=Android&locale=zh&app_code=nayutas"

//左侧点击出右侧页面主接口
//http://www.duitang.com/napi/club/list/by_filter_id/?platform_version=4.1.2&filter_id=Club_%E6%8E%A8%E8%8D%90&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas
#define CLUBRIGHT_URL @"http://www.duitang.com/napi/club/list/by_filter_id/?platform_version=4.1.2&filter_id=Club_%E6%8E%A8%E8%8D%90&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas"


//右侧详情页面上部
//http://www.duitang.com/napi/club/detail/?include_fields=share_links_2%2Ccheck_in%2Cexperience%2Crelated_ad%2Ctop_member_target%2Ctopic_update&platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&app_version=57&club_id=5594a81b05434b3fd5805c13&platform_name=Android&locale=zh&app_code=nayutas
#define CLUBRIGHTUPDETAIL_URL @"http://www.duitang.com/napi/club/detail/?include_fields=share_links_2%2Ccheck_in%2Cexperience%2Crelated_ad%2Ctop_member_target%2Ctopic_update&platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&app_version=57&club_id=5594a81b05434b3fd5805c13&platform_name=Android&locale=zh&app_code=nayutas"

//右侧详情页面下部
//http://www.duitang.com/napi/topic/list/by_club/?platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&start=0&app_version=57&club_id=5594a81b05434b3fd5805c13&platform_name=Android&locale=zh&app_code=nayutas
#define CLUBRTUPDETAIL_URL @"http://www.duitang.com/napi/topic/list/by_club/?platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&start=0&app_version=57&club_id=5594a81b05434b3fd5805c13&platform_name=Android&locale=zh&app_code=nayutas"

//评论页面接口
//http://www.duitang.com/napi/topic/detail/?include_fields=share_links&platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&app_code=nayutas&topic_id=48631
#define H_URL @"http://www.duitang.com/napi/topic/detail/?include_fields=share_links&platform_version=4.1.2&device_platform=8295&__dtac=%257B%2522_r%2522%253A%2520%2522474974%2522%257D&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&app_code=nayutas&topic_id=48631"






#endif
