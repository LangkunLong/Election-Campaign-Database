-- could not check the overlap of candidates, volunteers, and staff in a campaign
-- Assume all volunteers and staff are workers
-- extra: add constraint on amounts of donation wo be equal or greater than 0
-- extra: add constraint on spending_limit
DROP SCHEMA if EXISTS Election CASCADE;


CREATE SCHEMA Election
-- election campaigns are uniquely identified by its campaign id
  CREATE TABLE ElectionCampaigns (
    campaign_id INTEGER PRIMARY KEY,
    spending_limit FLOAT NOT NULL,
    CONSTRAINT spending_limit_check CHECK (spending_limit >= 0)
  )

-- candidates volunteers and Staff are uniquely identified by its email
-- they both have a campaign id which refers to which campaign they participated in 
  CREATE TABLE Candidate (
    campaign_id INTEGER NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES ElectionCampaigns(campaign_id),
    candidate_email TEXT PRIMARY KEY,
    c_name TEXT
  )

-- use end_time minus the start_time to get the time blocks that is assigned to this email
-- worker is uniquely identified by its email. either volunteer_email or Staff email
-- and we check if the campaign_activity is in the assigned two activities
-- Because we assume that volunteers and staff are all workers, 
  CREATE TABLE Volunteer (
    campaign_id INTEGER,
    FOREIGN KEY (campaign_id) REFERENCES ElectionCampaigns(campaign_id),
    volunteer_email TEXT,
    start_time TIMESTAMP NOT NULL, 
    end_time TIMESTAMP NOT NULL,
    campaign_activity TEXT NOT NULL,
    CHECK (campaign_activity = 'phone banks' OR campaign_activity = 'door-to-door canvassing'),
    PRIMARY KEY (volunteer_email, start_time, end_time),
    v_name TEXT
  )

  CREATE TABLE Staff (
    campaign_id INTEGER,
    FOREIGN KEY (campaign_id) REFERENCES ElectionCampaigns(campaign_id),
    staff_email TEXT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    campaign_activity TEXT NOT NULL,
    CHECK (campaign_activity = 'phone banks' OR campaign_activity = 'door-to-door canvassing'),
    PRIMARY KEY (staff_email, start_time, end_time),
    s_name TEXT
  )

  CREATE TABLE Moderator (
    moderator_email TEXT PRIMARY KEY,
    m_name TEXT
  )

-- Debate id uniquely identifies the one debate 
-- The date_time represents the date and time of the debate 
-- Use Unique to avoid the same moderator attending two or more debates at the same date and time
  CREATE TABLE Debate (
    debate_id INTEGER PRIMARY KEY,
    date_time TIMESTAMP NOT NULL,
    moderator_email TEXT NOT NULL,
    FOREIGN KEY (moderator_email) REFERENCES Moderator(moderator_email),
    UNIQUE (date_time, moderator_email)
  )

-- To avoid the same candidate attending two or more debates at same time, 
-- use pair of (debate_id and candidate_email) as primary key to avoid duplicate 
-- and allow multiple candidates in one debate
  CREATE TABLE DebateCandidates (
    debate_id INTEGER, 
    FOREIGN KEY (debate_id) REFERENCES Debate(debate_id),
    candidate_email TEXT,
    FOREIGN KEY (candidate_email) REFERENCES Candidate(candidate_email),
    PRIMARY KEY (debate_id, candidate_email)
  )

-- donors are uniquely identdied by their email, donor_campaign_id, donate_amount, is_indivaidual
-- is organization or not
-- each donor contains a campaign id which refers the campaign they donated
-- Two boolean are used to identify wheether the donor is organization or individual 

  CREATE TABLE Donor (
    address TEXT,
    donor_email TEXT,
    donate_amount FLOAT,
    CHECK (donate_amount >= 0),
    donor_campaign_id INTEGER,
    FOREIGN KEY (donor_campaign_id) REFERENCES ElectionCampaigns(campaign_id),
    PRIMARY KEY (donor_email, donor_campaign_id, donate_amount, donation_type),
    donation_type TEXT NOT NULL, 
    CHECK (donation_type = 'Individual' OR donation_type = 'Organization')
  );