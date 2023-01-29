import mysql.connector as sqlcon
import time

# A delay of time is needed to ensure proper db initialization

time.sleep(20)

# Mysql variables defined for connection

conn=sqlcon.connect(host='db',
                            user='db_user',
                            password='user_password',
                            database='app_db',
                            port="3306")

# We can use this function to test the connection (not used)

def connect():

    try:

        conn

        if conn.is_connected():
            db_Info = conn.get_server_info()
            print("Connected to MySQL Server version ", db_Info)
            cursor = conn.cursor()
            cursor.execute("select database();")
            record = cursor.fetchone()
            print("You're connected to database: ", record)

    except sqlcon.Error as err:
            print("Error while connecting to MySQL",err)

    else:
        conn.close()

# This is the function to insert initial queries

def insert_querys():
    try:   
        
        # Example querys
         
        sql_country = """
            INSERT INTO country (country_id,country_name) 
            VALUES ('1','España'),
            ('2','Alemania'),
            ('3','Belgica'),
            ('4','Holanda'),
            ('5','Italia')
            """
        sql_city = """
            INSERT INTO city (city_id,city_name,country_id) 
            VALUES ('1','Sevilla','1'),
            ('2','Hamburgo','2'),
            ('3','Bruselas','3'),
            ('4','Amsterdam','4'),
            ('5','Bolonia','5')
            """
        sql_products = """ 
            INSERT INTO product (product_id,name)
            VALUES 
            ('1','Nokia_3310'),
            ('2','Nokia_N70'),
            ('3','Nokia_3410'),
            ('4','Nokia_1600'),
            ('5','Nokia_6150')
            """
        cursor = conn.cursor()

        # We need to execute each query sepparately

        cursor.execute(sql_country)
        cursor.execute(sql_city)
        cursor.execute(sql_products)
        conn.commit()
        print(cursor.rowcount, "Records inserted successfully into tables")
        cursor.close()
        conn.close()

        # Raises an error if case is not working properly

    except sqlcon.Error as error:
        print("Failed to insert the records {}".format(error))
    
if __name__ == '__main__':

    insert_querys()