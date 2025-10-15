# Searchy

**Searchy** is a Java Spring + Hibernate web application that lets users search for **local businesses and services** (like restaurants, fuel stations, hospitals, etc.) on an interactive map.  

It works similarly to Google Maps or Google Business Pages — users can search by category, view results pinned on a map, and see detailed information for each listing.

---

## Features

- **Smart search** for businesses and services by category or name  
- **Interactive map view** with pins showing all matching results  
- **Business details** displayed on click — name, phone, email, and opening hours  
- **Location-based filtering** for nearby results  
- **Integrated with Google Maps API** for map visualization  
- **Admin dashboard** for adding, editing, and managing business listings  

---

## Architecture

Searchy follows a **Spring MVC layered architecture**:
- **Controller Layer:** Handles web requests and routing  
- **Service Layer:** Contains business logic  
- **DAO Layer:** Uses Hibernate ORM for database access  
- **Database:** MySQL 
- **Frontend:** JSP/HTML with Bootstrap and JavaScript  

---

## Tech Stack

- **Language:** Java  
- **Frameworks:** Spring MVC, Spring Boot (if applicable), Hibernate ORM  
- **Database:** MySQL / PostgreSQL  
- **Frontend:** JSP, HTML5, CSS3, Bootstrap, JavaScript  
- **Mapping API:** Google Maps API  
- **Build Tool:** Maven or Gradle  
- **IDE:** IntelliJ IDEA / Eclipse / Spring Tool Suite  

---

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/zainmukhtar/searchy.git
