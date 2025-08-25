import datetime

def main():
    """
    打印当前的日期和时间。
    """
    now = datetime.datetime.now()
    print("欢迎使用自动任务脚本！")
    print(f"当前时间: {now.strftime('%Y-%m-%d %H:%M:%S')}")

if __name__ == "__main__":
    main()
