-- 1 (G column)
-- Вивести оцінки для бренду "Wei Wei" разом з різновидом Рамену
-- SELECT review.stars AS grade, ramen.variety
-- FROM ramen NATURAL JOIN review
-- WHERE ramen.brand_name = 'Wei Wei'



-- 2 (H column)
-- Вивести різновид Рамену, який має найбільшу оцінку (вивести оцінку також)
-- SELECT ramen.variety AS variety, review.stars AS grade
-- FROM ramen
-- NATURAL JOIN review
-- WHERE review.stars =(SELECT MAX(stars) FROM review)



-- 3 (I column)
-- Вивести назви всіх Раменів та їх виробників (бренд) за зменшенням оцінки
-- SELECT ramen.variety, brand.brand_name, review.stars
-- FROM ramen JOIN brand
-- ON ramen.brand_name = brand.brand_name
-- JOIN review
-- ON ramen.review_id = review.review_id
-- ORDER BY review.stars DESC

