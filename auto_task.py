import datetime

def main():
    """
    打印当前的日期和时间。
    """
    now = datetime.datetime.now()
    print(f"当前时间: {now.strftime('%Y-%m-%d %H:%M:%S')}")

if __name__ == "__main__":
    main()
