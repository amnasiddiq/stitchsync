ALTER TABLE `profiles` ADD COLUMN `password_hash` text;
ALTER TABLE `profiles` ADD COLUMN `password_salt` text;
CREATE TABLE `sessions` (
  `id` text PRIMARY KEY NOT NULL,
  `user_id` text NOT NULL,
  `expires_at` text NOT NULL,
  `created_at` text NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `profiles`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE INDEX `sessions_user_idx` ON `sessions` (`user_id`);
CREATE INDEX `sessions_expiry_idx` ON `sessions` (`expires_at`);
