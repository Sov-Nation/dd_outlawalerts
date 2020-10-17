INSERT INTO `items` (name, label, weight) VALUES
	('scanner', 'Police Scanner', 2),
;

ALTER TABLE `users`
    ADD COLUMN `outlaw` TINYINT(100) 0 DEFAULT 0
;
