USE instagram;

INSERT INTO users (username, number_of_likes_on_own_post) VALUES ('Peter Geshov', 12), ('Maria Koceva', 30), ('Ivo Mihov', 15);

INSERT INTO posts (name, user_id) VALUES ('football', 1), ('baseball', 1), ('hairstyles', 2), ('dress', 2), ('geckos', 3), ('tarantulas', 3);

INSERT INTO likes (user_id, post_id) VALUES (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (3, 1), (3, 2), (3, 3);