DROP TABLE expenses;
DROP TABLE labels;
DROP TABLE users;
CREATE TABLE Users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name VARCHAR(255),
  date_of_birth DATE,
  profile_picture_url VARCHAR(255),
  auth_token TEXT,
  refresh_token TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Labels (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES Users(id),
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Expenses (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES Users(id),
  label_id INTEGER REFERENCES Labels(id),
  name VARCHAR(255) NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  date DATE NOT NULL,
  category VARCHAR(255),
  payment_method VARCHAR(255),
  currency VARCHAR(3),
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);