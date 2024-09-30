SET SERVEROUTPUT ON;
-- Procedure to insert a new encounter
CREATE OR REPLACE PROCEDURE insertencounter (
    inputname IN VARCHAR2,
    inputzone IN VARCHAR2,
    inputtime IN VARCHAR2,
    inputamount IN VARCHAR2,
    inputdescription IN VARCHAR2,
    inputcharacter IN VARCHAR2,
    inputgroup IN VARCHAR2,
    inputtype IN VARCHAR2
) AS
    new_encounter_id NUMBER;
    character_id NUMBER;
    group_id NUMBER;
BEGIN
    -- Generate new encounter ID
    SELECT NVL(MAX(id), 0) + 1 INTO new_encounter_id FROM ENCOUNTERS;
    
    -- Insert new encounter
    INSERT INTO ENCOUNTERS (id, NAME, ZONE, TIME, AMOUNT, DESCRIPTION, CHARACTER, GROUPS, TYPE)
    VALUES (new_encounter_id, inputname, inputzone, inputtime, inputamount, inputdescription, inputcharacter, inputgroup, inputtype);
    
    -- Insert character relationship
    IF inputcharacter IS NOT NULL THEN
        SELECT id INTO character_id
        FROM Characters
        WHERE NAME = inputcharacter;
        
        INSERT INTO ENCOUNTER_CHARACTERS (encounter_id, character_id)
        VALUES (new_encounter_id, character_id);
    END IF;
    
    -- Insert group relationship
    IF inputgroup IS NOT NULL THEN
        SELECT id INTO group_id
        FROM GROUPS
        WHERE NAME = inputgroup;
        
        INSERT INTO ENCOUNTER_GROUPS (encounter_id, group_id)
        VALUES (new_encounter_id, group_id);
    END IF;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Encounter inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END insertencounter;
/
-- Procedure to insert a new location and update the region
CREATE OR REPLACE PROCEDURE insertlocation (
    location_name IN VARCHAR2,
    location_type IN VARCHAR2,
    region_name IN VARCHAR2,
    location_description IN VARCHAR2,
    key_points_of_interest IN VARCHAR2
) AS
    new_location_id NUMBER;
    new_poi_id NUMBER;
    region_id NUMBER;
    region_pois VARCHAR2(4000);
    region_exists NUMBER;
BEGIN
    -- Check if the region exists
    SELECT COUNT(*) INTO region_exists
    FROM REGION
    WHERE NAME = region_name;

    IF region_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Region does not exist');
    END IF;

    -- Generate new location ID
    SELECT NVL(MAX(id), 0) + 1 INTO new_location_id FROM Locations;

    -- Insert the new location
    INSERT INTO Locations (id, NAME, TYPE, REGION, DESCRIPTION, KEYINTEREST)
    VALUES (new_location_id, location_name, location_type, region_name, location_description, key_points_of_interest);

    -- Get the region ID
    SELECT id INTO region_id
    FROM REGION
    WHERE NAME = region_name;

    -- Generate new POINTSOFINTEREST ID
    SELECT NVL(MAX(id), 0) + 1 INTO new_poi_id FROM POINTSOFINTEREST;

    -- Insert into POINTSOFINTEREST table
    INSERT INTO POINTSOFINTEREST (id, LOCATION_ID, REGION_ID)
    VALUES (new_poi_id, new_location_id, region_id);

    -- Update the REGION table
    SELECT LISTAGG(NAME, ', ') WITHIN GROUP (ORDER BY NAME)
    INTO region_pois
    FROM Locations
    WHERE REGION = region_name;

    UPDATE REGION
    SET POI = region_pois
    WHERE id = region_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Location inserted and region updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END insertlocation;
/

-- Procedure to insert a new character and update the group
CREATE OR REPLACE PROCEDURE insertcharacter (
    character_name IN VARCHAR2,
    character_role IN VARCHAR2,
    character_quirk IN VARCHAR2,
    character_location IN VARCHAR2,
    character_description IN VARCHAR2,
    character_affiliation IN VARCHAR2
) AS
    newcharacterid NUMBER;
    group_id NUMBER;
    total_members NUMBER;
    group_members VARCHAR2(400);
    location_exists NUMBER;
    group_exists NUMBER;
    existingencounterid NUMBER;
BEGIN
    -- Check if the location exists
    SELECT COUNT(*) INTO location_exists
    FROM Locations
    WHERE NAME = character_location;

    IF location_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Location does not exist');
    END IF;

    -- Check if the group (affiliation) exists
    SELECT COUNT(*) INTO group_exists
    FROM GROUPS
    WHERE NAME = character_affiliation;

    IF group_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Group does not exist');
    END IF;

    -- Generate new character ID
    SELECT NVL(MAX(id), 0) + 1 INTO newcharacterid FROM Characters;

    -- Insert the new character
    INSERT INTO Characters (id, NAME, ROLE, QUIRK, LOCATION, DESCRIPTION, AFFILIATION)
    VALUES (newcharacterid, character_name, character_role, character_quirk, character_location, character_description, character_affiliation);

    -- Get the group ID
    SELECT id INTO group_id
    FROM GROUPS
    WHERE NAME = character_affiliation;

    -- Insert into AFFILIATIONS table
    INSERT INTO AFFILIATIONS (character_id, group_id)
    VALUES (newcharacterid, group_id);

    -- Update the GROUPS table
    SELECT TOTALMEM, MEMBERS
    INTO total_members, group_members
    FROM GROUPS
    WHERE id = group_id;

    -- Increment total members
    total_members := NVL(total_members, 0) + 1;

    -- Update members list
    IF group_members IS NULL THEN
        group_members := character_name;
    ELSE
        group_members := group_members || ', ' || character_name;
    END IF;

    -- Update the GROUPS table
    UPDATE GROUPS
    SET TOTALMEM = total_members,
        MEMBERS = group_members
    WHERE id = group_id;
    BEGIN
        SELECT id INTO existingencounterid
        FROM ENCOUNTERS
        WHERE CHARACTER = character_name
        AND ROWNUM = 1;  -- Get the first encounter if multiple exist

        -- If an encounter is found, insert into ENCOUNTER_CHARACTERS table
        INSERT INTO ENCOUNTER_CHARACTERS (encounter_id, character_id)
        VALUES (existingencounterid, newcharacterid);
        
        DBMS_OUTPUT.PUT_LINE('Character added to existing encounter.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No existing encounter found for this character.');
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Character inserted, group updated, and encounter_character table updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END insertcharacter;
/


CREATE OR REPLACE PROCEDURE insertregion (
    inputname IN VARCHAR2,
    insertirlname IN VARCHAR2,
    inputdescription IN VARCHAR2
) AS
    vnewregionid NUMBER;
BEGIN
    -- Generate new region ID
    SELECT NVL(MAX(id), 0) + 1 INTO vnewregionid FROM REGION;

    -- Insert the new region
    INSERT INTO REGION (id, NAME, IRLNAME, POI, DESCRIPTION)
    VALUES (vnewregionid, inputname, insertirlname, NULL, inputdescription);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Region inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END insertregion;
/


CREATE OR REPLACE PROCEDURE insertgroup (
    inputname IN VARCHAR2, 
    inputtype IN VARCHAR2,
    inputlocation IN VARCHAR2,
    inputtotalmem IN NUMBER,
    inputmembers IN VARCHAR2
) AS
    vnewgroupid NUMBER;
    vlocationexists NUMBER;
    vencounterid NUMBER;
BEGIN
    -- Check if the location exists
    SELECT COUNT(*) INTO vlocationexists
    FROM Locations
    WHERE NAME = inputlocation;

    IF vlocationexists = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Location does not exist');
    END IF;

    -- Generate new group ID
    SELECT NVL(MAX(id), 0) + 1 INTO vnewgroupid FROM GROUPS;

    -- Insert the new group
    INSERT INTO GROUPS (id, NAME, TYPE, LOCATION, TOTALMEM, MEMBERS)
    VALUES (vnewgroupid, inputname, inputtype, inputlocation, inputtotalmem, inputmembers);

    -- Check if there's an encounter associated with this group
    BEGIN
        SELECT id INTO vencounterid
        FROM ENCOUNTERS
        WHERE GROUPS = inputname
        AND ROWNUM = 1;  -- Get the first encounter if multiple exist

        -- If an encounter is found, insert into ENCOUNTER_GROUPS table
        INSERT INTO ENCOUNTER_GROUPS (encounter_id, group_id)
        VALUES (vencounterid, vnewgroupid);
        
        DBMS_OUTPUT.PUT_LINE('Group added to existing encounter.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No existing encounter found for this group.');
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Group inserted and encounter_groups table updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END insertgroup;
/

CREATE OR REPLACE PROCEDURE updatealltables AS
    CURSOR ccharacters IS
        SELECT id, name, affiliation
        FROM CHARACTERS;
        
    CURSOR cgroups IS
        SELECT id, name
        FROM GROUPS;
    
    CURSOR clocations IS
        SELECT id, name, region
        FROM LOCATIONS;
    
    CURSOR cencounters IS
        SELECT id, character, groups
        FROM ENCOUNTERS;
    
    vregionid NUMBER;
    vgroupid NUMBER;
    vcharacterid NUMBER;
    vtotalmems NUMBER;
    vgroupmem VARCHAR2(400);
    vregionpois VARCHAR2(4000);
    vnewpoiid NUMBER;
BEGIN
    -- Update POINTSOFINTEREST table
    FOR loc IN clocations LOOP
        SELECT id INTO vregionid
        FROM REGION
        WHERE name = loc.region;
        
        -- Get the next available ID for POINTSOFINTEREST
        SELECT NVL(MAX(id), 0) + 1 INTO vnewpoiid
        FROM POINTSOFINTEREST;
        
        MERGE INTO POINTSOFINTEREST poi
        USING (SELECT 1 FROM dual) dummy
        ON (poi.LOCATION_ID = loc.id AND poi.REGION_ID = vregionid)
        WHEN NOT MATCHED THEN
            INSERT (id, LOCATION_ID, REGION_ID)
            VALUES (vnewpoiid, loc.id, vregionid);
    END LOOP;

    -- Update ENCOUNTER_CHARACTERS and ENCOUNTER_GROUPS tables
    FOR enc IN cencounters LOOP
        -- Update ENCOUNTER_CHARACTERS
        IF enc.character IS NOT NULL THEN
            BEGIN
                SELECT id INTO vcharacterid
                FROM CHARACTERS
                WHERE name = enc.character;
                
                MERGE INTO ENCOUNTER_CHARACTERS ec
                USING (SELECT 1 FROM dual) dummy
                ON (ec.encounter_id = enc.id AND ec.character_id = vcharacterid)
                WHEN NOT MATCHED THEN
                    INSERT (encounter_id, character_id)
                    VALUES (enc.id, vcharacterid);
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Character not found: ' || enc.character);
            END;
        END IF;

        -- Update ENCOUNTER_GROUPS
        IF enc.groups IS NOT NULL THEN
            BEGIN
                SELECT id INTO vgroupid
                FROM GROUPS
                WHERE name = enc.groups;
                
                MERGE INTO ENCOUNTER_GROUPS eg
                USING (SELECT 1 FROM dual) dummy
                ON (eg.encounter_id = enc.id AND eg.group_id = vgroupid)
                WHEN NOT MATCHED THEN
                    INSERT (encounter_id, group_id)
                    VALUES (enc.id, vgroupid);
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Group not found: ' || enc.groups);
            END;
        END IF;
    END LOOP;

    -- Update AFFILIATIONS and GROUPS members
    FOR char_rec IN ccharacters LOOP
        IF char_rec.affiliation IS NOT NULL THEN
            -- Update AFFILIATIONS
            BEGIN
                SELECT id INTO vgroupid
                FROM GROUPS
                WHERE name = char_rec.affiliation;
                
                MERGE INTO AFFILIATIONS aff
                USING (
                    SELECT char_rec.id AS char_id, vgroupid AS group_id
                    FROM dual
                ) src
                ON (aff.character_id = src.char_id AND aff.group_id = src.group_id)
                WHEN NOT MATCHED THEN
                    INSERT (character_id, group_id)
                    VALUES (src.char_id, src.group_id);
                
                -- Update GROUPS members
                SELECT TOTALMEM, MEMBERS
                INTO vtotalmems, vgroupmem
                FROM GROUPS
                WHERE id = vgroupid;
                
                vtotalmems := NVL(vtotalmems, 0) + 1;
                
                IF vgroupmem IS NULL THEN
                    vgroupmem := char_rec.name;
                ELSIF INSTR(vgroupmem, char_rec.name) = 0 THEN
                    vgroupmem := vgroupmem || ', ' || char_rec.name;
                END IF;
                
                UPDATE GROUPS
                SET TOTALMEM = vtotalmems,
                    MEMBERS = vgroupmem
                WHERE id = vgroupid;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Group not found: ' || char_rec.affiliation);
            END;
        END IF;
    END LOOP;

    -- Update REGION poi
    FOR reg IN (SELECT id, name FROM REGION) LOOP
        SELECT LISTAGG(l.name, ', ') WITHIN GROUP (ORDER BY l.name)
        INTO vregionpois
        FROM LOCATIONS l
        WHERE l.region = reg.name;
        
        UPDATE REGION
        SET POI = vregionpois
        WHERE id = reg.id;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All tables updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END updatealltables;
/

--Execute the procedure
BEGIN
    updatealltables;
END;
/

