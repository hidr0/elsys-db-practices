INSERT INTO user(username,name) VALUES('Tester','Test');
INSERT INTO user(username,name) VALUES('New Tester','Testov');
INSERT INTO user(username,name) VALUES('Next Tester','Tested');

INSERT INTO channel(user_id,name) VALUES(1,'Test');
INSERT INTO channel(user_id,name) VALUES(2,'Test');
INSERT INTO channel(user_id,name) VALUES(3,'Test');

INSERT INTO userChannels(user_id,channel_id) VALUES(1,1);
INSERT INTO userChannels(user_id,channel_id) VALUES(2,2);
INSERT INTO userChannels(user_id,channel_id) VALUES(3,3);

INSERT INTO video(name,channel_id) VALUES('Next Tester',1);
INSERT INTO video(name,channel_id) VALUES('Next Tester',2);
INSERT INTO video(name,channel_id) VALUES('Next Tester',2);
