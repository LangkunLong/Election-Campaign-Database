SET search_path TO election;
  -- campaigns: 
  INSERT INTO ElectionCampaigns VALUES (1, 10000);
  INSERT INTO ElectionCampaigns VALUES (2, 50000);
  INSERT INTO ElectionCampaigns VALUES (3, 1000000);

  -- candidates: 
  INSERT INTO Candidate VALUES (1, 'larry@gmail.com', 'Larry');
  INSERT INTO Candidate VALUES (1, 'John_wick@hotmail.com', 'John');
  INSERT INTO Candidate VALUES (2, 'shulin@yahoo.com', 'Shulin');
  INSERT INTO Candidate VALUES (2, 'adam@gmail.com', 'Adam');
  INSERT INTO Candidate VALUES (3, 'James@gmail.com', 'James');
  INSERT INTO Candidate VALUES (3, 'ontarioMayor@gmail.com', 'Doug Ford');
  INSERT INTO Candidate VALUES (3, 'realdonaldtrump@gmail.com');

-- volunteers:
INSERT INTO Volunteer VALUES 
(1,'andy@gmail.com','2023-05-03 09:00:00','2023-05-03 15:00:00','door-to-door canvassing', 'Andy');
INSERT INTO Volunteer VALUES 
(1,'andy@gmail.com','2023-05-04 11:00:00','2023-05-04 14:00:00','phone banks', 'Andy');
INSERT INTO Volunteer VALUES 
(2,'andy@gmail.com','2023-05-05 11:00:00','2023-05-05 14:00:00','phone banks', 'Andy');
INSERT INTO Volunteer VALUES 
(2,'andy@gmail.com','2023-05-06 11:00:00','2023-05-06 14:00:00','door-to-door canvassing', 'Andy');
INSERT INTO Volunteer VALUES 
(2,'forrest@gmail.com','2023-05-03 09:00:00','2023-05-03 15:00:00','phone banks', 'Forrest');
INSERT INTO Volunteer VALUES 
(3,'andy@gmail.com','2023-05-07 08:00:00','2023-05-07 10:00:00','door-to-door canvassing', 'Andy');
INSERT INTO Volunteer VALUES 
(3,'trumpjr@gmail.com','2023-05-03 09:00:00','2023-05-03 18:00:00','phone banks', 'Trump Junior');
INSERT INTO Volunteer VALUES 
(3,'andy@gmail.com','2023-05-08 10:00:00','2023-05-08 15:00:00','phone banks', 'Andy');

--staff:
INSERT INTO Staff VALUES 
(1,'jack@gmail.com','2023-04-03 09:00:00','2023-04-03 17:00:00','door-to-door canvassing', 'Jack Sparrow');
INSERT INTO Staff VALUES 
(2,'ryan@hotmail.com','2023-05-04 13:00:00','2023-05-03 17:00:00','phone banks', 'Ryan');
INSERT INTO Staff VALUES 
(3,'jonathon@yahoo.com','2023-05-04 07:00:00','2023-05-03 10:00:00','phone banks', 'Jonathan');

--moderators: 
INSERT INTO Moderator VALUES 
('jordanpete@gmail.com', 'Jordan Peterson');
INSERT INTO Moderator VALUES 
('joeBiden@gmail.com', 'Joe Biden');
INSERT INTO Moderator VALUES 
('andrewtate@hotmail.com', 'Andrew Tate');

--debates:
INSERT INTO Debate VALUES 
(1, '2023-06-10 18:00:00','joeBiden@gmail.com');
INSERT INTO Debate VALUES 
(2, '2023-06-10 20:00:00','jordanpete@gmail.com');
INSERT INTO Debate VALUES 
(3, '2023-06-11 18:00:00','joeBiden@gmail.com');
INSERT INTO Debate VALUES 
(4, '2023-06-11 20:00:00','andrewtate@hotmail.com');

--debate candidates: 
INSERT INTO DebateCandidates VALUES (1, 'larry@gmail.com');
INSERT INTO DebateCandidates VALUES (1, 'ontarioMayor@gmail.com');
INSERT INTO DebateCandidates VALUES (1, 'realdonaldtrump@gmail.com');
INSERT INTO DebateCandidates VALUES (2, 'realdonaldtrump@gmail.com');
INSERT INTO DebateCandidates VALUES (2, 'John_wick@hotmail.com');
INSERT INTO DebateCandidates VALUES (3, 'realdonaldtrump@gmail.com');
INSERT INTO DebateCandidates VALUES (3, 'shulin@yahoo.com');
INSERT INTO DebateCandidates VALUES (3, 'adam@gmail.com');
INSERT INTO DebateCandidates VALUES (4, 'realdonaldtrump@gmail.com');
INSERT INTO DebateCandidates VALUES (4, 'James@gmail.com');

--donors: 
INSERT INTO Donor VALUES 
('St Michaels Street', 'uoft@gmail.com', 20000, 3, 'Organization');
INSERT INTO Donor VALUES 
('37 Grosvenor St', 'Toronto_help@gmail.com', 10000, 3, 'Organization');
INSERT INTO Donor VALUES 
('44 Gerrard St', 'allen@gmail.com', 20, 1, 'Individual');
INSERT INTO Donor VALUES 
('44 Gerrard St', 'allen_brother@gmail.com', 50, 1, 'Individual');
INSERT INTO Donor VALUES 
('Harbord Front', 'richguy@gmail.com', 100000, 2, 'Individual');