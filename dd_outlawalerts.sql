INSERT INTO `items` (name, label, weight) VALUES
	('scanner', 'Police Scanner', 2),
;

ALTER TABLE `users`
    ADD COLUMN `outlaw` varchar(100) NULL DEFAULT NULL
;
