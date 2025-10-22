# -*- coding: utf-8 -*-
import psutil
import time
import os

def get_system_usage():
    """
    获取当前系统的 CPU 和内存使用率
    """
    cpu_usage = psutil.cpu_percent(interval=1)
    memory_info = psutil.virtual_memory()
    return cpu_usage, memory_info.percent

def main():
    """
    主函数，持续监控并打印系统资源使用情况
    """
    print("开始监控系统资源... 按 Ctrl+C 退出")
    try:
        while True:
            cpu, memory = get_system_usage()
            print(f"CPU 使用率: {cpu}% | 内存使用率: {memory}%")
            time.sleep(5)
    except KeyboardInterrupt:
        print("\n监控结束。")

if __name__ == "__main__":
    # 确保 psutil 库已安装
    try:
        import psutil
    except ImportError:
        print("错误：psutil 模块未找到。")
        print("请运行 'pip install psutil' 来安装依赖。")
        exit(1)
    main()
