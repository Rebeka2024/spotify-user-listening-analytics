-- Spotify User Listening Analytics Database
-- Created by Rebeka Nyambati


CREATE DATABASE spotify_analytics;

USE spotify_analytics;


-- Users Table
CREATE TABLE users (

user_id INT PRIMARY KEY,

first_name VARCHAR(50),

last_name VARCHAR(50),

age INT,

country VARCHAR(50),

join_date DATE

);


-- Artists Table
CREATE TABLE artists (

artist_id INT PRIMARY KEY,

artist_name VARCHAR(100),

genre VARCHAR(50),

monthly_listeners INT

);


-- Songs Table
CREATE TABLE songs (

song_id INT PRIMARY KEY,

artist_id INT,

song_name VARCHAR(100),

album VARCHAR(100),

release_year INT,

duration_minutes DECIMAL(4,2),

FOREIGN KEY (artist_id)
REFERENCES artists(artist_id)

);


-- Listening History Table
CREATE TABLE listening_history (

listen_id INT PRIMARY KEY,

user_id INT,

song_id INT,

date_listened DATE,

streams INT,

minutes_played DECIMAL(5,2),

FOREIGN KEY(user_id)
REFERENCES users(user_id),

FOREIGN KEY(song_id)
REFERENCES songs(song_id)

);


-- Subscription Table
CREATE TABLE subscriptions (

subscription_id INT PRIMARY KEY,

user_id INT,

plan_type VARCHAR(20),

monthly_cost DECIMAL(5,2),

FOREIGN KEY(user_id)
REFERENCES users(user_id)

);


-- User Preferences Table
CREATE TABLE user_preferences (

preference_id INT PRIMARY KEY,

user_id INT,

favorite_genre VARCHAR(50),

FOREIGN KEY(user_id)
REFERENCES users(user_id)

);
