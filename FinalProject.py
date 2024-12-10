from operator import truediv

import requests
import psycopg2
import re
from datetime import datetime


# اتصال به دیتابیس
def get_database_connection():
    return psycopg2.connect(
        host="localhost",
        database="digikala",
        user="postgres",
        password="erp1757070265"
    )


# استخراج فقط عدد از رشته (برای فیلدهایی که واحد دارند)
def extract_number(value):
    match = re.search(r"[\d.×]+", value)
    return float(match.group()) if match else None


def extract_size(value):
    match = re.search(r"[\d\.]+×[\d\.]+×[\d\.]+", value)
    return match.group() if match else None


def extract_pixel(value):
    match = re.search(r"(\d+x\d+)", value)
    return match.group() if match else None


def extract_battery(value):
    match = re.search(r"[\d.×]+", value)
    return match.group() if match else None


# دریافت لیست شناسه محصولات موبایل سامسونگ
def fetch_product_ids():
    base_url = "https://api.digikala.com/v1/categories/mobile-phone/brands/samsung/search/"
    page = 1
    product_ids = []

    while True:
        try:
            # درخواست به API
            response = requests.get(f"{base_url}?page={page}")
            if response.status_code != 200:
                print(f"Failed to fetch page {page}. Status code: {response.status_code}")
                break

            # بررسی داده‌های بازگشتی
            data = response.json()
            # print(data)
            products = data.get("data", {}).get("products", [])
            # print(products)
            if not products:
                break  # اگر لیستی نباشد، صفحه‌های API پایان‌یافته‌اند

            # اضافه کردن شناسه محصولات به لیست
            product_ids.extend(product.get("id") for product in products if product.get("id") is not None)
            #print(f"Page {page}: {len(products)} products fetched.")

            # رفتن به صفحه بعد
            page += 1

        except Exception as e:
            print(f"Error occurred on page {page}: {e}")
            break

    print(f"Total product IDs fetched: {len(product_ids)}")
    #print("product_ids id: ")
    #print(product_ids)
    return product_ids


def fetch_result(product_id):
        base_url = f"https://api.digikala.com/v2/product/{product_id}/"
        # درخواست به API
        response = requests.get(base_url)
        if response.status_code != 200:
            print(f"Failed to fetch product details for ID {product_id}. Status code: {response.status_code}")

        # بررسی داده‌های بازگشتی
        data = response.json()
        return data


def fetch_product_info(product_id):
    data1 = fetch_result(product_id)
    #print(" the data1 is: ")
    #print(data1)
    #print(type(data1))
    data = data1.get("data")
    product = data.get("product")
    #print("product is: ")
    #print(product)
    return product


def fetch_price(id):
    product_Info = fetch_product_info(id)
    aa = product_Info.get("properties")
    min_price_in_last_month = aa.get("min_price_in_last_month")
    #print("min_price_in_last_month:", min_price_in_last_month)
    if not min_price_in_last_month:
        print(f"Key 'min_price_in_last_month' is missing or None for product ID {id}")
    if min_price_in_last_month is None:
        raise ValueError("Key 'price' not found in 'min_price_in_last_month'")
    return min_price_in_last_month


 # استخراج تایتل برای model

def fetch_model(id):
    productInfo = fetch_product_info(id)
    #print("productInfo in model methode is: ")
    #print(productInfo)
    model = productInfo.get("title_en", None)
    #print("model: ", model)
    return model



    # استخراج سایز
def fetch_size(id):
    productInfo = fetch_product_info(id)
    #print("productInfo in size methode is: ")
    #print(productInfo)
    specifications = productInfo.get("specifications", [])
    size = None
    for spec in specifications:
        if spec.get("title") == "مشخصات کلی":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "ابعاد":
                    size = attribute.get("values", [None])[0]
                    size = extract_size(size)
                    break
            break
    #print("size: ", size)
    return size

    # دسترسی به مقدار وزن
def fetch_weight(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    weight = None
    for spec in specifications:
        if spec.get("title") == "مشخصات کلی":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "وزن":
                    weight = attribute.get("values", [None])[0]
                    weight = extract_number(weight)
                    break
            break
    #print("weight:", weight)
    return weight


# دسترسی به مقدار pixel
def fetch_pixel(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    pixel = None
    pattern = r"رزولوشن[\s_\-]*صفحه[\s_\-]*نمایش"
    for spec in specifications:
        if spec.get("title") == "صفحه نمایش":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                attribute_title = str(attribute.get("title", ""))
                if re.search(pattern, attribute_title):  # بررسی تطابق عنوان با الگوی Regex
                    pixel = attribute.get("values", [None])[0]
                    if pixel:  # اگر مقدار وجود داشت
                        pixel = extract_pixel(pixel)
                    break
            break
    #print("pixel:", pixel)
    return pixel


# دسترسی به مقدار باتری
def fetch_battery(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    battery = None
    for spec in specifications:
        if spec.get("title") == "سایر مشخصات":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "ظرفیت باتری":
                    battery = attribute.get("values", [None])[0]
                    battery = extract_battery(battery)
                    break
            break
    #print("battery:", battery)
    return battery

# دسترسی به حافظه داخلی
def fetch_internal_memory(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    internal_memory = None
    for spec in specifications:
        if spec.get("title") == "حافظه":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "حافظه داخلی":
                    internal_memory = attribute.get("values", [None])[0]
                    if internal_memory:  # بررسی مقدار قبل از استفاده
                        internal_memory = extract_battery(internal_memory)
                    else:
                        internal_memory = "unknown"  # مقدار پیش‌فرض در صورت None
                    break
            break
    #print("internal_memory:", internal_memory)
    return internal_memory

    # دسترسی به رم
def fetch_ram(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    ram = None
    for spec in specifications:
        if spec.get("title") == "حافظه":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "مقدار RAM":
                    ram = attribute.get("values", [None])[0]
                    if ram:  # بررسی مقدار قبل از استفاده
                        ram = extract_battery(ram)
                    else:
                        ram = "unknown"  # مقدار پیش‌فرض در صورت None
                    break
            break
    #print("ram:", ram)
    return ram

# دسترسی به cpu
def fetch_cpu(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    cpu = None
    for spec in specifications:
        if spec.get("title") == "پردازنده":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "فرکانس پردازنده‌ مرکزی":
                    cpu = attribute.get("values", [None])[0]
                    if cpu:  # بررسی مقدار قبل از استفاده
                        cpu = extract_battery(cpu)
                    else:
                        cpu = "unknown"  # مقدار پیش‌فرض در صورت None
                    break
            break
    #print("cpu:", cpu)
    return cpu


# دسترسی به رزولوشن
def fetch_main_camera_resolution(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    main_camera_resolution = None
    for spec in specifications:
        if spec.get("title") == "دوربین":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "رزولوشن دوربین اصلی":
                    main_camera_resolution = attribute.get("values", [None])[0]
                    if main_camera_resolution:  # بررسی مقدار قبل از استفاده
                        main_camera_resolution = extract_battery(main_camera_resolution)
                    else:
                        main_camera_resolution = "unknown"  # مقدار پیش‌فرض در صورت None
                    break

            break
    #print("main_camera_resolution:", main_camera_resolution)
    return main_camera_resolution


# دسترسی به 5G
def fetch_ict(id):
    productInfo = fetch_product_info(id)
    specifications = productInfo.get("specifications", [])
    ict = False
    for spec in specifications:
        if spec.get("title") == "ارتباطات":
            attributes = spec.get("attributes", [])
            for attribute in attributes:
                if attribute.get("title") == "شبکه‌های مخابراتی":
                    ict_network = attribute.get("values", [None])
                    #print("ict_network:", ict_network)
                    for element in ict_network:
                        if element.strip() == "5G":
                            ict = True
                            break
                break
            break
    #print("ict:", ict)
    return ict


# ذخیره  جزییات به صورت تاپل
def fetch_product_detail(product_ids):
    product_detail = {}  # مقداردهی اولیه
    for id in product_ids:
        selling_price = fetch_price(id)
        model = fetch_model(id)
        size = fetch_size(id)
        weight = fetch_weight(id)
        pixel = fetch_pixel(id)
        battery = fetch_battery(id)
        internal_memory = fetch_internal_memory(id)
        ram = fetch_ram(id)
        cpu = fetch_cpu(id)
        main_camera_resolution = fetch_main_camera_resolution(id)
        ict = fetch_ict(id)
        product_detail[id] = (selling_price, model, size, weight, pixel, battery, internal_memory, ram, cpu,
                                  main_camera_resolution, ict)  # افزودن تاپل
        print("product_detail in fetch_product_detail methode is: ")
        print(product_detail)
    return product_detail



# درج داده‌ها در جدول

def insert_product_data(product_detail):
    connection = get_database_connection()
    cursor = connection.cursor()
    for product_id, value in product_detail.items():
        try:
            cursor.execute("""
                            INSERT INTO products (
                                id, price, model, size, weight, pixel, battery, internal_memory, ram, cpu, main_camera_resolution, ict, created_at, updated_at
                            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                            ON CONFLICT (id) DO UPDATE SET
                             price = EXCLUDED.price,
                             model = EXCLUDED.model,
                             size = EXCLUDED.size,
                             weight = EXCLUDED.weight,
                             pixel = EXCLUDED.pixel,
                             battery = EXCLUDED.battery,
                             internal_memory = EXCLUDED.internal_memory,
                             ram = EXCLUDED.ram,
                             cpu = EXCLUDED.cpu,
                             main_camera_resolution = EXCLUDED.main_camera_resolution,
                             ict = EXCLUDED.ict,
                             updated_at = EXCLUDED.updated_at
                        """, (

                product_id,
                value[0],  # price
                value[1],  # model
                value[2],  # size
                value[3],  # weight
                value[4],  # pixel
                value[5],  # battery
                value[6],  # internal_memory
                value[7],  # ram
                value[8],  # cpu
                value[9],  # main_camera_resolution
                value[10],  # ict
                datetime.now(),
                datetime.now()

            ))
        except Exception as e:
            print(f"Error inserting product data: {e}")

    connection.commit()
    cursor.close()
    connection.close()


def main():
    product_ids = []
    price = {}
    try:
        print("Start methode of: fetch_product_ids")
        product_ids = fetch_product_ids()
        print(" the end of methode: fetch_product_ids")
        print(product_ids)
        print("Start methode of: fetch_product_detail")
        product_Information = fetch_product_detail(product_ids)
        print(" the end of methode: fetch_product_detail")
        print(product_Information)
        print("start method of: insert_product_data")
        insert_product_data(product_Information)
        print(" the end of methode: insert_product_data")
    except Exception as e:
        print(f"Error occurred: {e}")

#The End!!vsffggfd
if __name__ == "__main__":
    main()

