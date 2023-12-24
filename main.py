import psycopg2


username = 'protyven_labs'
password = '123'
database = 'labs-db'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT review.stars AS grade, ramen.variety
FROM ramen NATURAL JOIN review
WHERE ramen.brand_name = 'Wei Wei';
'''

query_2 = '''
SELECT ramen.variety AS variety, review.stars AS grade
FROM ramen
NATURAL JOIN review
WHERE review.stars =(SELECT MAX(stars) FROM review);
'''

query_3 = '''
SELECT ramen.variety, brand.brand_name, review.stars
FROM ramen JOIN brand
ON ramen.brand_name = brand.brand_name
JOIN review
ON ramen.review_id = review.review_id
ORDER BY review.stars DESC;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute(query_1)

    print('Вивести оцінки для бренду "Wei Wei" разом з різновидом Рамену')
    for row in cur:
        print(f'Grade: {row[0]}; Variety: {row[1]}')

    cur.execute(query_2)

    print('\nВивести різновид Рамену, який має найбільшу оцінку (вивести оцінку також)')
    for row in cur:
        print(f'Variety: {row[0]}; Grade: {row[1]}')

    cur.execute(query_3)

    print('\nВивести назви всіх Раменів та їх виробників (бренд) за зменшенням оцінки')
    for row in cur:
        print(f'Variety: {row[0]}; Brand: {row[1]}; Grade: {row[2]}')

        