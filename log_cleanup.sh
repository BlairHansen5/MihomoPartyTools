#!/bin/bash

# 日志清理脚本

# 默认清理目录（可根据实际情况修改）
LOG_DIR="/var/log"
# 默认保留天数
DAYS_TO_KEEP=7

# 使用说明
usage() {
    echo "使用方法: $0 [-d <目录>] [-k <天数>]"
    echo "  -d <目录>    指定要清理的日志目录 (默认为: $LOG_DIR)"
    echo "  -k <天数>    指定要保留日志文件的天数 (默认为: $DAYS_TO_KEEP)"
    exit 1
}

# 解析命令行参数
while getopts "d:k:" opt; do
    case ${opt} in
        d )
            LOG_DIR=$OPTARG
            ;;
        k )
            DAYS_TO_KEEP=$OPTARG
            ;;
        \? )
            usage
            ;;
    esac
done

echo "--- 日志清理开始 ---"
echo "目标目录: $LOG_DIR"
echo "保留天数: $DAYS_TO_KEEP 天"

# 检查目录是否存在
if [ ! -d "$LOG_DIR" ]; then
    echo "错误: 指定的日志目录 '$LOG_DIR' 不存在。"
    exit 1
fi

# 清理操作
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS_TO_KEEP" -exec rm -v {} \;
find "$LOG_DIR" -type f -name "*.gz" -mtime +"$DAYS_TO_KEEP" -exec rm -v {} \;

echo "--- 日志清理完成 ---"
