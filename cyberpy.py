import oracledb
import os
import random
# Database connection details
username = ""
password = ""
dsn = ""
#Util Functions
def connecttodatabase():
    try:
        connection = oracledb.connect(user=username, password=password, dsn=dsn)
        print("Successfully connected to the database")
        return connection
    except oracledb.Error as error:
        print(f"Error connecting to the database: {error}")
        return None
def closeconnection(connection):
    if connection:
        connection.close()
        print("Database connection closed")
def executequery(connection, query, params=None):
    cursor = connection.cursor()
    try:
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        result = cursor.fetchall()
        connection.commit()
        return result
    except oracledb.Error as error:
        print(f"Error executing query: {error}")
        return None
    finally:
        cursor.close()
#Function to limit user input length in a loop
def inputlimit(prompt, max_length):
    while True:#loop
        user_input = input(prompt)
        if len(user_input) <= max_length:#input length okay
            return user_input
        else:# input to high: repeat prompt
            print(f"Input exceeds maximum length of {max_length} characters. Please try again.")
#Main Menu
def mainmenu():
    connection = connecttodatabase()
    if not connection:
        return
    while True:
        print("\nCyberpunk Encounter Archive Menu")
        print("1. View Tables")
        print("2. Add Data")
        print("3. Get Random Encounter")
        print("4. Export All Data")
        print("5. Keyword Search")
        print("6. Exit")
        choice = input("Enter your choice (1-6): ")

        if choice == '1':
            viewmenu(connection)
        elif choice == '2':
            addmenu(connection)
        elif choice == '3':
            getrngencounter(connection)
        elif choice == '4':
            extracttofile(connection)
        elif choice == '5':
            filtertable(connection)
        elif choice == '6':
            print("Exiting the program...")
            break
        else:
            print("Invalid choice. Please try again.")
    closeconnection(connection)

#View Menu
def viewmenu(connection):
    while True:
        print("\nCyberpunk Data Viewing Menu")
        print("1. View Characters")
        print("2. View Groups")
        print("3. View Locations")
        print("4. View Regions")
        print("5. View Encounters")
        print("6. Exit")
        choice = input("Enter your choice (1-6): ")

        if choice == '1':
            viewcharacters(connection)
        elif choice == '2':
            viewgroups(connection)
        elif choice == '3':
            viewlocations(connection)
        elif choice == '4':
            viewregions(connection) 
        elif choice == '5':
            viewencounters(connection) 
        elif choice == '6':
            print("Returning to Main Menu...")
            break
        else:
            print("Invalid choice. Please try again.")

#Add Menu
def addmenu(connection):
    connection = connecttodatabase()
    if not connection:
        return

    while True:
        print("\nCyberpunk Data Insertion Menu")
        print("1. Add New Character")
        print("2. Add New Group")
        print("3. Add New Location")
        print("4. Add New Region")
        print("5. Add New Encounter")
        print("6. Exit")
        choice = input("Enter your choice (1-6): ")
        if choice == '1':
            addcharacter(connection)
        elif choice == '2':
            addgroup(connection)
        elif choice == '3':
            addlocation(connection)
        elif choice == '4':
            addregion(connection)
        elif choice == '5':
            addencounter(connection)
        elif choice == '6':
            print("Returning to Main Menu...")
            break
        else:
            print("Invalid choice. Please try again.")

#View Tables
def viewcharacters(connection):
    query = "SELECT * FROM CHARACTERS"
    results = executequery(connection, query)
    if results:
        print("\nCharacters:")
        for row in results:
            print(f"ID: {row[0]}, Name: {row[1]}, Role: {row[2]}, Quirk: {row[3]}, Location: {row[4]}, Affiliation: {row[6]}")
def viewgroups(connection):
    query = "SELECT * FROM GROUPS"
    results = executequery(connection, query)
    if results:
        print("\nGroups:")
        for row in results:
            print(f"ID: {row[0]}, Name: {row[1]}, Type: {row[2]}, Location: {row[3]}, Total Members: {row[4]}")
def viewlocations(connection):
    query = "SELECT * FROM LOCATIONS"
    results = executequery(connection, query)
    if results:
        print("\nLocations:")
        for row in results:
            print(f"ID: {row[0]}, Name: {row[1]}, Type: {row[2]}, Region: {row[3]}, Key Interest: {row[5]}")
def viewregions(connection):
    query = "SELECT * FROM REGION"
    results = executequery(connection, query)
    if results:
        print("\nRegions:")
        for row in results:
            print(f"ID: {row[0]}, Name: {row[1]}, Real-life Name: {row[2]}, Description: {row[4]}")

def viewencounters(connection):
    query = "SELECT * FROM ENCOUNTERS"
    results = executequery(connection, query)
    if results:
        print("\nEncounters:")
        for row in results:
            print(f"ID: {row[0]}, Name: {row[1]}, Zone: {row[2]}, Time: {row[3]}, Amount: {row[4]}, Type: {row[8]}")
#Add To Tables
def addcharacter(connection):
    name = inputlimit("Enter character name (max 100 characters): ", 100)
    role = inputlimit("Enter character role (max 50 characters): ", 50)
    quirk = inputlimit("Enter character quirk (max 200 characters): ", 200)
    check = "y"
    # Location verification
    while True:
        location = inputlimit("Enter character location (max 50 characters): ", 50)
        query = "SELECT COUNT(*) FROM Locations WHERE NAME = :location"
        result = executequery(connection, query, {'location': location})
        if result[0][0] == 0:
            checkinput = input(f"The location '{location}' does not exist. Would you like to create it? (Y/n): ")
            if checkinput == '':
                check = 'y'
            else:
                check = checkinput
            if check.lower() == "y":
                addlocation(connection)
            else:
                continue
        else:
            break

    description = inputlimit("Enter character description (max 500 characters): ", 500)
    
    # Affiliation (Group) verification
    while True:
        affiliation = inputlimit("Enter character affiliation (max 100 characters): ", 100)
        query = "SELECT COUNT(*) FROM GROUPS WHERE NAME = :affiliation"
        result = executequery(connection, query, {'affiliation': affiliation})
        if result[0][0] == 0:
            check = input(f"The group '{affiliation}' does not exist. Would you like to create it? (Y/n): ")
            if check.lower() == "y":
                addgroup(connection)
            else:
                continue
        else:
            break

    query = """
    BEGIN
        insertcharacter(:name, :role, :quirk, :location, :description, :affiliation);
        updatealltables;
    END;
    """
    params = {
        'name': name,
        'role': role,
        'quirk': quirk,
        'location': location,
        'description': description,
        'affiliation': affiliation
    }
    executequery(connection, query, params)
    print("Character added successfully")

def addgroup(connection):
    name = inputlimit("Enter group name (max 100 characters): ", 100)
    group_type = inputlimit("Enter group type (max 30 characters): ", 30)
    
    # Location verification
    while True:
        location = inputlimit("Enter group location (max 100 characters): ", 100)
        query = "SELECT COUNT(*) FROM Locations WHERE NAME = :location"
        result = executequery(connection, query, {'location': location})
        if result[0][0] == 0:
            checkinput = input(f"The location '{location}' does not exist. Would you like to create it? (Y/n): ")
            check = 'y'
            if checkinput == '':
                check = 'y'
            else:
                check = checkinput
            if check.lower() == "y":
                addlocation(connection)
            else:
                continue
        else:
            break

    while True:
        try:
            total_members = int(input("Enter total number of members: "))
            break
        except ValueError:
            print("Please enter a valid integer for total members.")

    members = inputlimit("Enter member names (comma-separated, max 400 characters): ", 400)

    query = """
    BEGIN
        insertgroup(:name, :type, :location, :totalmem, :members);
        updatealltables;
    END;
    """
    params = {
        'name': name,
        'type': group_type,
        'location': location,
        'totalmem': total_members,
        'members': members
    }
    executequery(connection, query, params)
    print("Group added successfully")

def addlocation(connection):
    name = inputlimit("Enter location name (max 100 characters): ", 100)
    location_type = inputlimit("Enter location type (max 50 characters): ", 50)
    
    # Region verification
    while True:
        region = inputlimit("Enter region name (max 100 characters): ", 100)
        query = "SELECT COUNT(*) FROM REGION WHERE NAME = :region"
        result = executequery(connection, query, {'region': region})
        if result[0][0] == 0:
            checkinput = input(f"The region '{region}' does not exist. Would you like to create it? (Y/n): ")
            check = 'y'
            if checkinput == '':
                check = 'y'
            else:
                check = checkinput
            if check.lower() == "y":
                addregion(connection)
            else:
                continue
        else:
            break

    description = inputlimit("Enter location description (max 500 characters): ", 500)
    key_interest = inputlimit("Enter key points of interest (max 200 characters): ", 200)

    query = """
    BEGIN
        insertlocation(:name, :type, :region, :description, :key_interest);
        updatealltables;
    END;
    """
    params = {
        'name': name,
        'type': location_type,
        'region': region,
        'description': description,
        'key_interest': key_interest
    }
    executequery(connection, query, params)
    print("Location added successfully")

def addregion(connection):
    name = inputlimit("Enter region name (max 100 characters): ", 100)
    irl_name = inputlimit("Enter real-life name (max 100 characters): ", 100)
    description = inputlimit("Enter region description (max 500 characters): ", 500)

    query = """
    BEGIN
        insertregion(:name, :irlname, :description);
        updatealltables;
    END;
    """
    params = {
        'name': name,
        'irlname': irl_name,
        'description': description
    }
    executequery(connection, query, params)
    print("Region added successfully")
    
def addencounter(connection):
    name = inputlimit("Enter encounter name (max 50 characters): ", 50)
    while True:
        zone = inputlimit("Enter encounter zone (Corporate, Moderate, or Combat): ", 50)
        zone = zone.capitalize()
        if zone == "Corporate":
            break
        if zone == "Moderate":
            break
        if zone == "Combat":
            break
        else:
            print("Input Error: Try Again")
    while True:
        time = inputlimit("Enter encounter time (Daytime, Evening, Midnight): ", 20)
        time = time.capitalize()
        if time == "Daytime":
            break
        if time == "Evening":
            break
        if time == "Midnight":
            break
        else:
            print("Input Error: Try Again")
    
    amount = inputlimit("Enter combatant amount (max 200 characters): ", 200)
    description = inputlimit("Enter encounter description (max 400 characters): ", 400)
    
    # Character verification
    character = inputlimit("Enter involved character (max 80 characters, or press Enter to skip): ", 80)
    if character:
        query = "SELECT COUNT(*) FROM Characters WHERE NAME = :character"
        result = executequery(connection, query, {'character': character})
        if result[0][0] == 0:
            checkinput = input(f"The character '{character}' does not exist. Would you like to create it? (Y/n): ")
            check = 'y'
            if checkinput == '':
                check = 'y'
            else:
                check = checkinput
            if check.lower() == "y":
                addcharacter(connection)

    # Group verification
    group_name = inputlimit("Enter involved group (max 50 characters, or press Enter to skip): ", 50)
    if group_name:
        query = "SELECT COUNT(*) FROM GROUPS WHERE NAME = :groupname"
        result = executequery(connection, query, {'groupname': group_name})
        if result[0][0] == 0:
            check = input(f"The group '{group_name}' does not exist. Would you like to create it? (Y/n): ")
            check = 'y'
            if checkinput == '':
                check = 'y'
            else:
                check = checkinput
            if check.lower() == "y":
                addgroup(connection)

    encounter_type = inputlimit("Enter encounter type (max 30 characters): ", 30)

    query = """
    BEGIN
        insertencounter(:name, :zone, :time, :amount, :description, :character, :group, :type);
        updatealltables;
    END;
    """
    params = {
        'name': name,
        'zone': zone,
        'time': time,
        'amount': amount,
        'description': description,
        'character': character if character else None,
        'group': group_name if group_name else None,
        'type': encounter_type
    }
    try:
        executequery(connection, query, params)
        print("Encounter added successfully")
    except oracledb.Error as error:
        print(f"Error adding encounter: {error}")
        print("Please make sure all required fields are filled and match the expected format.")

#Random Encounter Generator
def getrngencounter(connection):
    zones = ['Corporate', 'Moderate', 'Combat']
    times = ['Daytime', 'Evening', 'Midnight']
    
    print("\nSelect a Zone:")
    for i, zone in enumerate(zones, 1):
        print(f"{i}. {zone} Zone")
    zone_choice = int(input("Enter your choice (1-3): ")) - 1
    
    print("\nSelect a Time:")
    for i, time in enumerate(times, 1):
        print(f"{i}. {time}")
    time_choice = int(input("Enter your choice (1-3): ")) - 1
    zone = zones[zone_choice] 
    time = times[time_choice]
    query = """
    SELECT * FROM ENCOUNTERS
    WHERE ZONE = :zone AND TIME = :time
    """
    results = executequery(connection, query, {'zone': zone, 'time': time})
    if results:
        encounter = random.choice(results)
        print("\nRandom Encounter:")
        print(f"Name: {encounter[1]}")
        print(f"Zone: {encounter[2]}")
        print(f"Time: {encounter[3]}")
        print(f"Amount: {encounter[4]}")
        print(f"Description: {encounter[5]}")
        print(f"Character: {encounter[6]}")
        print(f"Group: {encounter[7]}")
        print(f"Type: {encounter[8]}")
    else:
        print("No matching encounter found.")
#Extract File
def gettables(connection):
    query = """
    SELECT table_name 
    FROM user_tables 
    ORDER BY table_name
    """
    results = executequery(connection, query)
    return [row[0] for row in results] if results else []
def getcolumns(connection, table_name):
    query = f"""
    SELECT column_name 
    FROM user_tab_columns 
    WHERE table_name = '{table_name.upper()}'
    ORDER BY column_id
    """
    results = executequery(connection, query)
    return [row[0] for row in results] if results else []
def extracttables(connection, table_name):
    columns = getcolumns(connection, table_name)
    query = f"SELECT * FROM {table_name}"
    results = executequery(connection, query)
    
    statements = []
    if results:
        for row in results:
            escaped_values = []
            for value in row:
                if value is None:
                    escaped_values.append("NULL")
                elif isinstance(value, str):
                    escaped_value = value.replace("'", "''")
                    escaped_values.append(f"'{escaped_value}'")
                else:
                    escaped_values.append(str(value))
            insert_statement = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({', '.join(escaped_values)});"
            statements.append(insert_statement)
    else:
        print(f"No data found in the table {table_name}.")
    
    return statements
def extracttofile(connection):

    directory = input("Enter the directory to save table data (e.g., backup_data): ")
    if not os.path.exists(directory):
        os.makedirs(directory)
    
    filename = os.path.join(directory, "cyberdata.sql")
    
    with open(filename, 'w') as file:
        tables = gettables(connection)
        for table in tables:
            file.write(f"\n-- Table: {table}\n")
            statements = extracttables(connection, table)
            for statement in statements:
                file.write(statement + '\n')
            file.write('\n')
    
    print(f"All table data has been extracted and saved to {filename}")
def filtertable(connection):
    # Get tables
    tables = gettables(connection)
    # Display tables
    print("\nAvailable tables:")
    for i, table in enumerate(tables, 1):
        print(f"{i}. {table.capitalize()}")
    table_choice = int(input("Enter the number of the table you want to filter: ")) - 1
    selected_table = tables[table_choice]
    #Get columns
    columns = getcolumns(connection, selected_table)
    # Display columns
    print("\nAvailable columns:")
    for i, column in enumerate(columns, 1):
        print(f"{i}. {column.capitalize()}")
    column_choice = int(input("Enter the number of the column you want to filter: ")) - 1
    selected_column = columns[column_choice]

    # Get wildcard keyword from user
    wildcard = input("Enter the wildcard keyword (use % for any number of characters, _ for a single character): ")
    query = f"""
    SELECT * FROM {selected_table}
    WHERE UPPER({selected_column}) LIKE UPPER(:wildcard)
    """
    results = executequery(connection, query, {'wildcard': wildcard})
    
    # Display results
    if results:
        print(f"Getting results from {selected_table.capitalize()} where {selected_column.capitalize()} matches '{wildcard}'...")
        print(columns)
        for row in results:
            print(row)
    else:
        print("No results found.")
    print("Returning to Main Menu...")

def main():
    mainmenu()
if __name__ == "__main__":
    main()