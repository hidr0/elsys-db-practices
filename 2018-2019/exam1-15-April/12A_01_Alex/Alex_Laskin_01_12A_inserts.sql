USE school;

INSERT INTO user(name,username) VALUES('Alex','AlexUsername');
INSERT INTO user(name,username) VALUES('Another','AnotherUsername');
INSERT INTO user(name,username) VALUES('Other','OtherUsername');
INSERT INTO channel(name,user_id) VALUES('One',1);
INSERT INTO channel(name,user_id) VALUES('Two',2);
INSERT INTO channel(name,user_id) VALUES('Three',3);
INSERT INTO video(name,channel_id,views) VALUES('FirstVideo',1,10);
INSERT INTO video(name,channel_id,views) VALUES('SecondVideo',2,20);
INSERT INTO video(name,channel_id,views) VALUES('ThirdVideo',2,30);

-- UPDATE video SET views = 100 WHERE id = 1;
-- SELECT * FROM user u 
-- LEFT JOIN channel c ON u.id = c.user_id LEFT JOIN video v ON c.id = v.channel_id;
-- Testing purposes