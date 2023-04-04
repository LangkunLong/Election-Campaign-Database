--subquery: 

-- 1. List total organizational donations and total individual donations for each campaign.

--revoke all priviledges: 
REVOKE ALL ON ElectionCampaigns, Candidate, Volunteer, Staff, Moderator, Debate, DebateCandidates, Donor FROM <userid>;

--grant minimum priviledges needed:
GRANT SELECT(campaign_id) ON ElectionCampaigns TO <userid>;
GRANT SELECT(donor_campaign_id, donation_type, donate_amount) ON Donor to <userid>;

SELECT ElectionCampaigns.campaign_id AS Campaign_ID, SUM(Donor.donate_amount) AS Total_Organization_Donations
FROM ElectionCampaigns JOIN Donor ON ElectionCampaigns.campaign_id = Donor.donor_campaign_id 
WHERE Donor.donation_type = 'Organization'
GROUP BY ElectionCampaigns.campaign_id;

SELECT ElectionCampaigns.campaign_id AS Campaign_ID, SUM(Donor.donate_amount) AS Total_Individual_Doations 
FROM ElectionCampaigns JOIN Donor ON ElectionCampaigns.campaign_id = Donor.donor_campaign_id 
WHERE Donor.donation_type = 'Individual'
GROUP BY ElectionCampaigns.campaign_id;

--2. Find those volunteers who offer to work on every campaign in the dataset.

--revoke all priviledges: 
REVOKE ALL ON ElectionCampaigns, Candidate, Volunteer, Staff, Moderator, Debate, DebateCandidates, Donor FROM <userid>;

--grant minimum priviledges needed:
GRANT SELECT(campaign_id) ON ElectionCampaigns TO <userid>;
GRANT SELECT(campaign_id, volunteer_email) ON Volunteer TO <userid>;

DROP VIEW IF EXISTS all_volunteer_campaign CASCADE;
DROP VIEW IF EXISTS missing_volunteers CASCADE;

CREATE VIEW all_volunteer_campaign AS
SELECT DISTINCT ElectionCampaigns.campaign_id, Volunteer.volunteer_email
FROM ElectionCampaigns, Volunteer;

CREATE VIEW missing_volunteers AS
SELECT DISTINCT volunteer_email
FROM all_volunteer_campaign
WHERE (campaign_id, volunteer_email) NOT IN (
  SELECT Volunteer.campaign_id, Volunteer.volunteer_email
  FROM Volunteer
);

SELECT Volunteer_Email AS Volunteer_in_all_campaigns
FROM all_volunteer_campaign
EXCEPT (SELECT Volunteer_Email FROM missing_volunteers);

--3. Find candidates who are involved in every debate.

--revoke all priviledges: 
REVOKE ALL ON ElectionCampaigns, Candidate, Volunteer, Staff, Moderator, Debate, DebateCandidates, Donor FROM <userid>;

--grant minimum priviledges needed:
GRANT SELECT(debate_id) ON Debate TO <userid>;
GRANT SELECT(candidate_email, debate_id) ON DebateCandidates TO <userid>;

DROP VIEW IF EXISTS all_candidate_debates CASCADE;
DROP VIEW IF EXISTS missing_candidates CASCADE;

CREATE VIEW all_candidate_debates AS
SELECT DISTINCT Debate.debate_id, DebateCandidates.candidate_email
FROM Debate, DebateCandidates;

CREATE VIEW missing_candidates AS
SELECT DISTINCT candidate_email
FROM all_candidate_debates
WHERE (debate_id, candidate_email) NOT IN (
  SELECT DebateCandidates.debate_id, DebateCandidates.candidate_email
  FROM DebateCandidates
); 

SELECT candidate_email AS Candidate_in_every_debate
FROM all_candidate_debates
EXCEPT (SELECT candidate_email FROM missing_candidates);