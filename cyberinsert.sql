-- REGION table
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (1, 'Rust Ring', 'Loop', '', 'An area with abondoned buildongs, corporate headquarters, and gang strongholds on the same block');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (2, 'New Chicago', 'Old Town', '', 'Location of the new corpo center');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (3, 'Lincolnville', 'Lincoln Park', '', 'Home to most of the native Chicago residents with a sizable port');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (4, 'Heartland', 'Hyde Park', '', 'The land directly effected by the heartland' );
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (5, 'Grim Haven Medical Quarter', 'Medical District', '', 'Old advanced cybernetics and medical district');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (6, 'Infected Wards', 'West Loop', '', 'Large hab complexes turned into gasmask required bazzars and gang strongholds');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (7, 'The United Train Depot', 'Garfield', '', 'Massive train graveyard');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (8, 'Garfield biotanical sector', 'Garfield park', '', 'Large scale stack farms that create a large amount of the cities slop');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (9, 'Chicago Water District', 'Goose Island', '', 'Water purification mega fortress held by the CTA');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (10, 'Viral Heights', 'Little Village', '', 'Plague ridden sprawl most affected by Heartland');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (11, 'Little italy', 'Homan Square', '', 'Small fronteir village ');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (12, 'Little La Cino', 'Humbold Park', '', 'Hispanic town');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (13, 'Japan Town', 'Bucktown', '', 'Highly industrialized zone with small port');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (14, 'The Ruined Sprawl', 'West Garfield Park', '', 'The edge of the west subarbs that were destroyed and salted');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (15, 'Europa', 'Irving Park', '', 'Where a large amount of native europeans fled after Heartland');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (16, 'The False Jungle', 'River West', '', 'Original corporation rebuild that was destroyed, creating a tangle of iron and wires');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (17, 'Scrap Ward', 'Logan Square', '', 'Area used to dump scrap in the past');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (18, 'Fools Passage', 'Little Italy', '', 'Small passage the is clear from plague during short time');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (19, 'Dillingers Folly', 'Ukrainian Village', '', 'Area on the north side of the plague wall');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (20, 'Arcadia', 'Arcadia Terrace', '', 'Mega rich area with more security cameras than streetsigns');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (21, 'GrayLand', 'Old Irving Park', '', 'Boring Place  ');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (22, 'Aurora Wastes', 'Archer Heights', '', 'Abandoned land consumed by plague and sand');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (23, 'Upper marina', 'Edgewater', '', 'Large harbors');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (24, 'Tunnel System', 'CTA Underground Train Network', '', 'Tunnel system used to survive after the bombs');
INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION) VALUES (25, 'Unknown', 'N/A', '', 'N/A');
-- Locations table
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (1, 'Ukrainian Station', 'Town', 'Dillingers Folly', 'Village in a station clinging on to life', 'Sadness');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (2, 'Inner harbor', 'Port', 'Japan Town', 'Small port ran by the Japanese', 'Smuggling');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (3, 'Chicago Harbor', 'Port', 'New Chicago', 'Main port of Chicago', 'Port');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (4, 'Montrose Harbor', 'Port', 'Lincolnville', 'Harbor ran by locals, gangers, and nomads', 'Port');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (5, 'Antipothy Fashion', 'Store', 'New Chicago', 'Upscale fashion store', 'Clothes');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (6, 'NET Narcotics', 'Store', 'Tunnel System', 'Just a drug store', 'Medication and cybernetics');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (7, 'Lower Wacker', 'Tunnels', 'Rust Ring', 'The massive train system developed under chicago that were flooded be the expirements done in Heartland', 'Old Tech');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (8, 'Stop n Sync', 'Hotel', 'New Chicago', 'Small hostile to eat and sleep', 'Sleep');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (9, 'Line Rack', 'Hotel', 'Tunnel System', 'super small sleeping spaces for a discounted price', 'Sleep');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (10, 'Alfies Arms', 'Store', 'New Chicago', 'Guns and armerment supplied by Alfie', 'Guns');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (11, 'Organicorp Ruins Building', 'Building', 'The False Jungle', 'Large corporate multi-structure that was abondoned after sabotage and the war', 'Corporate Secrets');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (12, 'The Plague Barrier', 'Wall', 'Dillingers Folly', 'A massive wall that separates the relatively safe areas of New Chicago from the plague.', 'Sadness');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (13, 'Osheas Pub', 'Bar', 'Tunnel System', 'Irish pub', 'Booze');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (14, 'Jewel-Osco-Brown', 'Store', 'New Chicago', 'grociries, drugs, and cybernetics all in one place', 'everything');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (15, 'university of chicago', 'Building', 'Heartland', 'center of the Heartland disaster', 'answers');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (16, 'Heaps and Holes', 'Store', 'Scrap Ward', 'Scrap yard with holes of trash', 'Forgotten goods');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (17, 'The Depot', 'Bar', 'The United Train Depot', 'Bar set up in an outer depot building', 'Booze');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (18, 'The Hub Building', 'Building', 'The United Train Depot', 'Main depot structure', 'Tech');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (19, 'Deadline Hospital', 'Building', 'Grim Haven Medical Quarter', 'Formarly Rush Hospital - Was overran with paicents during the outbreak', 'Medical equipment');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (20, 'Metro Tunnels', 'Underground', 'Tunnel System', 'Slums of the tunnels that surround the major stations', 'Training Grounds');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (21, 'Emerald City', 'Underground', 'Tunnel System', 'Once a dumping ground, now cleaned up', 'Largest Underground City');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (22, 'Chicago Port', 'City', 'New Chicago', 'Large domed city', 'haymarket');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (23, 'Elevated Tracks', 'Trade Route', 'New Chicago', 'Tracks used to traverse much of the old city', 'Traversal path');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (24, 'Toppled Towers', 'Building', 'Rust Ring', 'Two large towers in the loop that crumbled into each other during the corperate war, people are starting to see it as a symbol of chicagos comradory and resilience, use to be owned by Militech', 'Corporate Secrets');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (25, 'Maggie Daley Spire', 'Building', 'Rust Ring', 'One of the main corpo buildings in the loop, still owned and operated by CellForge Industries who keeps its sensitive tests in the hermetically sealed walls of the lower spires', 'Corporate Headquarters');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (26, 'The Haymarket', 'Shopping', 'New Chicago', 'Chicago Port market sector', 'Buying and Selling goods');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (27, 'Rebreathers Respite', 'Bar', 'Aurora Wastes', 'Bar and Hostle in the middle of the wastes', 'Food and Rest');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (28, 'Unknown', 'N/A', 'Unknown', 'N/A', 'N/A');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (29, 'The Chrome Cathedral', 'Stronghold', 'New Chicago', 'A repurposed church that now serves as the headquarters for a cyber-modification cult', 'God');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (30, 'The Elevated Bazaar', 'Bar', 'New Chicago', 'A series of interconnected platforms and structures. marketplace stretches for miles. Mag-lev carts zip along the old tracks.', 'Goods');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (31, 'Greps Ghost Node', 'Nest', 'Infected Wards', 'A massive server farm disguised as an unremarkable warehouse.', 'Data');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (32, 'The Aqua-Scraper', 'Building', 'Rust Ring', 'A partially submerged skyscraper that extends deep into Lake Michigan', 'Secrets');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (33, 'The NetRunners Nest', 'Nest', 'Tunnel System', 'A repurposed subway station that now serves as the central hub for Chicago''s netrunner community.', 'experts');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (34, 'WolfPoint CEOs House', 'Home', 'Arcadia', 'Home of wolfpoints ceo', 'Money');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (35, 'Garfield Botanical Center', 'Lab', 'Garfield biotanical sector', 'Biolab', 'Science');
INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST) VALUES (36, 'The Plague Asylum', 'Hospital', 'Little italy', 'A fortified medical complex dedicated to researching and treating victims of the wasting plague', 'Medicine');
-- GROUPS table
--INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (1, 'Bears Battalion', 'Security Force', 'Chicago Port', 20, 'Triniti Blacksan, Rack Parser');
--INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (2, 'WolfPoint Security', 'Security Force', 'Chicago Port', 100, '');
--INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (3, 'The Rail Splitters', 'Gang', 'Elevated Tracks', 7, 'Vira Yamaha');
--INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (4, 'Chi-Port Reporter', 'Company', 'Chicago Port', 50, 'Pip Borg');
--INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (5, 'Solos', 'Individuals', 'Metro Tunnels', 2, 'Grep Three');
--INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (6, 'Chrome Alley Gang', 'Gang', 'Chicago Port', 5, 'Crash Phasers');
--INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (7, 'Midport Marauders', 'Nomad Family', 'Rebreathers Respite', 5, 'Dyna Switch');
INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (1, 'Bears Battalion', 'Security Force', 'Chicago Port', 20, '');
INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (2, 'WolfPoint Security', 'Security Force', 'Chicago Port', 100, '');
INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (3, 'The Rail Splitters', 'Gang', 'Elevated Tracks', 7, '');
INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (4, 'Chi-Port Reporter', 'Company', 'Chicago Port', 50, '');
INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (5, 'Solos', 'Individuals', 'Metro Tunnels', 2, '');
INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (6, 'Chrome Alley Gang', 'Gang', 'Chicago Port', 5, '');
INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS) VALUES (7, 'Midport Marauders', 'Nomad Family', 'Rebreathers Respite', 5, '');
-- Characters table
INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION) VALUES (1, 'Grep Three', 'NetRunner', 'thought dead', 'Metro Tunnels', 'Legendary NetRunner', 'Solos');
INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION) VALUES (2, 'Triniti Blacksan', 'Lawman', 'firy', 'Chicago Port', 'Right hand of Rack Parser wants to blow stuff up', 'Bears Battalion');
INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION) VALUES (3, 'Pip Borg', 'Media', 'wants the scoop', 'Chicago Port', 'A reporter', 'Chi-Port Reporter');
INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION) VALUES (4, 'Rack Parser', 'Lawman', 'loves city', 'Chicago Port', 'Leader of the gate guards', 'Bears Battalion');
INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION) VALUES (5, 'Vira Yamaha', 'Solo', 'True believer', 'Elevated Tracks', 'Smart and tenacious, is currently doing whatever is asked to get ahead', 'The Rail Splitters');
INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION) VALUES (6, 'Crash Phasers', 'Solo', 'Headstrong', 'Chicago Port', 'Chrome Alley Gang Leader', 'Chrome Alley Gang');
INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION) VALUES (7, 'Dyna Switch', 'Tech', 'Never leave a member behind', 'The Elevated Bazaar', 'Midport Marauders mook', 'Midport Marauders');

-- AFFILIATIONS table
--INSERT INTO AFFILIATIONS (character_id, group_id) VALUES (1, 4);
--INSERT INTO AFFILIATIONS (character_id, group_id) VALUES (2, 1);
--INSERT INTO AFFILIATIONS (character_id, group_id) VALUES (3, 3);
--INSERT INTO AFFILIATIONS (character_id, group_id) VALUES (4, 1);
--INSERT INTO AFFILIATIONS (character_id, group_id) VALUES (5, 2);
--INSERT INTO AFFILIATIONS (character_id, group_id) VALUES (6, 6);


-- POINTSOFINTEREST table
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (1, 1, 2);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (2, 2, 2);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (3, 3, 1);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (4, 4, 1);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (5, 5, 3);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (6, 6, 3);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (7, 7, 1);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (8, 8, 4);
--INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID) VALUES (9, 9, 5);

-- ENCOUNTERS table
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (1, 'Trauma Team', 'Corporate', 'Midnight', 'Trauma Team unit, 2 security officers, six wounded gangers', 'The AV-4 hits the ground in the middle of a recent firefight and the medics start tending to the half-dozen wounded gangers. They figure youre part of the problem and the 2 security officers open up with Assault Rifles.', '', '', 'Combat');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (2, 'Private Investigator', 'Corporate', 'Midnight', '1 PI', 'A PI armed with a Very Heavy Pistol and a machete and wearing a Light Armorjack. They stop you and ask you whether youve seen the person theyre following. The PI is armed with a heavy caliber revolver and wearing an armor jacket.', '', '', 'Passingby');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (3, 'City Planning', 'Corporate', 'Daytime', 'A number of Techs equal to half the Players, with Shotguns, wearing Kevlar vests.Use Bodyguards; Add Tool Hand and a MicroOptics Cybereye.', 'A number of Techs are working on a City system in your path.', '', 'Bears Battalion', 'Confontation');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (4, 'Corporate Techs', 'Corporate', 'Evening', 'Techs equal to half the Players, bodyguards equal to half the Players', 'A number of Corporate Techs  with a number of heavily armed bodyguards. They are loading crates of parts into an AV-4.', '', '', 'Passingby');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (5, 'Ranger', 'Corporate', 'Midnight', '1 Lawman, 1 deputy, 6 scavengers', 'A Lawman and their deputized partner are in town looking for a local gang of 6 scavengers hiding out in the City. The Lawman and their deputy are about to go into the gangs hideout and flush them out. Theyve blocked off the street with the help of the local cops and the Lawman offers the Players part of the bounty to go in and help bring the scavengers out dead or alive.', '', '', 'CrimeSpree');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (6, 'Locals', 'Corporate', 'Daytime', '2 young people, Inquisitors equal to the Players', 'Two young people from the local neighborhood. They are being beaten severely by a number of Inquisitor cultists equal to the Players for the sin of having designer eyes.', '', '', 'Violence');

INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (7, 'Edgerunner Team', 'Moderate', 'Midnight', '1 Netrunner, 1 Solo, 1 Nomad, 6 security guards', 'A small team of Edgerunners on the street in an old Ground Car preparing to break into a small Corporate office. Outside, security guards are on patrol. They spot you and offer you a piece of the action.', '', '', 'Heist');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (8, 'Turf War', 'Moderate', 'Midnight', 'Tyger Claws and Piranhas, each with a number of members equal to the Players (Minimum 4) light armored biker jackets, with Katanas and Very Heavy Pistols', 'You just walked into an all-out turf war between the two of the largest gangs in the area. Its the Tyger Claws, wearing. Cyberweapons are everywhere. Pick a side or pick a target.', '', '', 'Combat');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (9,'Reclaimers','Moderate','Daytime','reclaimers = PCs-2+1 chief','You run across a well-equipped group of reclaimers trying to hot-wire an abandoned building into the local power grid. The Chief and one of the reclaimers come over to Check those guys watching us. Roll 1d10. On 1-5, they ignore you. 6-8,  9-10', 'Crash Phasers', 'Chrome Alley Gang', 'Fight');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (10, 'Nomads','Moderate','Evening','group equal to the Players Medium Armorjack, carrying fighting knives, and rifles','A group of Nomads from the Midport Marauders. Moderately drunk and looking for a fight. Theyll hassle any attractive looking people in your group. Face it; they want a fight. Give them one. Use Road Gangers; Replace Crossbows with Assault Rifles and Leather with Medium Armorjack. Swap Archery Skill for Shoulder Arms Skill.','Dyna Switch','Midport Marauders','Fight');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (11, 'Corporate Guards', 'Moderate', 'Daytime', 'low-level Corporate guards equal to the Players patrolling the area, wearing Light Armorjack and carrying SMGs. (Use Security Operatives; with Light Armorjack and Poor Quality SMGs.)', 'A number of low-level WolfPoint guards. Unless you work for their Corporation, they dont think you have any  business hanging around where theyre operating. Move it, punk.', '', 'WolfPoint Security', 'Confontation');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (12, 'Police Patrol', 'Moderate', 'Evening', ' A number of patrol officers equal to half the Players, armed with Assault Rifles, armored in Medium Armorjack.', ' A number of patrol officers approach. If you�re wearing visible weapons or armor, theyll stop you and  demand identity papers. If youre argumentative, they call for backup (3  Security Operatives) to take you in. If you reach for a weapon, they�ll shoot first, fill out the paperwork later.', '', 'Bears Battalion', 'Confontation');

INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (13, 'Culties', 'Combat', 'Daytime', 'Number equal to the Players with knives, clubs, and Heavy Pistols', 'The Reckoners are out in force armed openly, corner you to preach that the red sky is a sign of the End Times. If you just blow them off, they try to beat their truth into you.', '', '', 'Confrontation');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (14, 'Boostergang', 'Combat', 'Daytime', 'Number equal to the Players, armed with SMGs, Rippers, Low Light Cybereyes, and Speedware.', 'A number of members of the Iron Sights gang, hassle anyone in the Crew who stands out, shake you down for money, and generally are spoiling for a fight.', '', '', 'Confrontation');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (15, 'Cyberpsycho Rage', 'Combat', 'Midnight', '1 cyberpsycho with four cyberlimbs, Jump Boosters, multiple Popguns, Wolvers, and more.', 'A single cyberpsycho, gleaming with metal and taking their fury out on a pedestrian who pushed them a little too far. The cyberpsycho is cybered up to the teeth. They dont look like theyre going to calm down and it will be a little bit (7 rounds) before Psycho can get on the scene. Whats worse, they just noticed you.', '', '', 'Combat');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (16, 'Solo Team', 'Combat', 'Evening', 'Half the number of Players carrying Smartgun Linked Assault Rifles. Boosted reflexes, boosted hearing, cybereyes with IR and targeting', 'A group of Solos, obviously up to some grey operation. If you are wearing a rival Corporate uniform or patch, they will dodge you and move on.', '', '', 'Passingby');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (17, 'After Action Report', 'Combat', 'Evening', 'Trauma Team unit, six wounded gangers', 'The AV-4 hits the ground in the middle of a recent firefight and the medics start tending to the half-dozen wounded gangers. The Team decides youre bystanders and ignores you.', '', '', 'Medical');
INSERT INTO ENCOUNTERS (ID, NAME,ZONE,TIME,AMOUNT,DESCRIPTION,CHARACTER,GROUPS,TYPE) VALUES (18, 'Arsonists', 'Combat', 'Midnight', '1 cybered-up ganger  wielding a Flamethrower, an Axe, and a Heavy Pistol, Players minus 3 (Minimum 2) Boosters with 1 Incendiary Grenade, Rippers, and a Poor Quality Very Heavy Handgun', 'A small group of radical anarchists with a grudge against somebody local. One cybered-up ganger, and leading a group of Boosters. They arent looking for a fight but theyre burning down the block and theyll kill anybody who gets in their way, or happens to be in the way.', '', '', 'CrimeSpree');
-- UPDATE GROUPS SET MEMBERS = NULL;

-- ENCOUNTER tables
--INSERT INTO ENCOUNTER_CHARACTERS (encounter_id, character_id)
--SELECT e.id, c.id FROM ENCOUNTERS e
--JOIN Characters c ON e.CHARACTER = c.NAME
--WHERE e.CHARACTER IS NOT NULL;
--INSERT INTO ENCOUNTER_GROUPS (encounter_id, group_id)
--SELECT e.id, g.id
--FROM ENCOUNTERS e
--JOIN GROUPS g ON e.GROUPS = g.NAME
--WHERE e.GROUPS IS NOT NULL;
--COMMIT;