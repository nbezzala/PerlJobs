     --
    -- Drops just in case you are reloading
    ---
    DROP TABLE IF EXISTS candidate CASCADE;
    DROP TABLE IF EXISTS contact CASCADE;
    DROP TABLE IF EXISTS company CASCADE;
    DROP TABLE IF EXISTS company_contact CASCADE;
    DROP TABLE IF EXISTS user_roles CASCADE;
    DROP TABLE IF EXISTS roles CASCADE;
    DROP TABLE IF EXISTS address CASCADE;
    DROP TABLE IF EXISTS users CASCADE;
    DROP TABLE IF EXISTS job_title CASCADE;    
 --
    -- Add users and roles tables, along with a many-to-many join table
    --
    
    CREATE TABLE users (
        id            SERIAL PRIMARY KEY,
        username      TEXT,
        password      TEXT,
        email_address TEXT,
        first_name    TEXT,
        last_name     TEXT,
        active        INTEGER,
        created TIMESTAMP NOT NULL DEFAULT now(),
        updated TIMESTAMP
    );
    
    CREATE TABLE roles (
        id   SERIAL PRIMARY KEY,
        role TEXT
    );
    
    CREATE TABLE user_roles (
        user_id INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
        role_id INTEGER REFERENCES roles(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (user_id, role_id)
    );
    
--
    -- Create a database to hold candidate, company information
    --
    -- 


    CREATE TABLE address (
            id  SERIAL PRIMARY KEY,
	    line1 TEXT,
            line2 TEXT,
            city TEXT,
            state TEXT,
            country TEXT,
            zip TEXT
    );

-- Not yet used, should get job_titles of Jobs, Candidates, Contacts from this one table.
    CREATE TABLE job_title (
            id  SERIAL PRIMARY KEY,
	    job_title TEXT
    );

    
    CREATE TABLE candidate (
            id     SERIAL PRIMARY KEY,
            user_id   INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    job_title	TEXT,
	    address_id INTEGER REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    created_at TIMESTAMP NOT NULL DEFAULT now(),
	    updated_at TIMESTAMP,
	    created_by INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    updated_by INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
    );

    CREATE TABLE company (
            id         SERIAL PRIMARY KEY,
            name       TEXT,
            address_id INTEGER REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    created_at TIMESTAMP NOT NULL DEFAULT now(),
	    updated_at TIMESTAMP,
	    created_by INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    updated_by INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
    );

    CREATE TABLE contact (
            id           SERIAL PRIMARY KEY,
            user_id      INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
            job_title  TEXT,
            address_id INTEGER REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    created_at TIMESTAMP NOT NULL DEFAULT now(),
	    updated_at TIMESTAMP,
	    created_by INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    updated_by INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
    );
	
    CREATE TABLE company_contact (
            company_id  INTEGER REFERENCES company(id) ON DELETE CASCADE ON UPDATE CASCADE,
	    contact_id	INTEGER REFERENCES contact(id) ON DELETE CASCADE ON UPDATE CASCADE,
            PRIMARY KEY (company_id, contact_id)
    );
    

ALTER TABLE candidate OWNER TO catappuser;
ALTER TABLE contact OWNER TO catappuser;
ALTER TABLE company OWNER TO catappuser;
ALTER TABLE company_contact OWNER TO catappuser;
ALTER TABLE users OWNER TO catappuser;
ALTER TABLE roles OWNER TO catappuser;
ALTER TABLE user_roles OWNER TO catappuser;
ALTER TABLE address OWNER TO catappuser;
ALTER TABLE job_title OWNER TO catappuser;

    --
    -- Load up some initial test data
    --
    INSERT INTO users (username, password, email_address, first_name, last_name, active) 
        VALUES ('test01', 'mypass', 't01@na.com', 'Joe',  'Blow', 1);
    INSERT INTO users (username, password, email_address, first_name, last_name, active) 
        VALUES ('test02', 'mypass', 't02@na.com', 'Jane', 'Doe',  1);
    INSERT INTO users (username, password, email_address, first_name, last_name, active)
        VALUES ('test03', 'mypass', 't03@na.com', 'No',   'Go',   0);
    INSERT INTO users (username, password, email_address, first_name, last_name, active)
        VALUES ('test04', 'mypass', 't04@na.com', 'No',   'Go',   0);    
            
    INSERT INTO roles (role) VALUES ('user');
    INSERT INTO roles (role) VALUES ('admin');
    INSERT INTO user_roles VALUES (1, 1);
    INSERT INTO user_roles VALUES (1, 2);
    INSERT INTO user_roles VALUES (2, 1);
    INSERT INTO user_roles VALUES (3, 1);


    ---
    --- Load some sample data
    ---
    
    