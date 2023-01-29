import psycopg2
import os
from kafka import KafkaConsumer
from time import sleep  
from json import loads

# Define function for connection to postgres database

def connect():
    try:
        return psycopg2.connect(user=f"{os.getenv('POSTGRES_USER', 'postgres')}",
                                password=f"{os.getenv('POSTGRES_PASSWORD', 'postgresadmin')}",
                                host=f"{os.getenv('POSTGRES_HOST', 'db')}",
                                port=f"{os.getenv('POSTGRES_PORT', '5432')}",
                                database=f"{os.getenv('POSTGRES_DB', 'pg_db')}")
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)

# Define Kafka consumer to receive messages from topic 'topic_test'

consumer = KafkaConsumer(
    'topic_test',
     bootstrap_servers=['kafka:29092'],
     auto_offset_reset='earliest',
     enable_auto_commit=True,
     group_id='my-group',
     value_deserializer=lambda x: loads(x.decode('utf-8')))


# Define function to store messages from kafka topic in pg database 

def receive_messages():

    while True:
            print("Start receiving data")
            for m in consumer:
                m = m.value
                try:
                    conn = connect()
                    name_id = m['title']
                    description =m['description']
                    rating = m['rating']
                    brand = m['brand']

                    sql = """
                        INSERT INTO kafka (name_id, description, rating, brand)
                        VALUES (%s,%s,%s,%s)
                        """
                    cursor = conn.cursor()
                    cursor.execute(sql,(name_id, description, rating, brand))
                    conn.commit()
                except (Exception, psycopg2.Error):
                    print("Esperando a la base de datos ...")
                sleep(5)
                
if __name__ == '__main__':
    receive_messages()

