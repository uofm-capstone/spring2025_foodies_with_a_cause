[Back to README](../README.md)
# Database Schema Documentation

## Overview

This document provides an overview of the database schema for the Produce Bridge application. The schema is defined and managed using ActiveRecord migrations. This document describes the structure of the database, including the tables, their columns, relationships, and indexes.

----------

## Table of Contents

1.  Messages Table
2.  Products Table
3.  User Notifications Table
4.  Users Table
5.  Relationships Between Tables
6.  Indexes and Constraints
7.  Migrations and Versioning

----------

## Messages Table

The `messages` table stores the messages sent between users.

### Columns:

-   **content** (`text`): The content of the message.
-   **sender_id** (`integer`, **not null**): The ID of the sender. This is a foreign key referencing the `users` table.
-   **receiver_id** (`integer`, **not null**): The ID of the receiver. This is a foreign key referencing the `users` table.
-   **created_at** (`datetime`, **not null**): The timestamp when the message was created.
-   **updated_at** (`datetime`, **not null**): The timestamp when the message was last updated.
-   **read** (`boolean`, default: `false`, **not null**): Whether the message has been read by the receiver.

### Indexes:

-   **`index_messages_on_sender_id`**: Index on the `sender_id` column for quick lookups of messages by sender.
-   **`index_messages_on_receiver_id`**: Index on the `receiver_id` column for quick lookups of messages by receiver.

### Foreign Keys:

-   **`sender_id`**: References the `users` table.
-   **`receiver_id`**: References the `users` table.

----------

## Products Table

The `products` table stores the products listed by users.

### Columns:

-   **marketer** (`string`): The name of the marketer or brand associated with the product.
-   **user_id** (`bigint`, **not null**): The ID of the user who created the product. This is a foreign key referencing the `users` table.
-   **quantity** (`integer`): The available quantity of the product.
-   **food_type** (`string`): The category or type of the product (e.g., "vegetable", "snack").
-   **description** (`string`): A textual description of the product.
-   **hold** (`string`): A status indicating whether the product is on hold.
-   **created_at** (`datetime`, **not null**): The timestamp when the product was created.
-   **updated_at** (`datetime`, **not null**): The timestamp when the product was last updated.

### Indexes:

-   **`index_products_on_user_id`**: Index on the `user_id` column for fast lookups of products by user.

### Foreign Keys:

-   **`user_id`**: References the `users` table.

----------

## User Notifications Table

The `user_notifications` table stores notifications associated with messages for each user.

### Columns:

-   **user_id** (`bigint`, **not null**): The ID of the user receiving the notification. This is a foreign key referencing the `users` table.
-   **message_id** (`bigint`, **not null**): The ID of the message related to the notification. This is a foreign key referencing the `messages` table.
-   **read** (`boolean`, default: `false`, **not null**): Whether the notification has been read.
-   **created_at** (`datetime`, **not null**): The timestamp when the notification was created.
-   **updated_at** (`datetime`, **not null**): The timestamp when the notification was last updated.

### Indexes:

-   **`index_user_notifications_on_user_id`**: Index on the `user_id` column for fast lookups of notifications by user.
-   **`index_user_notifications_on_message_id`**: Index on the `message_id` column for fast lookups of notifications by message.

### Foreign Keys:

-   **`user_id`**: References the `users` table.
-   **`message_id`**: References the `messages` table.

----------

## Users Table

The `users` table stores information about users of the application.

### Columns:

-   **email** (`string`, **unique**, **not null**): The email address of the user.
-   **encrypted_password** (`string`, **not null**): The encrypted password for user authentication.
-   **user_type** (`string`, default: empty): A string indicating the user's role/type in the application (e.g., "admin", "customer").
-   **full_name** (`string`, **not null**): The full name of the user.
-   **phone_number** (`string`, **not null**): The phone number of the user.
-   **contact_preference** (`string`, **not null**): The user's preferred method of contact (e.g., "email", "phone").
-   **location** (`string`, **not null**): The physical location of the user.
-   **organization_type** (`string`, **not null**): The type of organization the user is associated with.
-   **reset_password_token** (`string`): The token used for resetting the user's password.
-   **reset_password_sent_at** (`datetime`): The timestamp when the password reset token was sent.
-   **remember_created_at** (`datetime`): The timestamp when the session was first created.
-   **created_at** (`datetime`, **not null**): The timestamp when the user was created.
-   **updated_at** (`datetime`, **not null**): The timestamp when the user was last updated.
-   **latitude** (`float`): The latitude coordinate of the user's location.
-   **longitude** (`float`): The longitude coordinate of the user's location.
-   **profile_message** (`text`): A message or bio displayed on the user's profile.

### Indexes:

-   **`index_users_on_email`**: Unique index on the `email` column.
-   **`index_users_on_reset_password_token`**: Unique index on the `reset_password_token` column.

----------

## Relationships Between Tables

-   **`messages`**:
    
    -   `sender_id` and `receiver_id` reference the `users` table, establishing a relationship between the sender and the receiver of a message.
-   **`user_notifications`**:
    
    -   The `user_id` column references the `users` table, indicating which user the notification belongs to.
    -   The `message_id` column references the `messages` table, linking each notification to a specific message.
-   **`products`**:
    
    -   The `user_id` column references the `users` table, linking each product to a specific user.

----------

## Indexes and Constraints

-   **Indexes**:
    -   Indexes are created on columns that are frequently queried (e.g., `sender_id`, `receiver_id`, `user_id`, and `message_id`) to speed up database lookups.
-   **Foreign Keys**:
    -   Foreign keys enforce referential integrity between related tables (e.g., `user_id` in `products`, `user_notifications`, and `messages`).

----------

## Editing the Schema

The schema file is auto-generated from the database's current state. To modify the schema, always use **ActiveRecord migrations** to be sure the schema changes are tracked and versioned.

-   **Create New Migrations**: Use `rails generate migration` to create new migrations.
-   **Run Migrations**: Use `rails db:migrate` to apply the changes to the database.
-   **Rollback Migrations**: Use `rails db:rollback` to undo the last migration.

