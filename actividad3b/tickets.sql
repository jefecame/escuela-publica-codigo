-- MySQL database export

START TRANSACTION;

CREATE TABLE IF NOT EXISTS `incidents` (
    `incident_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `agent_id` INT NOT NULL,
    `service_id` INT NOT NULL,
    `status_id` INT NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `occurred_at` DATETIME NOT NULL,
    PRIMARY KEY (`incident_id`)
);


CREATE TABLE IF NOT EXISTS `services` (
    `service_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `price` FLOAT NOT NULL,
    `description` VARCHAR(255),
    PRIMARY KEY (`service_id`)
);


CREATE TABLE IF NOT EXISTS `interacions` (
    `interaction_id` INT NOT NULL,
    `incident_id` INT NOT NULL,
    `old_status_id` INT NOT NULL,
    `new_status_id` INT NOT NULL,
    `comments` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`interaction_id`)
);


CREATE TABLE IF NOT EXISTS `specializations` (
    `specialization_id` INT NOT NULL,
    `area` VARCHAR(255) NOT NULL UNIQUE,
    `description` VARCHAR(255),
    PRIMARY KEY (`specialization_id`)
);


CREATE TABLE IF NOT EXISTS `statuses` (
    `status_id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL UNIQUE,
    `description` VARCHAR(255),
    PRIMARY KEY (`status_id`)
);


CREATE TABLE IF NOT EXISTS `customers` (
    `customer_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255),
    `phone` VARCHAR(255),
    PRIMARY KEY (`customer_id`)
);


CREATE TABLE IF NOT EXISTS `agents` (
    `agent_id` INT NOT NULL,
    `specialization_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (`agent_id`)
);


CREATE TABLE IF NOT EXISTS `categories` (
    `category_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `description` VARCHAR(255),
    PRIMARY KEY (`category_id`)
);


-- Foreign key constraints

ALTER TABLE `agents`
ADD CONSTRAINT `fk_agents_agent_id` FOREIGN KEY(`agent_id`) REFERENCES `incidents`(`agent_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `categories`
ADD CONSTRAINT `fk_categories_category_id` FOREIGN KEY(`category_id`) REFERENCES `incidents`(`category_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `customers`
ADD CONSTRAINT `fk_customers_customer_id` FOREIGN KEY(`customer_id`) REFERENCES `incidents`(`customer_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `incidents`
ADD CONSTRAINT `fk_incidents_incident_id` FOREIGN KEY(`incident_id`) REFERENCES `interacions`(`incident_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `services`
ADD CONSTRAINT `fk_services_service_id` FOREIGN KEY(`service_id`) REFERENCES `incidents`(`service_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `specializations`
ADD CONSTRAINT `fk_specializations_specialization_id` FOREIGN KEY(`specialization_id`) REFERENCES `agents`(`specialization_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `statuses`
ADD CONSTRAINT `fk_statuses_status_id` FOREIGN KEY(`status_id`) REFERENCES `incidents`(`status_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `statuses`
ADD CONSTRAINT `fk_statuses_status_id` FOREIGN KEY(`status_id`) REFERENCES `interacions`(`old_status_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `statuses`
ADD CONSTRAINT `fk_statuses_status_id` FOREIGN KEY(`status_id`) REFERENCES `interacions`(`new_status_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;

COMMIT;
