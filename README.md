# 简介

这是我个人使用的 macOS 自动化配置, 用于重装系统后的还原

文件结构介绍: 
- ~~AppleScript_Disuse~~: 已被 defaults 完全替代
- necessary-config: 必须执行的选项
    - sys_pre: 系统偏好设置
    - app_pre: 各个应用的偏好设置
- alter-config: 非必须, 记录曾经配置的方法, 避免忘记


# 配置步骤

## 一、配置系统设置

1、下载本仓库的 sh 脚本

```bash
git clone git@github.com:luxuxl/mac-config.git
```

2、执行该文件中的 `sys_pre.sh` 脚本

```bash
sudo sh ./macos_defaults/necessary-config/sys_pre.sh
```

## 二、配置软件偏好设置

1、执行该文件中的 `app_pre.sh` 脚本

```bash
sudo sh ./macos_defaults/necessary-config/app_pre.sh
```

## 三、配置系统变量

## 四、下载软件

## 五、删除 ABC 输入法