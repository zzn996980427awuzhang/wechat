
--
-- 表的结构 `rh_admin`
--

CREATE TABLE `rh_admin` (
  `id` int(11) NOT NULL COMMENT '自增 ID',
  `admin_name` varchar(60) NOT NULL COMMENT '管理员登录',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `ip` varchar(16) DEFAULT '' COMMENT '登录 IP',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '超级管理 ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




--
-- 表的结构 `rh_mp`
--

CREATE TABLE `rh_mp` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '自增ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `name` varchar(50) NOT NULL COMMENT '公众号名称',
  `appid` varchar(50) DEFAULT '' COMMENT 'AppId',
  `appsecret` varchar(50) DEFAULT '' COMMENT 'AppSecret',
  `origin_id` varchar(50) NOT NULL COMMENT '公众号原始ID',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '公众号类型（1：普通订阅号；2：认证订阅号；3：普通服务号；4：认证服务号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常，2：审核中）',
  `valid_token` varchar(40) DEFAULT '' COMMENT '接口验证Token',
  `valid_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已接入；0未接入',
  `token` varchar(50) DEFAULT '' COMMENT '公众号标识',
  `encodingaeskey` varchar(50) DEFAULT '' COMMENT '消息加解密秘钥',
  `mp_number` varchar(50) DEFAULT '' COMMENT '微信号',
  `desc` text COMMENT '描述',
  `logo` varchar(255) DEFAULT '' COMMENT 'logo',
  `qrcode` varchar(255) DEFAULT '' COMMENT '二维码',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `login_name` varchar(50) DEFAULT '' COMMENT '公众号登录名',
  `is_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '当前使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号表';

--
-- 转存表中的数据 `rh_mp`
--

INSERT INTO `rh_mp` (`id`, `user_id`, `name`, `appid`, `appsecret`, `origin_id`, `type`, `status`, `valid_token`, `valid_status`, `token`, `encodingaeskey`, `mp_number`, `desc`, `logo`, `qrcode`, `create_time`, `login_name`, `is_use`) VALUES
(2, 1, '用户交互平台', 'wx756c76359229f697', '6290b1ed655bd97c1c40c2b553161a71', 'gh_6b8370b835fc', 1, 1, '6EkHi26vaj1Y3VdlOQfjLyd6MZJscFSy', 1, 'Qwf951WrK9x9bn8ueElcesft3Lq30209', 'XgxtfS9fHRqbGGrw1kPX5fEJHqvxciuCrScFMBJV2rG', '', '', 'http://localhost:8088/uploads/41/f066c6fcacf90e5db8c8bc0fa06169.jpg', 'http://localhost:8088/uploads/41/f066c6fcacf90e5db8c8bc0fa06169.jpg', 1554355780, '', 1);


--
-- 表的结构 `rh_material`
--

CREATE TABLE `rh_material` (
  `id` int(10) NOT NULL COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `type` varchar(50) DEFAULT '' COMMENT '素材类型',
  `title` varchar(255) DEFAULT '' COMMENT '素材名称|标题',
  `url` varchar(500) DEFAULT '' COMMENT '素材资源地址|图文封面',
  `description` text COMMENT '图文素材描述',
  `content` mediumtext COMMENT '文本素材内容',
  `detail` text COMMENT '图文素材详情',
  `link` varchar(255) DEFAULT '' COMMENT '图文链接',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  `media_id` varchar(120) DEFAULT '' COMMENT '媒体 ID',
  `from_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:本地1：公众号',
  `path` varchar(500) DEFAULT '' COMMENT '资源路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号素材表';



-- --------------------------------------------------------

--
-- 表的结构 `rh_media_news`
--

CREATE TABLE `rh_media_news` (
  `news_id` int(11) NOT NULL COMMENT '自增 ID',
  `mid` int(11) NOT NULL COMMENT '公众号标识',
  `media_id` varchar(120) DEFAULT '' COMMENT '媒体 ID',
  `title` text COMMENT '标题',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:文本2:单图文3:多图文',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已上传，0未上传,3已经群发'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `rh_media_news_list`
--

CREATE TABLE `rh_media_news_list` (
  `id` int(11) NOT NULL COMMENT '自增 ID',
  `news_id` int(11) NOT NULL COMMENT '主题 ID',
  `cover` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '封面',
  `thumb_media_id` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '媒体 ID',
  `author` varchar(80) CHARACTER SET utf8 DEFAULT '' COMMENT '作者',
  `title` varchar(180) DEFAULT '' COMMENT '标题',
  `content_source_url` text CHARACTER SET utf8 COMMENT '链接',
  `content` mediumtext COMMENT '内容',
  `digest` text COMMENT '描述',
  `show_cover_pic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为显示，0为不显示',
  `status_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已上传，2未上传',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `rh_media_news_material`
--

CREATE TABLE `rh_media_news_material` (
  `id` int(11) NOT NULL COMMENT '自增 ID',
  `mid` int(11) NOT NULL COMMENT '公众号标识',
  `url` text COMMENT '地址',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1图片：2视频',
  `path` varchar(500) DEFAULT '' COMMENT '本地路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------







--
-- 表的结构 `rh_menu`
--

CREATE TABLE `rh_menu` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `pid` int(5) NOT NULL COMMENT '上级ID',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `url` varchar(180) NOT NULL COMMENT 'Url函数地址',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `icon` varchar(180) DEFAULT '' COMMENT '图标',
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------







--
-- 表的结构 `rh_miniapp_msg`
--

CREATE TABLE `rh_miniapp_msg` (
  `msg_id` int(11) NOT NULL COMMENT '自增 ID',
  `openid` varchar(64) DEFAULT '' COMMENT 'openid',
  `mpid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号标识',
  `type` varchar(32) DEFAULT '' COMMENT '消息类型',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未回复，1已回复',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为回复内容',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------





-- --------------------------------------------------------

--
-- 表的结构 `rh_mp_friends`
--

CREATE TABLE `rh_mp_friends` (
  `id` int(10) NOT NULL COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(64) NOT NULL COMMENT 'openid',
  `nickname` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) DEFAULT '' COMMENT '头像',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关注',
  `subscribe_time` int(10) DEFAULT '0' COMMENT '关注时间',
  `unsubscribe_time` int(10) DEFAULT '0' COMMENT '取消关注时间',
  `relname` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `signature` text COMMENT '个性签名',
  `mobile` varchar(15) DEFAULT '' COMMENT '手机号',
  `is_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定',
  `language` varchar(50) DEFAULT '' COMMENT '使用语言',
  `country` varchar(50) DEFAULT '' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '省',
  `city` varchar(50) DEFAULT '' COMMENT '城市',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `group_id` int(10) DEFAULT '0' COMMENT '分组ID',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号分组标识',
  `tagid_list` varchar(255) DEFAULT '' COMMENT '标签',
  `score` int(10) DEFAULT '0' COMMENT '积分',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金钱',
  `group_score` int(11) NOT NULL DEFAULT '0' COMMENT '影响角色组等级升降的积分',
  `group_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '影响角色组等级升降的金额',
  `latitude` varchar(50) DEFAULT '' COMMENT '纬度',
  `longitude` varchar(50) DEFAULT '' COMMENT '经度',
  `location_precision` varchar(50) DEFAULT '' COMMENT '精度',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0:公众号粉丝1：注册会员',
  `unionid` varchar(64) DEFAULT '' COMMENT 'unionid字段',
  `password` varchar(64) DEFAULT '' COMMENT '密码',
  `last_time` int(10) DEFAULT '586969200' COMMENT '最后交互时间',
  `subscribe_scene` varchar(255) DEFAULT '',
  `qr_scene` varchar(255) DEFAULT '',
  `qr_scene_str` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号粉丝表';



--
-- 表的结构 `rh_mp_menu`
--

CREATE TABLE `rh_mp_menu` (
  `id` bigint(16) UNSIGNED NOT NULL,
  `mp_id` int(11) DEFAULT '0' COMMENT '公众号标识',
  `index` bigint(20) DEFAULT '0',
  `pindex` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `type` varchar(24) DEFAULT '' COMMENT '菜单类型 null主菜单 link链接 keys关键字 event事件',
  `name` varchar(256) DEFAULT '' COMMENT '菜单名称',
  `content` text COMMENT '文字内容',
  `sort` int(10) UNSIGNED DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '状态(0禁用1启用)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信自定义菜单表';

--
-- 转存表中的数据 `rh_mp_menu`
--

INSERT INTO `rh_mp_menu` (`id`, `mp_id`, `index`, `pindex`, `type`, `name`, `content`, `sort`, `status`) VALUES
(4, 2, 1, 0, 'view', '百度一下', 'www.baidu.com', 0, 1),
(5, 2, 2, 0, 'keys', '好嗨哦', '张某妮\n    加油', 1, 1);

-- --------------------------------------------------------



--
-- 表的结构 `rh_mp_reply`
--

CREATE TABLE `rh_mp_reply` (
  `reply_id` int(11) NOT NULL COMMENT '自增ID',
  `type` varchar(60) NOT NULL COMMENT '回复类型：text,images,news,voice,music,video',
  `title` varchar(250) DEFAULT '' COMMENT '标题(适用图文)',
  `content` text COMMENT '文本内容',
  `url` varchar(500) DEFAULT '' COMMENT '资源地址',
  `link` varchar(500) DEFAULT '' COMMENT '连接(图片连接，图文连接等)',
  `status_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:永久0：临时',
  `media_id` varchar(120) DEFAULT '' COMMENT '媒体ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- 表的结构 `rh_mp_rule`
--

CREATE TABLE `rh_mp_rule` (
  `id` int(10) NOT NULL COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号ID',
  `addon` varchar(50) DEFAULT '' COMMENT '插件标识',
  `keyword` varchar(80) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '关键词内容',
  `type` varchar(50) DEFAULT '' COMMENT '触发类型：text,images,news,voice',
  `event` varchar(50) DEFAULT '' COMMENT '特殊事件如:关注、取关等',
  `entry_id` int(10) DEFAULT '0' COMMENT '功能入口ID',
  `reply_id` int(10) DEFAULT '0' COMMENT '自动回复ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1开户:0关闭)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';







--
-- 表的结构 `rh_qrcode_data`
--

CREATE TABLE `rh_qrcode_data` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `scene_id` int(11) NOT NULL COMMENT '场景 ID',
  `openid` varchar(64) NOT NULL COMMENT 'openid',
  `create_time` varchar(60) NOT NULL COMMENT '扫码时间',
  `mpid` int(11) NOT NULL COMMENT '公众号标识',
  `qrcode_id` int(11) NOT NULL COMMENT '二维码ID',
  `scan_count` int(11) NOT NULL DEFAULT '1' COMMENT '扫码次数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:默认1:扫码关注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------



--
-- 表的结构 `rh_setting`
--

CREATE TABLE `rh_setting` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `mpid` int(11) NOT NULL COMMENT '公众号标识',
  `name` varchar(180) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置值',
  `cate` varchar(30) DEFAULT '' COMMENT '分类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






