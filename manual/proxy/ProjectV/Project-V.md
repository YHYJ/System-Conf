# Project V

Project V手册

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [简介](#简介)
* [配置文件格式](#配置文件格式)
    * [LogObject](#logobject)
    * [InboundObject](#inboundobject)
        * [SniffingObject](#sniffingobject)
        * [AllocateObject](#allocateobject)
    * [OutboundObject](#outboundobject)
        * [ProxySettingsObject](#proxysettingsobject)

<!-- vim-markdown-toc -->

---

[官网](https://www.v2ray.com)

[Github](https://github.com/v2ray/v2ray-core)

[博客](https://steemit.com/@v2ray)

[白话文教程](https://toutyrater.github.io)

---

## 简介

1. 什么是V2Ray

    V2Ray是Project V下的一个工具。Project V是一个包含一系列构建特定网络环境工具的项目，而V2Ray属于最核心的一个，官方介绍Project V提供了单一的内核和多种界面操作方式

    内核V2Ray用于实际的网络交互、路由等针对网络数据的处理，而外围的用户界面程序提供了方便直接的操作流程

    从时间上来说，先有V2Ray才有Project V

2.  V2Ray跟Shadowsocks有什么区别

    Shadowsocks只是一个简单的代理工具，而V2Ray定位为一个平台，任何开发者都可以利用V2Ray提供的模块开发出新的代理软件

    简单来说，Shadowsocks功能单一，V2Ray功能强大。听起来似乎有点贬低Shadowsocks？当然不！换一个角度来看，Shadowsocks简单好上手，V2Ray复杂配置多

3. V2Ray的优势

    V2Ray 有以下优势：

    - 更完善的协议：V2Ray使用了新的自行研发的VMess协议，改正了Shadowsocks一些已有的缺点，更难被墙检测到
    - 更强大的性能：网络性能更好，具体数据可以看V2Ray官方博客
    - 更丰富的功能：以下是V2Ray的部分功能
        - mKCP: KCP协议在V2Ray上的实现，不必另行安装kcptun
        - 动态端口：动态改变通信的端口，对抗对长时间大流量端口的限速封锁
        - 路由功能：可以随意设定指定数据包的流向，去广告、反跟踪都可以
        - 传出代理：看名字可能不太好理解，其实差不多可以称之为多重代理，类似于Tor的代理
        - 数据包伪装：类似于Shadowsocks-rss的混淆，另外对于mKCP的数据包也可伪装，伪装成常见流量，令识别更困难
        - WebSocket协议：可以PaaS平台搭建V2Ray，通过WebSocket代理，也可以通过它使用CDN中转，抗封锁效果更好
        - Mux：多路复用，进一步提高科学上网的并发性能

4. 刚开始使用V2Ray的注意事项

    由于许多V2Ray用户都有使用过Shadowsocks的经验，基本上可以按照使用Shadowsocks那样使用，但是V2Ray还是和Shadowsocks不太一样

    - 客户端：V2Ray本身只是一个内核，V2Ray上的图形客户端大多是调用V2Ray内核套一个图形界面的外壳，类似于Linux内核和Linux操作系统的关系；而Shadowsocks的客户端都是自己重新实现了一遍Shadowsocks协议
    - 分流：无论是Shadowsocks（特指Shadowsocks-libev）还是V2Ray本身都不支持PAC，都是客户端加进来的；Shadowsocks的分流使用ACL，V2Ray使用自己实现的路由功能
    - 分享链接/二维码：V2Ray不像Shadowsocks那样有统一规定的URL格式，所以各个V2Ray图形客户端的分享链接/二维码不一定通用
    - 加密方式：V2Ray（特指VMess协议）不像Shadowsocks那样看重对加密方式的选择，并且VMess的加密方式是由客户端指定的，服务器自适应
    - 时间：使用V2Ray要保证服务端和客户端时间基本一致（**不能超过90s，但不要求时区一致**），因为这是为了安全设计的
    - 密码：V2Ray（VMesss）只有id（使用UUID格式），作用类似于Shadowsocks的密码，但随机性远好于Shadowsocks的密码，只是不太方便记忆
    - UDP转发：VMess是基于TCP的协议，对于UDP包V2Ray会转成TCP再传输，即*UDP over TCP*。要使用UDP转发功能在客户端的socks协议中开启UDP即可

## 配置文件格式

服务器/客户端通用

```json
{
  "log": {},
  "api": {},
  "dns": {},
  "stats": {},
  "routing": {},
  "policy": {},
  "reverse": {},
  "inbounds": [],
  "outbounds": [],
  "transport": {}
}
```

- `log`：[LogObject](#LogObject)

    日志配置，表示V2Ray如何输出日志

- `api`：[ApiObject](#ApiObject)

    内置的远程控制API，详见[远程控制配置](https://www.v2ray.com/chapter_02/api.html)

- `dns`：[DnsObject](#DnsObject)

    内置的DNS服务器，若此项不存在则默认使用本机的DNS配置，详见[DNS配置](https://www.v2ray.com/chapter_02/04_dns.html)

- `routing`：[RoutingObject](#RoutingObject)

    [路由配置](https://www.v2ray.com/chapter_02/03_routing.html)

- `policy`：[PolicyObject](#PolicyObject)

    本地策略可进行一些权限相关的配置，详见[本地策略](https://www.v2ray.com/chapter_02/policy.html)

- `inbounds`：[InboundObject](#InboundObject)

    一个数组，每个元素是一个[入站连接](https://www.v2ray.com/chapter_02/01_overview.html#inboundobject)

- `outbounds`：[OutboundObject](#OutboundObject)

    一个数组，每个元素是一个[出站连接](https://www.v2ray.com/chapter_02/01_overview.html#outboundobject)。数组中的第一个元素作为主出站协议，当路由匹配不存在或没有匹配成功时流量由主出站协议发出

- `transport`：[TransportObject](#TransportObject)

    用于配置V2Ray如何与其他服务器建立和使用网络连接，详见[底层传输配置](https://www.v2ray.com/chapter_02/05_transport.html)

- `stats`：[StatsObject](#StatsObject)

    当此项存在时开启[统计信息](https://www.v2ray.com/chapter_02/stats.html)

- `reverse`：[ReverseObject](#ReverseObject)

    [反向代理](https://www.v2ray.com/chapter_02/reverse.html)配置

### LogObject

```json
{
  "access": "文件地址",
  "error": "文件地址",
  "loglevel": "warning"
}
```

- `access`：string

    访问日志的文件路径，如`/tmp/v2ray/access.log`。当此项不指定或为空值时表示将日志输出到stdout。V2Ray 4.20后加入了特殊值`none`，即关闭access log

- `error`：string

    错误日志的文件路径，如`/tmp/v2ray.error.log`。当此项不指定或为空值时表示将日志输出到stdout。V2Ray 4.20后加入了特殊值`none`，即关闭error log（等价于`loglevel: "none"`）

- `loglevel`："debug" | "info" | "warning" | "error" | "none"

    错误日志的级别，默认值为"warning"

### InboundObject

入站连接用于接收从客户端（浏览器或上以及代理服务器）发来的数据

```json
{
  "port": 1080,
  "listen": "127.0.0.1",
  "protocol": "协议名称",
  "settings": {},
  "streamSettings": {},
  "tag": "标识",
  "sniffing": {
    "enabled": false,
    "destOverride": ["http", "tls"]
  },
  "allocate": {
    "strategy": "always",
    "refresh": 5,
    "concurrency": 3
  }
}
```

- `port`： number | env:variable | string

    入站连接端口，接受的格式如下：

        - 整数：实际的端口号，如1080

        - 环境变量：以`"env:"`开头，后面是一个环境变量的名字，如`"env:PORT"`。V2Rray会以字符串形式解析这个环境变量

        - 字符串：可以是一个数值类型的字符串，如"1080"；或者一个数值范围，如`"5-10"`表示5到6这六个端口

    当是确定的端口时，V2Ray会再次端口监听入站连接；当指定一个端口范围时，取决于`allocate`设置

- `listen`：string

    监听地址，只接受IP地址，默认值为`"0.0.0.0"`，表示接收所有网卡上的连接，否则必须指定一个现有网卡的IP地址

- `protocol`：string

    连接协议名，可用的协议见[协议列表](#协议列表)

- `settings`：InboundConfigurationObje

    具体的配置内容视协议而定。详见每个协议中的"InboundConfigurationObje"

- `streamSettings`：StreamSettingsObject

    [底层传输配置](https://www.v2ray.com/chapter_02/05_transport.html#perproxy)

- `tag`：string

    入站连接的标识，用于在其他配置中定位此连接。当其不为空时，它的值必须是所有tag中唯一的

- `sniffing`：[SniffingObject](#SniffingObject)

    尝试探测流量的类型

- `allocate`：[AllocateObject](#AllocateObject)

    端口分配设置

#### SniffingObject

```json
{
  "enabled": false,
  "destOverride": ["http", "tls"]
}
```

- `enabled`：true | false

    是否开启流量探测

- `destOverride`：["http" | "tls"]

    当流量为指定类型时，按其中包括的目标地址重置当前连接的目标

#### AllocateObject

```json
{
  "strategy": "always",
  "refresh": 5,
  "concurrency": 3
}
```

- `strategy`："always" | "random"

    端口分配策略。"always"表示总是分配所有已指定的端口，`port`中指定了的端口V2Ray都会监听；"random"表示随机开放端口，每隔`refresh`分钟在`port`指定的范围中随机选取`concurrency`个端口来监听

- `refresh`：number

    随机端口刷新时间间隔，单位为分钟，最小值为2，建议值为5。这个属性仅当`strategy = random`时有效

- `concurrency`：number

    随机选取的端口数量，最小值为1，最大值为`port`指定范围的1/3，建议值为3

### OutboundObject

出站连接用于向远程网站或下一级代理服务器发送数据

```json
{
  "sendThrough": "0.0.0.0",
  "protocol": "协议名称",
  "settings": {},
  "tag": "标识",
  "streamSettings": {},
  "proxySettings": {
    "tag": "another-outbound-tag"
  },
  "mux": {}
}
```

- `sendThrough`：string

    用于发送数据的IP地址，当主机有多个IP地址有效时建议使用`"0.0.0.0"`

- `protocol`：string

    连接协议名，可用的协议见[协议列表](#协议列表)

- `settings`：OutboundConfigurationObject

    具体的配置内容视协议而定。详见每个协议中的"OutboundConfigurationObje"

- `tag`：string

    出站连接的标识，用于在其他配置中定位此连接。当其不为空时，它的值必须是所有tag中唯一的

- `streamSettings`：StreamSettingsObject

    [底层传输配置](https://www.v2ray.com/chapter_02/05_transport.html#perproxy)

- `proxySettings`：[ProxySettingsObject](https://www.v2ray.com/chapter_02/01_overview.html#proxysettingsobject)

    出站代理配置，当此配置生效时，`streamSettings`不起作用

- `mux`：MuxObject

    [Mux配置](https://www.v2ray.com/chapter_02/mux.html)

#### ProxySettingsObject

```json
{
  "tag": "another-outbound-tag"
}
```

- `tag`：string

    当指定另一个出站协议的标识时，此出站协议的数据将被转发至所指定的协议
